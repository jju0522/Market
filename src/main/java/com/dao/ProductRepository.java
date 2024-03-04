package com.dao;

import java.util.ArrayList;

import com.dto.Product;

public class ProductRepository {
	private ArrayList<Product> listOfProducts;
	private static ProductRepository instance = new ProductRepository();

	public static ProductRepository getInstance() {
		return instance;
	}
	
	public ProductRepository() {
		listOfProducts = new ArrayList<Product>();

		Product P1 = new Product("P0001", "상품1", 10000);
		P1.setDescription("미인을 구하기 위하여서 그리하였는가? 아니다 그들은 커다란 이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길을 찾아 주며 그들을 행복스럽고 평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다 그러므로 그들은 길지 아니한 목숨을");
		P1.setUnitsInStock(2);
		P1.setCondition("중고");
		P1.setFilename("P0001.png");

		Product P2 = new Product("P0002", "상품2", 20000);
		P2.setDescription("이성은 투명하되 얼음과 같으며 지혜는 날카로우나 갑 속에 든 칼이다 청춘의 끓는 피가 아니더면 인간이 얼마나 쓸쓸하랴? 얼음에 싸인 만물은 얼음이 있을 뿐이다 그들에게 생명을 불어 넣는 것은 따뜻한 봄바람이다 풀밭에 속잎나고");
		P2.setUnitsInStock(1);
		P2.setCondition("새상품");
		P2.setFilename("P0002.png");

		Product P3 = new Product("P0003", "상품3", 15000);
		P3.setDescription("뿐이다 낙원을 장식하는 천자만홍이 어디 있으며 인생을 풍부하게 하는 온갖 과실이 어디 있으랴? 이상! 우리의 청춘이 가장 많이 품고 있는 이상! 이것이야말로 무한한 가치를 가진 것이다 사람은 크고 작고 간에 이상이 있음으로써");
		P3.setUnitsInStock(3);
		P3.setCondition("새상품");
		P3.setFilename("P0003.png");
		
		Product P4 = new Product("P0004", "상품4", 5000);
		P4.setDescription("뿐이다 낙원을 장식하는 천자만홍이 어디 있으며 인생을 풍부하게 하는 온갖 과실이 어디 있으랴? 이상! 우리의 청춘이 가장 많이 품고 있는 이상! 이것이야말로 무한한 가치를 가진 것이다 사람은 크고 작고 간에 이상이 있음으로써");
		P4.setUnitsInStock(5);
		P4.setCondition("중고");
		P4.setFilename("P0004.png");

		listOfProducts.add(P1);
		listOfProducts.add(P2);
		listOfProducts.add(P3);
		listOfProducts.add(P4);

	}

	public ArrayList<Product> getAllProducts() {
		return listOfProducts;
	}

	public Product getProductById(String productId) {
		Product productById = null;

		for (int i = 0; i < listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			if (product != null && product.getProductId() != null && product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}

		return productById;

	}
	
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
}
