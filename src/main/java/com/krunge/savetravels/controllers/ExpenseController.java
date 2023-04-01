package com.krunge.savetravels.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.krunge.savetravels.models.Expense;
import com.krunge.savetravels.services.ExpenseService;

@Controller
@RequestMapping("/expenses")
public class ExpenseController {
	@Autowired
	private ExpenseService eService;
	
	//show the expenses dashboard
	@GetMapping("")
	public String rExpensesShow(
			Model model,
			@ModelAttribute("expense") Expense expense
			) {
		List<Expense> expenses = eService.getAll();
		
		model.addAttribute("expenses", expenses);
		
		return "expenses.jsp";
	}
	
	@PostMapping("")
	public String pExpensesShow(
			@Valid @ModelAttribute("expense") Expense expense,
			BindingResult result,
			Model model
			) {
		if(result.hasErrors()) {
			model.addAttribute("expenses", eService.getAll());
			return "expenses.jsp";
		}
		eService.createOrUpdate(expense);
		return "redirect:/expenses";
	}
	
	@PutMapping("/{id}")
	public String pExpensesDelete(
			@PathVariable("id") Long expenseId
			) {
		eService.deleteById(expenseId);
		return "redirect:/expenses";
	}
	
	@GetMapping("/{id}")
	public String rExpense(@PathVariable("id") Long expenseId, Model model) {
		model.addAttribute("expense", eService.getById(expenseId));
		return "viewExpense.jsp";
	}
	
	@GetMapping("/edit/{id}")
	public String rExpenseEdit(
			@PathVariable("id") Long expenseId,
			Model model) {
		model.addAttribute("expense", eService.getById(expenseId));
		return "editExpense.jsp";
	}
	
	@PostMapping("/{id}")
	public String pExpenseEdit(
			@PathVariable("id") Long expenseId,
			@Valid @ModelAttribute("expense") Expense expense,
			BindingResult result,
			Model model) {
		
		if (result.hasErrors()) {
		model.addAttribute("expense", eService.getById(expenseId));
		return "editExpense.jsp";
		}
		else {
			eService.createOrUpdate(expense);
			return "redirect:/expenses";
		}
	}
}
