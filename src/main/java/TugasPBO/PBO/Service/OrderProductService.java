package TugasPBO.PBO.Service;

import TugasPBO.PBO.Entity.Product;
import TugasPBO.PBO.Entity.orderProduct;
import TugasPBO.PBO.Repository.OrderProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
@Service
public class OrderProductService {
    @Autowired
    public OrderProductRepository orderProductRepository;

    public List<orderProduct> allOrderProduct(){return orderProductRepository.findAll();}
    public Optional<orderProduct> singleOrderProduct(String id){
        return orderProductRepository.findById(id);
    }

    public void saveOrderProduct(orderProduct orderProduct) {
        orderProductRepository.save(orderProduct);
    }

    public void deleteAllOrderProducts() {
        orderProductRepository.deleteAll();
    }
    public void deleteSingleOrderProduct(String id){
        orderProductRepository.deleteById(id);
    }
}
