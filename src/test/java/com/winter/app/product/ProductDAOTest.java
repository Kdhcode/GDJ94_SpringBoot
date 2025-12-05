package com.winter.app.product;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class ProductDAOTest {

    @Autowired
    private ProductDAO productDAO;

    @Test
    void testAdd() throws Exception {
        for (int i = 0; i < 100; i++) {
            ProductDTO productDTO = new ProductDTO();
            productDTO.setProductName("productName" + i);
            productDTO.setProductContents("productContents" + i);
            productDTO.setProductCategory("category" + (i % 5));
            //productDTO.setProductRate(new java.math.BigDecimal("3.50"));
            productDTO.setProductSale(i % 2 == 0);

            productDAO.add(productDTO);
        }
    }
}
