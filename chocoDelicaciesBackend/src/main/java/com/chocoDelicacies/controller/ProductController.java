package com.chocoDelicacies.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.chocoDelicacies.service.ProductsService;
import com.chocoDelicacies.entities.Products;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class ProductController {
    @Autowired
    private final ProductsService service;

    @GetMapping(value="/products", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<Products> getProducts(){
        return service.getAllProducts();
    }

     @GetMapping(value = "/products/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public Products getProduct(@PathVariable long id){
        return service.getById(id).orElseThrow(()-> new ResponseStatusException(HttpStatus.NOT_FOUND, String.format("Invalid product id %s", id)));
    }

    @PostMapping(value = "/products", consumes = MediaType.APPLICATION_JSON_VALUE,produces = MediaType.APPLICATION_JSON_VALUE)
    public Products createProduct(@Validated @RequestBody Products product){
        return service.save(product);
    }
}
