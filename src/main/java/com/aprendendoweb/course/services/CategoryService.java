package com.aprendendoweb.course.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.aprendendoweb.course.entities.Category;
import com.aprendendoweb.course.repositories.CategoryRepository;

@Service
public class CategoryService {
   
   @Autowired  //injeção de dependencia de forma transparente ao programdor
   private CategoryRepository repository;
   
   public List<Category> findAll(){
	   
	   return repository.findAll();
   }
   
   public Category findById(Long id) {
	   
	   Optional<Category> obj = repository.findById(id);
	   return obj.get();
   }
   
     
}
