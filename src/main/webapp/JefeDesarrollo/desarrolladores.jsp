<%--
  Created by IntelliJ IDEA.
  User: aleja
  Date: 24/04/2023
  Time: 12:32 p. m.
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">    <title>Desarrolladores</title>
</head>

<nav class="navbar bg-dark"  data-bs-theme="dark">
    <div class="container-fluid">
        <a class="navbar-brand"><img src="../util/logo.png" href="" id="logo"></a>
        <form class="d-flex" role="search">
            <input class="form-control me-2" type="search" placeholder="" value="${param.IDusu}" aria-label="Search" disabled>
        </form>
    </div>
</nav>
<sql:query var="casosRechazados" dataSource="jdbc/mysql">
    SELECT Nombre, Apellido, Telefono, Correo
    FROM usuarios
    WHERE id IN (
    SELECT id_desarrollador
    FROM jefedesarrollo_desarrollador
    WHERE id_jefe = ${param.IDusu}
    )
</sql:query>
<body style="background: #FFFBF5">
<div class="container" id="contai">
    <h1 class="text-center">Desarrolladores Asignados Disponibles</h1>
    <input type="hidden" value="${param.usuID}" name="IDusu" id="IDusu">

    <table class="table table-striped table-bordered table-hover">
        <thead>
        <tr >
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Telefono</th>
            <th>Correo</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="rechazados" items="${casosRechazados.rows}">
            <tr class="table-success">
                <td>${rechazados.Nombre}</td>
                <td>${rechazados.Apellido}</td>
                <td>${rechazados.Telefono}</td>
                <td>${rechazados.Correo}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <center>
        <br>
        <div class="btn-group" role="group" aria-label="Basic example">
            <a class="btn btn-primary" href="controller.jsp?operacion=home">Regresar</a>
        </div>
    </center>

    <c:if test="${not empty param.mensaje}">
        <br>
        <br>
        <div class="alert alert-success">
            <strong>Completada! </strong><c:out value="${param.mensaje}"/>
            <br>
        </div>
    </c:if>
    <c:if test="${not empty param.recha}">
        <br>
        <br>
        <div class="alert alert-danger">
            <strong>Se ha rechazado el caso! </strong><c:out value="${param.recha}"/>
            <br>
        </div>
    </c:if>
</div>

</body>
<!-- End -->


<!-- Footer -->
<footer class="bg-dark-subtle" id="foot">
    <!-- Copyrights -->
    <div class="bg-light py-4">
        <div class="container text-center">
            <p class="text-muted mb-0 py-2">TELECOM 2023</p>
        </div>
    </div>
</footer>
<!-- End -->

</html>
