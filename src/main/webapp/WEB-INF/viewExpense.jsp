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
	<h1 class="green_text">Expense Details</h1>
	<a href="/expenses">Go Back</a>
	</div>
	<div class="container">
	<div class="row">
	<p class="col">Expense Name: </p>
	<p class="col"><c:out value="${expense.expenseName}"/></p>
	</div>
	<div class="row">
	<p class="col">Expense Description: </p>
	<p class="col"><c:out value="${expense.description}"/></p>
	</div>
	<div class="row">
	<p class="col">Vendor: </p>
	<p class="col"><c:out value="${expense.vendor}"/></p>
	</div>
	<div class="row">
	<p class="col">Amount Spent: </p>
	<p class="col"><fmt:formatNumber value ="${expense.amount}" type="currency"/></p>	
	</div>
    </div>
</body>
</html>
