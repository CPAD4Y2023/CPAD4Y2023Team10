package com.chocoDelicacies.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Getter
@ToString
@NoArgsConstructor
public class Products{
    @Id
    private Long productId;
    private String productName;
    private String productTitle;
    private int price;
    private String productDescription;
    private String productImageURL;
    public Long getProductId() {
        return productId;
    }
    public void setProductId(Long productId) {
        this.productId = productId;
    }
    public String getProductName() {
        return productName;
    }
    public void setProductName(String productName) {
        this.productName = productName;
    }
    public String getProductTitle() {
        return productTitle;
    }
    public void setProductTitle(String productTitle) {
        this.productTitle = productTitle;
    }
    public int getPrice() {
        return price;
    }
    public void setPrice(int price) {
        this.price = price;
    }
    public String getProductDescription() {
        return productDescription;
    }
    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }
    public String getProductImageURL() {
        return productImageURL;
    }
    public void setProductImageURL(String productImageURL) {
        this.productImageURL = productImageURL;
    }
    public Products(Long productId, String productName, String productTitle, int price, String productDescription,
            String productImageURL) {
        this.productId = productId;
        this.productName = productName;
        this.productTitle = productTitle;
        this.price = price;
        this.productDescription = productDescription;
        this.productImageURL = productImageURL;
    }
}