<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.temporal.ChronoUnit" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.concurrent.TimeUnit" %>


<%--
  Created by IntelliJ IDEA.
  User: aleja
  Date: 12/04/2023
  Time: 11:55 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<html>
<head>
    <title>Controlador</title>
</head>
<body>

<%--<c:if test="${param.operacion == 'eliminar'}">
    <sql:update var="insertar" dataSource="jdbc/mysql">
        DELETE FROM persona WHERE id_persona = ?
        <sql:param value="${param.id}"/>
    </sql:update>

    <c:redirect url="">
        <c:param name="mensaje" value="Persona eliminada con exito"/>
    </c:redirect>
</c:if>

<c:if test="${param.operacion == 'insertar'}">
    <c:redirect url="formulario.jsp">
        <c:param name="cabecera" value="Insertar persona"/>
        <c:param name="operacion" value="insertarinf"/>
    </c:redirect>
</c:if>
<c:if test="${param.operacion == 'insertarinf'}">
    <sql:update var="insertar" dataSource="jdbc/mysql">
        INSERT INTO persona(nombre_persona, edad_persona, telefono_persona, sexo_persona,
        id_ocupacion, fecha_nac) VALUES (?, ? , ?, ? ,?, ?)
        <sql:param value="${param.nombre}"/>
        <sql:param value="${param.edad}"/>
        <sql:param value="${param.telefono}"/>
        <sql:param value="${param.sexo}"/>
        <sql:param value="${param.idocupacion}"/>
        <sql:param value="${param.fecha}"/>
    </sql:update>
    <c:redirect url="index.jsp">
        <c:param name="mensaje" value="Persona ingresada con exito"/>
    </c:redirect>
</c:if>--%>




<%--JEFE DESARROLLADOR--%>


<c:if test="${param.operacion == 'verificacion'}">
    <c:redirect url="formulario.jsp">
        <%--Titulos--%>
        <c:param name="cabecera" value="Caso a desarrollar"/>
        <c:param name="titu_caso" value="Codigo del Caso"/>
        <c:param name="titu_tipo" value="Tipo de Sistema"/>
        <c:param name="titu_descrip" value="Descripción de sistema"/>
        <c:param name="titu_nombre" value="Titulo de Sistema"/>
        <c:param name="titu_departamento" value="Departamento"/>
        <%--Valores--%>
        <c:param name="caso" value="${param.id}"/>
        <c:param name="tipo" value="${param.tipo}"/>
        <c:param name="descripcion" value="${param.descripcion}"/>
        <c:param name="nombre" value="${param.nombre}"/>
        <c:param name="departamento" value="${param.departamento}"/>
        <c:param name="IDusu" value="${param.idUSU}"/>

    </c:redirect>
</c:if>


<c:if test="${param.operacion == 'regresar'}">
    <c:redirect url="index.jsp">
        <c:param name="IDusu" value="${param.usuID}"/>
    </c:redirect>
</c:if>

<c:if test="${param.operacion == 'inicio'}">
    <c:redirect url="index.jsp">
        <c:param name="IDusu" value="${param.usuID}"/>
    </c:redirect>
</c:if>



<c:if test="${param.operacion == 'home'}">
    <c:redirect url="inicio.jsp">
    </c:redirect>
</c:if>



<%--Rechazar casos--%>
<c:if test="${param.operacion == 'rechazo'}">
    <c:redirect url="formularioRechazo.jsp">
        <c:param name="cabecera" value="Rechazo de Caso"/>
        <c:param name="titu_caso" value="Codigo del Caso"/>
        <c:param name="titu_departamento" value="Departamento"/>
        <c:param name="titu_recha" value="Escribir argumento de rechazo"/>
        <c:param name="titu_descrip" value="Descripción del caso"/>
        <%--Valores--%>
        <c:param name="casoCod" value="${param.cod}"/>
        <c:param name="descripcion" value="${param.descripcion}"/>
        <c:param name="usuID" value="${param.idUSU}"/>
        <c:param name="operacion" value="rechazoinf"/>
    </c:redirect>
</c:if>

<c:if test="${param.operacion == 'rechazoinf'}">
    <sql:update var="rechazar" dataSource="jdbc/mysql">
        INSERT INTO casos_rechazados(Codigo, Argumento)
        VALUES (?, ?)
        <sql:param value="${param.dato}"/>
        <sql:param value="${param.razonRe}"/>
    </sql:update>
    <sql:update var="actualizar" dataSource="jdbc/mysql">
        UPDATE casos SET Estado = 'Rechazado' WHERE Codigo = ?
        <sql:param value="${param.dato}" />
    </sql:update>
    <c:redirect url="index.jsp">
        <c:param name="IDusu" value="${param.usuid}"/>
        <c:param name="recha" value="Se ha notificado que el caso ha sido rechazado"/>
    </c:redirect>
</c:if>
<%--Rechazar casos--%>


<%--Casos Rechazados--%>
<c:if test="${param.operacion == 'casosRe'}">
    <c:redirect url="casosRechazados.jsp">
        <c:param name="id_Usu" value="${param.id}"/>
    </c:redirect>
</c:if>
<%--Casos Rechazados--%>




<%--Aceptar casos--%>

<%
    Date fechaActual = new Date();
    SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");
    String fechaFormateada = formatoFecha.format(fechaActual);
    Calendar c = Calendar.getInstance();
    c.setTime(fechaActual);
    c.add(Calendar.DATE, 1); // Agrega un día
    SimpleDateFormat formatoFecha2 = new SimpleDateFormat("yyyy-MM-dd");
    String fechaEntre = formatoFecha2.format(c.getTime()); // Obtén la fecha con un día más
%>
<c:if test="${param.operacion == 'acepta'}">
    <c:redirect url="formularioAcepta.jsp">
        <c:param name="operacion" value="insertarinf"/>
        <c:param name="cabecera" value="Aceptación de Caso"/>
        <c:param name="titu_caso" value="Codigo del Caso"/>
        <c:param name="titu_departamento" value="Departamento"/>
        <c:param name="titu_recha" value="Información adicional para el desarrollador"/>
        <c:param name="titu_descrip" value="Descripción del caso"/>
        <c:param name="titu_desa" value="Lista de Desarrolladores del Departamento"/>
        <c:param name="select_desa" value="Desarrolladores Available"/>
        <c:param name="titu_emple" value="Lista de Empleados del Departamento"/>
        <c:param name="select_emple" value="Empleados Available"/>
        <c:param name="titu_date" value="Fecha de Entrega"/>
        <c:param name="dateActu" value="<%= fechaFormateada %>"/>
        <c:param name="dateEntre" value="<%= fechaEntre %>"/>

        <%--Valores--%>
        <c:param name="casoCod" value="${param.cod}"/>
        <c:param name="descripcion" value="${param.descripcion}"/>
        <c:param name="usuID" value="${param.idUSU}"/>
        <c:param name="departi" value="${param.departament}"/>
        <c:param name="operacion" value="insertarinf"/>
    </c:redirect>
</c:if>


<c:if test="${param.operacion == 'insertarinf'}">
    <sql:update var="insertar" dataSource="jdbc/mysql">
        INSERT INTO caso_desarrollo(id_Desarrollador, id_Caso, id_Probador, fechaActual, fechaEntrega, infoCaso, caso_porcentaje, estado_caso, detalle_caso)
        VALUES (?, ?, ?, ?, ?, ?, 0, '', '')
        <sql:param value="${param.id_Desarrollador}"/>
        <sql:param value="${param.dato}"/>
        <sql:param value="${param.id_Probador}"/>
        <sql:param value="${param.fechaActual}"/>
        <sql:param value="${param.fechaEntrega}"/>
        <sql:param value="${param.infoCaso_Acep}"/>
    </sql:update>
    <sql:update var="actualizar" dataSource="jdbc/mysql">
        UPDATE casos SET Estado = 'En Progreso' WHERE Codigo = ?
        <sql:param value="${param.dato}" />
    </sql:update>
    <c:redirect url="index.jsp">
        <c:param name="IDusu" value="${param.usuid}"/>
        <c:param name="mensaje" value="Asignación hecha correctamente."/>
    </c:redirect>
</c:if>


<%--Aceptar casos--%>



<%--Revisar desarrolladores casos--%>
<c:if test="${param.operacion == 'desarro'}">
    <c:redirect url="desarrolladores.jsp">
        <c:param name="IDusu" value="${param.usuID}"/>
    </c:redirect>
</c:if>
<%--Revisar desarrolladores casos--%>



<c:if test="${param.operacion == 'revi'}">
    <c:redirect url="casosProgre.jsp">
        <c:param name="IDusu" value="${param.id}"/>
    </c:redirect>
</c:if>

<%--JEFE DESARROLLADOR--%>



</body>
</html>
