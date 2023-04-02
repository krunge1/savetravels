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
	<div class="header display_flex">
	<h1 class="blue_text">Edit Travels</h1>
	<a href="/expenses">Go Back</a>
	</div>
	<div class="form_box container">
    <form:form action="/expenses/${expense.id}" method="post" modelAttribute="expense">
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
    		<form:input type="number" path="amount" class="col"/>
    	</div>
 	    <div class="mb-3 row">
 	        <form:label path="description" class="form-label col">Description:</form:label>
    		<form:errors path="description" class="text-danger"/>
    		<form:textarea path="description" rows="3" class="col"/> 
    	</div>    
 	    <button type="submit" class="btn btn-primary" value="submit_form">Update</button>
    </form:form>
    </div>
</body>
</html>
