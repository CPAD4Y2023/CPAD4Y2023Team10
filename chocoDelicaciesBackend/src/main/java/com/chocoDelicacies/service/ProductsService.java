package com.chocoDelicacies.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.chocoDelicacies.repositories.ProductsRepository;
import com.chocoDelicacies.entities.Products;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ProductsService {
    private final ProductsRepository productRepository;
    public List<Products> getAllProducts(){
        return productRepository.findAll();
    }
    
    public Optional<Products> getById(final Long id){
        return productRepository.findById(id);
    }

    public Products save(Products product){
        return productRepository.save(product);
    }
}
