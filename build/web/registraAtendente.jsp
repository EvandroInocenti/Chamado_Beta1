<%-- 
    Document   : registraAtendente
    Created on : 23/07/2015, 14:04:08
    Author     : evandro
--%>

<%@page import="dados.Setor"%>
<%@page import="dao.SetorDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de atendentes</title>
    </head>
    <body>
        <h3>Atendentes</h3>
        <fieldset><legend>Registro de Atendentes </legend>
            <form name="resultform" action="AlimentaAtendenteServlet" method="POST">
                <label for="name">Nome:</label>
                <input type="text" name="nome" id="nome" value="" size="50"><br/>
                <label for="email">E-mail</label>
                <input type="text" name="email" id="email" value="" size="50"><br/>
                <label>Setor</label>
                <select name="setor">
                    <%
                        SetorDao setorDao = new SetorDao();
                        for(Setor setor : setorDao.getSetores()){
                           out.print("<option value=\"" +setor.getCodigo() + "\">" + setor.getNome()+ "</option>");
                        }
                    %>
                </select>
                    
                <br/>
                <input type="submit" value="cadastrar>>" name="btServlet" id="btServlet" />
                
            </form>
        </fieldset>
        <a href="index.html">Inicio</a><br />
    </body>
</html>
