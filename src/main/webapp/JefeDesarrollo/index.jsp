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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">    <title>Principal</title>
</head>
<body>
<div class="container">
    <h1 class="text-center">Casos pendientes</h1>
    <form>
        <fieldset disabled>
            <div class="input-group mb-3">
                <span class="input-group-text" id="basic-addon1">ID</span>
                <input type="text" class="form-control" placeholder="Id de usuario" aria-label="Username" aria-describedby="basic-addon1">
            </div>
        </fieldset>
    </form>
    <sql:query var="q" dataSource="jdbc/mysql">
        SELECT casos.Codigo, casos.Tipo, casos.Descripcion, casos.Nombre, departamentos.Nombre as DepartamentoNombre, casos.Departamento
        FROM casos
        JOIN departamentos ON casos.Departamento = departamentos.id
    </sql:query>
    <%-- <sql:query var="q" dataSource="jdbc/mysql">
         SELECT * FROM casos
     </sql:query>--%>


    <br>
    <br>
    <table class="table table-striped table-bordered table-hover">
        <thead>
        <tr>
            <th>Codigo</th>
            <th>Tipo</th>
            <th>Descripcion</th>
            <th>Nombre de Proyecto</th>
            <th>Departamento</th>
            <th>Departamento ID</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach var="casos" items="${q.rows}">
            <tr>
                <td>${casos.Codigo}</td>
                <td>${casos.Tipo}</td>
                <td>${casos.Descripcion}</td>
                <td>${casos}</td>
                <td>${casos.Nombre}</td>
                <td>${casos.Departamento}</td>
                <td>
                    <a class="btn bg-primary" href="controller.jsp?operacion=verificacion&amp;id=${casos.Codigo}&amp;tipo=${casos.Tipo}&amp;descripcion=${casos.Descripcion}&amp;nombre=${casos.Nombre}&amp;departamento=${casos.Departamento}">Verificar</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <c:if test="${not empty param.mensaje}">
        <div class="alert alert-success">
            <strong>Correcto! </strong><c:out value="${param.mensaje}"/>
            <br>
        </div>
    </c:if>
</div>
</body>
</html>
