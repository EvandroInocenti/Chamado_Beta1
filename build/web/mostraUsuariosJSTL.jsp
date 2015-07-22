<%-- 
    Document   : mostraUsuarios
    Created on : 02/06/2014, 09:16:27
    Author     : evandro
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dao.UsuarioDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de usuarios cadastrados</title>
    </head>
    <body>
        <%
            String msg_exec = request.getParameter("codExcluido");
            if (msg_exec != null) {
                out.print("<h3>Usuario: <strong>" + msg_exec + "</strong> foi excluido </h3>");
            }
            String msg = request.getParameter("nomeIncluido");
            if (msg != null) {
                out.print("<h3>Usuario: <strong>" + msg + "</strong>incluido com sucesso</h3>");
            } else {
                msg = request.getParameter("erro");
                if (msg != null) {
                    out.print("<h3>Erro: <strong>" + msg + "</strong> ao incluir usuario</h3>");
                }
            }
                       
            //out.print("<h1> Demostração de leitura de dados</h1>");
            //out.print("<h2>Usando tabela</h2>");

            UsuarioDao usuarioDao = new UsuarioDao();
            //int nregistros = 0;
        %>

        <!--Executando banco de dados-->

        <table border=2px cellpadding=5px cellspacing=0>
            <thead>
                <tr>
                    <th>Código</th>
                    <th>Nome</th>
                    <%--<th>Senha</th>--%>
                    <th>Email</th>
                    <th>Unidade</th>
                    <th>Excluir</th>

            </thead>

            <c:forEach var="c" items="<%=usuarioDao.getUsuarios()%>">

                <!-- caso existir resultados, percorremos a lista. -->
                <!-- Exibir os dados na tela. -->
                <tr>
                    <td align="center"> ${c.codigo}</td>
                    <td> ${c.nome}</td>
                    <%-- <td> ${c.senha}</td> --%>
                    <td> ${c.email}</td>
                    <c:if test="${c.unidade != null}">
                        <td>${c.unidade.nome}</td>
                    </c:if>
                    <c:if test="${c.unidade == null}">
                        <td>Unidade não cadastrada</td>
                    </c:if>
                        

                    <!-- link para exclusão -->
                    <td><form name="excluirForm" action="ExcluirUsuarioServlet" method="POST">
                            <input type="hidden" name="codigo" id="codigo" value="${c.codigo}"/>
                            <input type="submit" value="Excluir" name="btServletExcluir" id="btServletExcluir" />
                        </form></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <br />
    <a href="index.html">Voltar</a>
    <br />
</body>
</html>
