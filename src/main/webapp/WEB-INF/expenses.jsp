<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--c:out ; c:forEach etc.-->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!-- formatting (dates -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>  

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Expenses</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="/style.css">
	<script type="text/javascript" src="/script.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    </head>
<body>
	<h1 class="header blue_text">Save Travels</h1>
	<table class="table table-dark table-striped-columns box_sizing">
	  <thead class="thead-dark">
	    <tr>
	    	<th>Expense</th>
	      	<th>Vendor</th>
 		    <th>Amount</th>
	      	<th>Actions</th> 		    
	   </tr>
	  </thead>
	  <tbody>
		 <c:forEach var="expense" items="${expenses}">
		    <tr>
	    		<td><a href="expenses/${expense.id}">${expense.expenseName}</a></td>
	    		<td>${expense.vendor}</td>
	    		<td><fmt:formatNumber value ="${expense.amount}" type="currency" minFractionDigits="2"/></td>
	    		<td>
	    		<div class="display_flex">    		
	    		<a href="/expenses/edit/${expense.id}">edit</a>
	    		<form:form action="/expenses/${expense.id}" method="put" modelAttribute="expense">
  			    <input type="hidden" name="_method" value="delete">
  			    <input type="submit" value="Delete" class="btn btn-danger">
  			    </form:form>
	    		</div>
  			    </td>
	   	    </tr>
	   	</c:forEach>
	  </tbody>
	</table> 
	<h2 class="header blue_text">Add an expense:</h2>
	<div class="form_box container">
    <form:form action="/expenses" method="post" modelAttribute="expense">
    	<div class="mb-3 row">
    		<form:label path="expenseName" class="form-label col">Expense Name:</form:label>
    		<form:errors path="expenseName" class="text-danger"/>
    		<form:input path="expenseName" class="col"/>
    	</div>
    	<div class="mb-3 row">
 	    	<form:label path="vendor" class="form-label col">Vendor:</form:label>
    		<form:errors path="vendor" class="text-danger"/>
    		<form:input path="vendor" class="col"/>
       	</div>
    	<div class="mb-3 row">
    		<form:label path="amount" class="form-label col">Amount:</form:label>
    		<form:errors path="amount" class="text-danger"/>
    		<form:input type="currency" minFractionDigits="2" path="amount" class="col"/>
    	</div>
 	    <div class="mb-3 row">
 	        <form:label path="description" class="form-label col">Description:</form:label>
    		<form:errors path="description" class="text-danger"/>
    		<form:textarea path="description" rows="3" class="col"/>
    	</div>    
 	    <button type="submit" class="btn btn-primary" value="submit_form">Submit</button>
    </form:form>
    </div>
</body>
</html>
