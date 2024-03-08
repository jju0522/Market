<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.dto.Product"%>
<%@ page import="com.dao.ProductRepository"%>
<%@ include file="dbconn.jsp"%>
<%
    String id = request.getParameter("id");
    
    if (id == null || id.trim().equals("")) {
        response.sendRedirect("products.jsp");
        return;
    }
    
    Product product = null; // db로 연결되도록 수정
    
    //  ProductRepository dao = ProductRepository.getInstance();
    //  Product product = dao.getProductById(id);
    
    try {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
    
        // 아래 코드에서 product를 초기화해야 함
        product = new Product();
    
        String sql = "select * from product where p_id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();
        
        if (rs.next()) {
            product.setProductId(rs.getString("p_id"));
            product.setPname(rs.getString("p_name"));
            product.setUnitPrice(rs.getInt("p_unitprice"));
            product.setDescription(rs.getString("p_description"));
            product.setUnitsInStock(rs.getLong("p_unitsInStock"));
            product.setCondition(rs.getString("p_condition"));
            product.setFilename(rs.getString("p_filename"));
        } else {
            response.sendRedirect("exceptionNoProductId.jsp");
            return;
        }
    } catch (SQLException e) {
        // SQL 예외 처리
        e.printStackTrace();
    } finally {
        // 연결, 문장 및 결과 집합 닫기
    }
    
    // ArrayList<Product> goodsList = dao.getAllProducts();
    //  ArrayList<Product> goodsList = db      // db로 연결되도록 수정
    
    // Product goods = new Product();
    // for (int i = 0; i < goodsList.size(); i++) {
    //  goods = goodsList.get(i);
    //  if (goods.getProductId().equals(id)) {
    //      break;
    //  }
    // }
    
    ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartlist");
    if (list == null) {
        list = new ArrayList<Product>();
        session.setAttribute("cartlist", list);
    }
    
    int cnt = 0;
    Product goodsQnt = new Product();
    for (int i = 0; i < list.size(); i++) {
        goodsQnt = list.get(i);
        if (goodsQnt.getProductId().equals(id)) {
            cnt++;
            int orderQuantity = goodsQnt.getQuantity() + 1;
            goodsQnt.setQuantity(orderQuantity);
        }
    }
    
    if (cnt == 0 && product != null) { // product가 null이 아닌 경우에만 실행
        product.setQuantity(1);
        list.add(product);
    }
    
    response.sendRedirect("product.jsp?id=" + id);
%>
