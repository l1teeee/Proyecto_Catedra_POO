<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
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
<c:if test="${param.operacion == 'eliminar'}">
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
</c:if>

<c:if test="${param.operacion == 'verificacion'}">
    <c:redirect url="formulario.jsp">
        <c:param name="cabecera" value="Caso a desarrollar"/>
        <c:param name="titu_caso" value="Codigo del Caso"/>
        <c:param name="caso" value="${param.id}"/>
        <c:param name="tipo" value="${param.tipo}"/>
        <c:param name="descripcion" value="${param.descripcion}"/>
        <c:param name="nombre" value="${param.nombre}"/>
        <c:param name="departamento" value="${param.departamento}"/>
    </c:redirect>
</c:if>

<%--
<%
    if(request.getParameter("operacion").equals("modificar")) {
        String id_persona = request.getParameter("id_persona");
        String nombre_persona = request.getParameter("nombre");
        String edad_persona = request.getParameter("edad");
        String sexo_persona = request.getParameter("sexo");
        String id_ocupacion = request.getParameter("idocupacion");
        String telefono_persona = request.getParameter("telefono");
        String fecha_nac = request.getParameter("fecha_nac");

        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/personabddg7", "root", "");
            String sql = "UPDATE persona SET nombre_persona=?, edad_persona=?, sexo_persona=?, id_ocupacion=?, telefono_persona=?, fecha_nac=? WHERE id_persona=?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, nombre_persona);
            statement.setString(2, edad_persona);
            statement.setString(3, sexo_persona);
            statement.setString(4, id_ocupacion);
            statement.setString(5, telefono_persona);
            statement.setString(6, fecha_nac);
            statement.setString(7, id_persona);

            int rowsUpdated = statement.executeUpdate();
            if (rowsUpdated > 0) {
                out.println("Los datos se actualizaron correctamente.");
                response.sendRedirect("principal.jsp");

            } else {
                out.println("No se pudo actualizar los datos.");
            }
        } catch (SQLException ex) {
            out.println("Error al conectar con la base de datos: " + ex.getMessage());
        }
    }
%>--%>


</body>
</html>
