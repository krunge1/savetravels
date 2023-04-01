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
	<h1>Save Travels</h1>
	<table class="table table-border">
	  <thead class="thead-dark">
	    <tr>
	    	<th scope="col">Expense</th>
	      	<th scope="col">Vendor</th>
 		    <th scope="col">Amount</th>
	      	<th scope="col">Actions</th> 		    
	   </tr>
	  </thead>
	  <tbody>
		 <c:forEach var="expense" items="${expenses}">
		    <tr>
	    		<td><a href="expenses/${expense.id}">${expense.expenseName}</a><td>
	    		<td>${expense.vendor}<td>
	    		<td>${expense.amount}<td>
	    		<td><a href="/expenses/edit/${expense.id}">edit</a>
	    		<form:form action="/expenses/${expense.id}" method="put" modelAttribute="expense">
  			    <td><input type="hidden" name="_method" value="delete">
  			    <input type="submit" value="Delete"></td>
  			    </form:form>
	   	    </tr>
	   	</c:forEach>
	  </tbody>
	</table> 
	<h2>Add an expense:</h2>
	<div class="form_box">
    <form:form action="/expenses" method="post" modelAttribute="expense">
    	<div class="mb-3">
    		<form:label path="expenseName" class="form-label">Expense Name:</form:label>
    		<form:errors path="expenseName" class="text-danger"/>
    		<form:input path="expenseName"/>
    	</div>
    	<div class="mb-3">
 	    	<form:label path="vendor" class="form-label">Vendor:</form:label>
    		<form:errors path="vendor" class="text-danger"/>
    		<form:input path="vendor"/>
       	</div>
    	<div class="mb-3">
    		<form:label path="amount" class="form-label">Amount:</form:label>
    		<form:errors path="amount" class="text-danger"/>
    		<form:input type="number" path="amount"/>
    	</div>
 	    <div class="mb-3">
 	        <form:label path="description" class="form-label">Description:</form:label>
    		<form:errors path="description" class="text-danger"/>
    		<form:textarea path="description" rows="3"/>
    	</div>    
 	    <button type="submit" class="btn btn-primary" value="submit_form">Submit</button>
    </form:form>
    </div>
</body>
</html>
