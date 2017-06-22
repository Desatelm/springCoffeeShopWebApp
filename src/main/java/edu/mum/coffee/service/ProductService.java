package edu.mum.coffee.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.coffee.domain.Product;
import edu.mum.coffee.domain.ProductType;
import edu.mum.coffee.repository.ProductRepository;

@Service
@Transactional
public class ProductService {
	String[] imageUrls = { "/images/img.jpe", "/images/img2.jpe", "/images/img1.jpe", "/images/download.jpe",
			"/images/images.jpe", "/images/images1.jpe" };
	@Autowired
	private ProductRepository productRepository;

	public Product save(Product product) {
		return productRepository.save(product);
	}

	public void delete(Product product) {
		productRepository.delete(product);
	}

	public Product getProduct(int productId) {
		return productRepository.findOne(productId);
	}

	public List<Product> getAllProduct() {
		List<Product> products = productRepository.findAll();
		List<Product> productt = new ArrayList<>();
		int cnt = 0;
		for (Product product : products) {
			if (cnt < imageUrls.length) {
				product.setImg(imageUrls[cnt]);
				productt.add(product);
				cnt++;
			} else {
				cnt = 0;
			}
		}
		return productt;
	}

	public List<Product> findByTextSearch(String criteria) {
		if (!criteria.contains("%")) {
			criteria = "%" + criteria + "%";
		}
		return productRepository.findByProductNameLikeOrDescriptionLikeAllIgnoreCase(criteria, criteria);
	}

	public List<Product> findByPrice(double minPrice, double maxPrice) {
		return productRepository.findByPriceBetween(minPrice, maxPrice);
	}

	public List<Product> findByProductType(ProductType productType) {
		return productRepository.findByProductType(productType);
	}

}
