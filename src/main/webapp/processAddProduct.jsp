<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%@ page import="com.dto.Product" %>
<%-- <%@ page import="com.dao.ProductRepository" %> --%>

<%

	request.setCharacterEncoding("UTF-8");

	String filename = "";
// 	String realFolder = "C:\\upload";	// 웹 애플리케이션상의 절대 경로
	String realFolder = getServletContext().getRealPath("/upload2");
	System.out.println(realFolder);
	
	int maxSize = 5 * 1024 * 1024;		// 최대 업로드될 파일의 크기 5MB
	String encType = "utf-8";			// 인코딩 유형
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, 
	maxSize, encType, new DefaultFileRenamePolicy());

	String productId = multi.getParameter("productId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	
	Integer price;
	
	if(unitPrice.isEmpty())
	{
		price = 0;
	}
	else
	{
		price = Integer.valueOf(unitPrice);
	}
	
	long stock;
	
	if(unitsInStock.isEmpty())
	{
		stock = 0;
	}
	else
	{
		stock = Long.valueOf(unitsInStock);
	}
	
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);

// 	ProductRepository dao = ProductRepository.getInstance();
	
	PreparedStatement pstmt = null;

	Product newProduct = new Product();
	newProduct.setProductId(productId);
	newProduct.setPname(name);
	newProduct.setUnitPrice(price);
	newProduct.setDescription(description);
	newProduct.setUnitsInStock(stock);
	newProduct.setCondition(condition);
	newProduct.setFilename(fileName);

// 	dao.addProduct(newProduct);
	
	String sql = "INSERT INTO product VALUES(?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	pstmt.setString(2, name);
	pstmt.setInt(3, price);
	pstmt.setString(4, description);
	pstmt.setLong(5, stock);
	pstmt.setString(6, condition);
	pstmt.setString(7, fileName);
	pstmt.executeUpdate();
	
	if (pstmt != null) {
		pstmt.close();
	}
	if (conn != null) {
		conn.close();
	}

	response.sendRedirect("products.jsp");
%>