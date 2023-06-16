package com.chocoDelicacies.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chocoDelicacies.entities.Products;

public interface ProductsRepository extends JpaRepository<Products,Long>{
    
}
