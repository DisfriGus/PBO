package TugasPBO.PBO.Controller;

import TugasPBO.PBO.Entity.Product;
import TugasPBO.PBO.Entity.orderProduct;
import TugasPBO.PBO.Service.OrderProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/orderProduct")
public class OrderProductController {
    @Autowired
    private OrderProductService orderProductService;
    @PostMapping
    public ResponseEntity<String> tambahItem(@RequestBody orderProduct orderProduct) {
        System.out.println("Menambahkan Item "+orderProduct.getProduct().getNamaProduct()+" ke Keranjang");
        orderProductService.saveOrderProduct(orderProduct);
        return ResponseEntity.status(HttpStatus.CREATED).body("Added"+orderProduct.getProduct().getId());
    }

    @GetMapping
    public ResponseEntity<List<orderProduct>> getAllOrderProduct(){
        return  new ResponseEntity<List<orderProduct>>(orderProductService.allOrderProduct(), HttpStatus.OK);
    }
    @DeleteMapping("/deleteAll")
    public ResponseEntity<String> deleteAllOrderProducts() {
        orderProductService.deleteAllOrderProducts();
        System.out.println("Menghapus Semua OrderProduct");
        return ResponseEntity.status(HttpStatus.OK).body("All order products deleted successfully");
    }
    @DeleteMapping("/{id}")
    public ResponseEntity<String> HapusItem(@PathVariable String id){
        try {
            orderProductService.deleteSingleOrderProduct(id);
            System.out.println("Menghapus OrderProduct dengan id: "+id);
            return ResponseEntity.status(HttpStatus.OK).body("Delete item Successful");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error deleting item: " + e.getMessage());
        }
    }

}
