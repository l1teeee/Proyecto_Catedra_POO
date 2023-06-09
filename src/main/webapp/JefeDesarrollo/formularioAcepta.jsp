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
    <title>Formulario de Aceptación</title>
    <link rel="stylesheet" type="text/css" href="../css/estilo.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<nav class="navbar bg-dark"  data-bs-theme="dark">
    <div class="container-fluid">
        <a class="navbar-brand"><img src="../util/logo.png" href="" id="logo"></a>
        <form class="d-flex" role="search">
            <input class="form-control me-2" type="search" placeholder="" value="${param.usuID}" aria-label="Search" disabled>
        </form>
    </div>
</nav>
<sql:query var="desa" dataSource="jdbc/mysql">
    SELECT Id, Nombre, Apellido, Telefono
    FROM usuarios
    WHERE Id IN (
    SELECT id_desarrollador
    FROM jefedesarrollo_desarrollador
    WHERE id_jefe = '${param.usuID}'
    ) AND NOT EXISTS (
    SELECT *
    FROM caso_desarrollo
    WHERE caso_desarrollo.id_Desarrollador = usuarios.Id
    );
</sql:query>
<sql:query var="emple" dataSource="jdbc/mysql">
    SELECT dj.id_Departamento, dj.id_Usuario, jdp.id_jefe, jdp.id_probador, u.Id, u.Nombre, u.Apellido, u.Telefono, u.Correo
    FROM departamento_jefe dj
    JOIN jefedepto_probador jdp ON dj.id_Usuario = jdp.id_jefe
    JOIN usuarios u ON jdp.id_probador = u.Id
    WHERE dj.id_Departamento = (SELECT id_Departamento FROM departamento_jefe WHERE id_Usuario = '${param.usuID}')
    AND dj.id_Usuario != '${param.usuID}'
    AND NOT EXISTS (SELECT * FROM caso_desarrollo WHERE id_Probador = jdp.id_probador);
</sql:query>
<body style="background: #FFFBF5">
<div class="container" id="contai">

    <form class="row g-3" id="ingreso" action="controller.jsp" method="POST">
        <input type="hidden" name="id" value="${not empty param.id}">
        <input type="hidden" value="${param.operacion}" name="operacion" id="operacion">
        <input type="hidden" value="${param.casoCod}" name="dato"  id="dato">
        <input type="hidden" value="${param.usuID}" name="usuid"  id="usuid">
        <input type="hidden" value="${param.dateActu}" name="fechaActual"  id="fechaActual">


        <h1 class="text-center">${param.cabecera}</h1>
        <div class="col-md-6">
            <label for="disabledTextInput" class="form-label">${param.titu_caso}</label>
            <input type="text" id="disabledTextInput" name="id_Caso_Acep" class="form-control" placeholder="" value="${param.casoCod}"  disabled >
        </div>
        <div class="col-md-6">
            <label for="exampleFormControlTextarea1" class="form-label">${param.titu_descrip}</label>
            <textarea class="form-control" id="exampleFormControlTextarea1"  rows="3" placeholder="${param.descripcion}" disabled></textarea>
        </div>
        <div class="col-12">
            <label for="exampleFormControlTextarea1" class="form-label">${param.titu_recha}</label>
            <input class="form-control" id="exampleFormControlTextarea2" name="infoCaso_Acep" rows="3" value="${param.descrip}" placeholder="Digite requerimientos adicionales para el desarrollador" required>
        </div>
        <div class="col-md-6">
            <label for="exampleFormControlTextarea1" class="form-label">${param.titu_desa}</label>
            <select class="form-select" aria-label="Default select example" name="id_Desarrollador" required>
                <option selected required>${param.select_desa}</option>
                <c:forEach var="desarrollador" items="${desa.rows}">
                    <option value="${desarrollador.id}" required>${desarrollador.Id} - ${desarrollador.Nombre} ${desarrollador.Apellido}</option>
                </c:forEach>
            </select>
        </div>
        <div class="col-md-6">
            <label for="exampleFormControlTextarea1" class="form-label">${param.titu_emple}</label>
            <select class="form-select" aria-label="Default select example" name="id_Probador" required>
                <option selected required>${param.select_emple}</option>
                <c:forEach var="empleado" items="${emple.rows}">
                    <option value="${empleado.id}" required>${empleado.Id} - ${empleado.Nombre} ${empleado.Apellido}</option>
                </c:forEach>
            </select>
        </div>
        <div class="col-md-6">
            <label for="fecha">Fecha de Actual</label>
            <input type="date" class="form-control" id="fechaActu" name="fechaActu" value="${param.dateActu}" disabled>
        </div>
        <div class="col-md-6">
            <label for="fecha">Fecha de Entrega</label>
            <input type="date" class="form-control" id="fecha" name="fechaEntrega"
                   placeholder="Ingresa la fecha de entrega"
                   min="${param.dateEntre}"
                   required>
        </div>


        <div class="col-12">
            <label for="fecha">Documento del Departamento Solicitante</label>
            <div class="input-group mb-3">
                <input type="file" class="form-control" id="inputGroupFile02" disabled>
                <label class="input-group-text" for="inputGroupFile02">Subir Archivo</label>
            </div>
        </div>

        <div class="col-12">
            <label for="fecha">Requerimientos del Jefe Desarrollo</label>
            <div class="input-group mb-3">
                <input type="file" class="form-control" id="inputGroupFile03" name="documento">
                <label class="input-group-text" for="inputGroupFile02">Subir Archivo</label>
            </div>
        </div>



        <div class="btn-group" role="group" aria-label="Basic mixed styles example">
            <input type="submit" class="btn btn-success col-md-6 " value="Enviar"/>
            <a class="btn btn-primary" href="controller.jsp?operacion=regresar&amp;usuID=${param.usuID}">Regresar</a>
        </div>
    </form>
</div>
</body>
</html>
