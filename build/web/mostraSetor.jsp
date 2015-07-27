<%-- 
    Document   : mostraSetor
    Created on : 24/07/2015, 09:08:35
    Author     : evandro
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dao.SetorDao"%>
<%@page import="dados.Setor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exibição dos Setores</title>
    </head>
    <body>
        <h3>Setores cadastrados!</h3>
        <%
            String msg = request.getParameter("setorIncluido");
            if (msg != null) {
                out.print("<h3>Setor <strong>" + msg + "</strong> incluido com sucesso!</h3>");
            } else {
                msg = request.getParameter("erro");
                if (msg != null) {
                    out.print("<h3>Erro: <strong> " + msg + "</strong> ao cadastrar o setor!</h3>");
                }
            }
            SetorDao setorDao = new SetorDao();
        %>
        <table border=2px cellpadding=5px cellspacing=0>
            <thead>
                <tr>
                    <th>Código</th>
                    <th>Nome</th>
                    <th>Atendente</th>
                </tr>
            </thead>
            <c:forEach var="c" items="<%=setorDao.getSetores()%>">
                <tr>
                    <td align="center">${c.codigo}</td>
                    <td>${c.nome}</td>
                     <c:if test="${c.atendente != null}">
                        <td>${c.atendente.nome}</td>
                    </c:if>
                    <c:if test="${c.atendente == null}">
                        <td>Atendente não cadastrada</td>
                    </c:if>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <br/>
    <a href="index.html">Voltar</a>
    <br/>
</body>
</html>
