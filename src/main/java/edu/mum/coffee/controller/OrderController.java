/**
 * 
 */
package edu.mum.coffee.controller;
/**
 * @author destalem
 *
 */
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import edu.mum.coffee.domain.Order;
import edu.mum.coffee.service.OrderService;


@Controller
public class OrderController {
	
	@Autowired
	private OrderService orderService;

	
	@GetMapping(value = "/order")
	public List<Order> getAll() {
		return orderService.findAll();
	}

	@PostMapping(value = "/order")
	public String addOrder(Order order) {
		orderService.save(order);
		return "successful";
	}
}
