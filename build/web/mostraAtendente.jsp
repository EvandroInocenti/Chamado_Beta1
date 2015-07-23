<%-- 
    Document   : mastraAtendente
    Created on : 23/07/2015, 15:03:26
    Author     : evandro
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dao.AtendenteDao"%>
<%@page import="dados.Atendente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Atendentes Cadastrados</title>
    </head>
    <body>
        <h4>Atendentes Cadastrados</h4>

        <%
            String msg = request.getParameter("atendenteIncluido");
            if (msg != null) {
                out.print("<h3>Atendente: <strong>" + msg + "</strong>cadastrado com sucesso!</h3>");
            } else {
                msg = request.getParameter("erro");
                if (msg != null) {
                    out.print("<h3>Erro: <strong>" + msg + "</strong> ao cadastrar atendente</h3>");
                }
            }

            AtendenteDao atendenteDao = new AtendenteDao();
        %>

        <table border=2px cellpadding=5px cellspacing=0 >
            <thead>
                <tr>
                    <th>Codigo</th>
                    <th>Nome</th>
                    <th>E-mail</th>
                </tr>
            </thead>

            <c:forEach var="c" items="<%=atendenteDao.getAtendentes()%>">
                <tr>
                    <td aling="center">${c.codigo}</td>
                    <td>${c.nome}</td>
                    <td>${c.email}</td>
                </tr>
            </c:forEach>
        </tBody>
    </table>
    <br />
    <a href="index.html">Voltar</a>
    <br/>
</body>
</html>
