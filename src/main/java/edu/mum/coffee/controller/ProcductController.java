package edu.mum.coffee.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.mum.coffee.domain.Product;
import edu.mum.coffee.domain.ProductType;
import edu.mum.coffee.service.ProductService;

/**
 * @author destalem
 *
 */

@Controller
public class ProcductController {
	@Autowired
	private ProductService productService;

	@GetMapping({ "success" })

	public String addOrder() {

		return "Successful";
	}

	@GetMapping(value = "/")
	public String getAll(Model model) {		
		model.addAttribute("products", productService.getAllProduct());
		return "welcome";
	}
	@GetMapping(value = "/addProduct")
	public String addProduct(Model model) {			
		return "addProduct";
	}

	@PostMapping(value = "/addProduct")
	public String addOrder(Product product, ProductType productType) {
		product.setProductType(productType);
		productService.save(product);
		return "redirect:/";
	}
	
	@RequestMapping(value = "deleteProduct/{id}", method = RequestMethod.POST)
	public String deleteProduct(@PathVariable int id) {
		productService.delete( productService.getProduct(id));
		return "redirect:/";
	}	
	@RequestMapping(value = "editProduct/{id}", method = RequestMethod.POST)
	public String editProduct(Model model, @PathVariable("id") int productId) {
		Product product = productService.getProduct(productId);
		model.addAttribute(product);
		return "updateProduct";
	}

	@RequestMapping(value = "updateProduct/{id}", method = RequestMethod.POST)
	public String update(@PathVariable("id") int productId,  Product product,ProductType productType) {
		Product pro = productService.getProduct(productId);
		pro = product;
		pro.setProductType(productType);
	    productService.save(pro);
	    return "redirect:/";
	}

}
