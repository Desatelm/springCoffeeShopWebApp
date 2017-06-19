package edu.mum.coffee.wsController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import edu.mum.coffee.domain.Product;
import edu.mum.coffee.service.ProductService;

/**
 * @author destalem
 *
 */

@RestController
public class ProcductRestController {
	@Autowired
	private ProductService productService;
	
	@GetMapping(value = "Rest/product")
	public List<Product> getAll() {
		return productService.getAllProduct();
	}

	@PostMapping(value = "Rest/product")
	public Product addOrder(@RequestBody Product product) {
		productService.save(product);
		return product;
	}

	@DeleteMapping(value = "Rest/delete/product")
	public Product delete(@RequestBody Product product) {
		productService.delete(product);
		return product;
	}

	@RequestMapping(value = "Rest/product/productId", method = RequestMethod.POST)
	public Product update(@PathVariable int productId, @RequestBody Product product) {
		Product pro = productService.getProduct(productId);
		pro = product;
		return productService.save(pro);
	}

}
