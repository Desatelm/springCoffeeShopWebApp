/**
 * 
 */
package edu.mum.coffee.controller;

import java.util.Date;
/**
 * @author destalem
 *
 */
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import edu.mum.coffee.domain.Order;
import edu.mum.coffee.domain.Orderline;
import edu.mum.coffee.domain.Person;
import edu.mum.coffee.domain.Product;
import edu.mum.coffee.service.OrderService;
import edu.mum.coffee.service.PersonService;
import edu.mum.coffee.service.ProductService;

@Controller
@SessionAttributes("order")
public class OrderController {

	@Autowired
	private OrderService orderService;
	@Autowired
	private PersonService personService;
	@Autowired
	private ProductService productService;

	@GetMapping(value = "/order")
	public String getAll(Model model) {
		model.addAttribute("orders", orderService.findAll());
		return "orderList";
	}

	@GetMapping(value = "/placeOrder/{id}")
	public String placeOrder(Model model, @PathVariable int id) {
		if (!model.containsAttribute("order")) {
			model.addAttribute("order", new Order());
		}
		model.addAttribute("product", productService.getProduct(id));
		return "placeOrder";
	}

	@GetMapping(value = "/orderLine/{id}")
	public String getOrderlines(Model model, @PathVariable int id) {
		double totalPrice = 0;
		int totalQuantity = 0;
		model.addAttribute("order_lines", orderService.findById(id).getOrderLines());
		for (Orderline orderline : orderService.findById(id).getOrderLines()) {
			totalPrice += orderline.getPrice();
			totalQuantity += orderline.getQuantity();
		}
		totalPrice *= totalQuantity;
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("totalQuantity", totalQuantity);
		return "Order_lines";
	}

	@GetMapping(value = "/orderLine")
	public String Orderlines(Model model, @ModelAttribute("order") Order order) {
		double totalPrice = 0;
		int totalQuantity = 0;

		model.addAttribute("order_lines", order.getOrderLines());
		for (Orderline orderline : order.getOrderLines()) {
			totalPrice += orderline.getPrice();
			totalQuantity += orderline.getQuantity();
		}
		totalPrice *= totalQuantity;
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("totalQuantity", totalQuantity);
		return "Order_lines";
	}

	@PostMapping(value = "/addToCart/{id}")
	public String addToCart(@RequestParam String email, Model mod, @ModelAttribute("order") Order order,
			Orderline orderline, @PathVariable int id) {
		Product product = productService.getProduct(id);

		orderline.setProduct(product);
		orderline.setOrder(order);
		order.addOrderLine(orderline);
		List<Person> person = personService.findByEmail(email);
		order.setPerson(person.get(0));
		order.setOrderDate(new Date());
		mod.addAttribute("order", order);

		return "redirect:/orderLine";
	}

	@PostMapping(value = "/shopping")
	public ModelAndView addToCart() {

		ModelAndView model = new ModelAndView("welcome");
		model.addObject("products", productService.getAllProduct());

		return model;
	}

	@PostMapping(value = "/order")
	public ModelAndView addOrder(@RequestParam String email, @ModelAttribute("order") Order order) {
		List<Person> person = personService.findByEmail(email);
		order.setPerson(person.get(0));
		order.setOrderDate(new Date());

		ModelAndView model = new ModelAndView("shoppingReciept");
		model.addObject("order_lines", order.getOrderLines());
		model.addObject("order", order);

		double totalPrice = 0;
		int totalQuantity = 0;
		for (Orderline orderline : order.getOrderLines()) {
			totalPrice += orderline.getPrice();
			totalQuantity += orderline.getQuantity();
		}
		totalPrice *= totalQuantity;
		model.addObject("totalPrice", totalPrice);
		model.addObject("totalQuantity", totalQuantity);
		orderService.save(order);
		return model;
	}
}
