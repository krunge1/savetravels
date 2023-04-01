package com.krunge.savetravels.repositories;

import java.util.List;
import org.springframework.data.repository.CrudRepository;
import com.krunge.savetravels.models.Expense;



public interface ExpenseRepo extends CrudRepository<Expense, Long>{
	// this method retrieves all expenses from database
	List<Expense> findAll();
	
	// this method retrieves an expense from database by id
	Expense findById(Expense id);
	
	// this method retrieves an expense from database by id
	Expense deleteById(Expense id);

}
