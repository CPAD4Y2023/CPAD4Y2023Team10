package com.chocoDelicacies.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "products")
public class Products{
    @Id
    private Long productId;
    private String productName;
    private String productTitle;
    private int price;
    private String productDescription;
    private String category;
    private String productImageURL;
    public void setProductId(Long productId) {
        this.productId = productId;
    }
    public void setProductName(String productName) {
        this.productName = productName;
    }
    public void setProductTitle(String productTitle) {
        this.productTitle = productTitle;
    }
    public void setPrice(int price) {
        this.price = price;
    }
    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }
    public void setCategory(String category) {
        this.category = category;
    }
    public void setProductImageURL(String productImageURL) {
        this.productImageURL = productImageURL;
    }    
}