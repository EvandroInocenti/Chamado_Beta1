<%-- 
    Document   : registraChamado
    Created on : 09/06/2014, 14:09:23
    Author     : evandro
--%>

<%@page import="dados.Setor"%>
<%@page import="dao.SetorDao"%>
<%@page import="dados.Usuario"%>
<%@page import="dao.UsuarioDao"%>
<%@page import="dados.Status"%>
<%@page import="dao.StatusDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Chamados</title>
    </head>
    <body>
            <form name="resultform" action="AlimentaChamadoServlet" method="POST">
            <h4>Registre seu chamado</h4>

            <label>Escolha o setor</label>
            <select name="setor">
                <%
                    SetorDao setorDao = new SetorDao();
                    for (Setor setor : setorDao.getSetores()) {
                        out.print("<option value=\"" + setor.getCodigo() + "\">" + setor.getNome() + "</option>");
                    }
                %>
            </select>

        </fieldset>
        <fieldset><legend><label for="name">Problema</label></legend>
            <label for="name">Descrição do Problema: </label><br />
            <textarea name="descricao" rows="10" cols="50"></textarea>
            <br />
            <label>Status: </label>
            <select name="status">
                <%--exibe o combox --%>          
                <%
                    StatusDao statusDao = new StatusDao();
                    for (Status status : statusDao.getStatus()) {
                        out.print("<option value=\"" + status.getCodigo() + "\">" + status.getSituacao() + "</option>");
                    }
                %>
            </select>
            <br />
            <input type="submit" value="Cadastrar >>" name="btServlet" id="btServlet" />

            <br />
        </fieldset>
    </form>
    <a href="index.html">Inicio</a>
</body>
</html>
