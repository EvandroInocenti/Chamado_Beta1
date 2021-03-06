<%-- 
    Document   : mostraUnidade
    Created on : 22/07/2015, 11:12:29
    Author     : evandro
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="css/bootstrap.min.css" rel="stylesheet">

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dados.Unidade"%>
<%@page import="dao.UnidadeDao"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exibição de unidades</title>
    </head>
    <body>
        <h3>Unidades Cadastradas</h3>


        <%
            String msg = request.getParameter("unidadeIncluida");
            if (msg != null) {
                out.print("<h3>Unidade: <strong>" + msg + "</strong>cadastrada com sucesso</h3>");
            } else {
                msg = request.getParameter("erro");
                if (msg != null) {
                    out.print("<h3>Erro: <strong>" + msg + "</strong> ao cadastrar unidade</h3>");
                }
            }

            UnidadeDao unidadeDao = new UnidadeDao();
        %>        
        <table border=2px cellpadding=5px cellspacing=0>
            <thead>
                <tr>
                    <th>Código</th>
                    <th>Nome</th>
                    <th>Estado</th>
                    <th>Telefone</th>
                    <th>VoIP</th>
                </tr>
            </thead>

            <c:forEach var="c" items="<%=unidadeDao.getUnidades()%>">
                <tr>
                    <td align="center">${c.codigo}</td>
                    <td>${c.nome}</td>
                    <td>${c.estado}</td>
                    <td>${c.fone}</td>
                    <td>${c.voip}</td>
                </tr>

            </c:forEach>
        </tbody>
    </table>
    <br/>
    <a href="index.html">Voltar</a>
    <br />

</body>
</html>
