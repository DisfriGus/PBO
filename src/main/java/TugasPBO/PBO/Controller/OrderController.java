package TugasPBO.PBO.Controller;

import TugasPBO.PBO.Entity.Order;
import TugasPBO.PBO.Entity.orderProduct;
import TugasPBO.PBO.Service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/api/v1/order")
public class OrderController {
    @Autowired
    public OrderService orderService;

    @PostMapping
    public ResponseEntity<String> saveOrder(@RequestBody Order order) {
        orderService.saveOrder(order);
        return ResponseEntity.status(HttpStatus.CREATED).body("Added"+order.getID());
    }

    @GetMapping
    public ResponseEntity<List<Order>> getOrder(){
        return  new ResponseEntity<List<Order>>(orderService.allOrder(), HttpStatus.OK);
    }

}
