<%--
  Created by IntelliJ IDEA.
  User: aleja
  Date: 12/04/2023
  Time: 11:53 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="../css/estilo.css">

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">    <title>Principal</title>
</head>

<nav class="navbar bg-dark"  data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand"><img src="../util/logo.png" href="" id="logo"></a>
    <form class="d-flex" role="search">
      <input class="form-control me-2" type="search" placeholder="ID" aria-label="Search" disabled>
    </form>
  </div>
</nav>
<body style="background: #FFFBF5">
<div class="container">
  <h1 class="text-center">Casos pendientes</h1>
  <%-- <sql:query var="q" dataSource="jdbc/mysql">
      SELECT casos.Codigo, casos.Tipo, casos.Descripcion, casos.Nombre, departamentos.Nombre as DepartamentoNombre, casos.Departamento
      FROM casos
      JOIN departamentos ON casos.Departamento = departamentos.id
  </sql:query>--%>
  <div class="card text-center">
    <div class="card-header">
      Featured
    </div>
    <div class="card-body">
      <h5 class="card-title">Special title treatment</h5>
      <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
      <a href="#" class="btn btn-primary">Go somewhere</a>
    </div>
    <div class="card-footer text-body-secondary">
      2 days ago
    </div>
  </div>

  <c:if test="${not empty param.mensaje}">
    <div class="alert alert-success">
      <strong>Correcto! </strong><c:out value="${param.mensaje}"/>
      <br>
    </div>
  </c:if>
</div>

</body>
</html>
