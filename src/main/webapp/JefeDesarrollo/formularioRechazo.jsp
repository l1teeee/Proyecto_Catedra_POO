<%--
  Created by IntelliJ IDEA.
  User: aleja
  Date: 12/04/2023
  Time: 11:56 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Formulario</title>
    <link rel="stylesheet" type="text/css" href="../css/estilo.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <title>Principal</title>
</head>
<nav class="navbar bg-dark"  data-bs-theme="dark">
    <div class="container-fluid">
        <a class="navbar-brand"><img src="../util/logo.png" href="" id="logo"></a>
        <form class="d-flex" role="search">
            <input class="form-control me-2" type="search" placeholder="" value="${param.usuID}" aria-label="Search" disabled>
        </form>
    </div>
</nav>
<body style="background: #FFFBF5">
<div class="container">

    <form class="row g-3" id="ingreso">
        <h1 class="text-center">${param.cabecera}</h1>

        <div class="mb-3">
            <label for="disabledTextInput" class="form-label">${param.titu_caso}</label>
            <input type="text" id="disabledTextInput" class="form-control" placeholder="" value="${param.casoCod}" disabled>
        </div>
        <div class="col-12">
            <label for="exampleFormControlTextarea1" class="form-label">${param.titu_descrip}</label>
            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="${param.descripcion}" disabled></textarea>
        </div>
        <div class="col-12">
            <label for="exampleFormControlTextarea1" class="form-label">${param.titu_recha}</label>
            <textarea class="form-control" id="exampleFormControlTextarea2" rows="3" placeholder="Digite su razón" ></textarea>
        </div>
        <div class="btn-group" role="group" aria-label="Basic mixed styles example">
            <a class="btn bg-danger" href="controller.jsp?operacion=verificacion">Rechazar el caso</a>
            <a class="btn btn-primary" href="controller.jsp?operacion=regresar&amp;usuID=${param.usuID}">Regresar</a>
        </div>
    </form>
</div>
</body>
</html>
