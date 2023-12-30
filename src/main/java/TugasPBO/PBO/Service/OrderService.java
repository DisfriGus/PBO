package TugasPBO.PBO.Service;

import TugasPBO.PBO.Entity.Order;
import TugasPBO.PBO.Entity.orderProduct;
import TugasPBO.PBO.Repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OrderService {
    @Autowired
    public OrderRepository orderRepository;

    public List<Order> allOrder(){return orderRepository.findAll();}
    public Optional<Order> singleOrder(String id){
        return orderRepository.findById(id);
    }

    public void saveOrder(Order order) {
        orderRepository.save(order);
    }


}
