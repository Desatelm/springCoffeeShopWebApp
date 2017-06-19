package edu.mum.coffee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.mum.coffee.domain.Product;
import edu.mum.coffee.service.ProductService;

/**
 * @author destalem
 *
 */

@Controller
public class ProcductController {
	@Autowired
	private ProductService productService;

	@GetMapping({ "/success" })

	public String addOrder() {

		return "successful";
	}

	@GetMapping(value = "/")
	public String getAll(Model model) {		
		model.addAttribute("products", productService.getAllProduct());
		return "welcome";
	}

	@PostMapping(value = "/product")
	public Product addOrder(@RequestBody Product product) {
		productService.save(product);
		return product;
	}

	@DeleteMapping(value = "delete/product")
	public Product delete(@RequestBody Product product) {
		productService.delete(product);
		return product;
	}

	@RequestMapping(value = "product/productId", method = RequestMethod.POST)
	public Product update(@PathVariable int productId, @RequestBody Product product) {
		Product pro = productService.getProduct(productId);
		pro = product;
		return productService.save(pro);
	}

}
