/**
 * 
 */
package edu.mum.coffee.wsController;
/**
 * @author destalem
 *
 */
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import edu.mum.coffee.domain.Order;
import edu.mum.coffee.service.OrderService;


@RestController
public class OrderRestController {
	
	@Autowired
	private OrderService orderService;

	
	@GetMapping(value = "Rest/order")
	public List<Order> getAll() {
		return orderService.findAll();
	}

	@PostMapping(value = "Rest/order")
	public String addOrder(@RequestBody Order order) {
		orderService.save(order);
		return "successful";
	}
}
