package com.krunge.savetravels.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.krunge.savetravels.models.Expense;
import com.krunge.savetravels.repositories.ExpenseRepo;

@Service
public class ExpenseService {
	@Autowired
	private ExpenseRepo eRepo;
	
	//create new expense
	public Expense createOrUpdate(Expense newEntity) {
		return eRepo.save(newEntity);
	}
	
	//Get all expenses in database
	public List<Expense> getAll(){
		return eRepo.findAll();
		
	}
	
	//Get expense by id in database
	public Expense getById(Long id) {
		Optional<Expense> optionalExpense = eRepo.findById(id);
		if(optionalExpense.isPresent()) {
			return optionalExpense.get();
		}
		else {
			return null;
		}
	}
	
	//Delete expense by id in database
	public void deleteById(Long id) {
		Optional<Expense> optionalExpense = eRepo.findById(id);
		if(optionalExpense.isPresent()) {
			eRepo.deleteById(id);
		}
	
	}
	
}
