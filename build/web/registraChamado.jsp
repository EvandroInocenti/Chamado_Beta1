<%-- 
    Document   : registraChamado
    Created on : 09/06/2014, 14:09:23
    Author     : evandro
--%>

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
        <h2>Abra seu Chamado!</h2>
        <form name="resultform" action="AlimentaChamadoServlet" method="POST">
            <h4>selecione o usuario e digite a senha registrar o chamado</h4>
            <label>Login: </label>
            <select name="login">
                <%
                    UsuarioDao usuarioDaoDao = new UsuarioDao();
                    for (Usuario usuario : usuarioDaoDao.getUsuarios()) {
                        out.print("<option value=\"" + usuario.getCodigo() + "\">" + usuario.getNome() + "</option>");
                    }
                %>
            </select>
            <label>Senha: </label>
            <input type="password" name="senha" id="senha" value="" size="15" /><br/>
            <br />
            <fieldset><legend>Tipo do chamado</legend>

                <input type="radio" id="tipo" name="tipo" value="Software" />Software<br />
                <input type="radio" id="tipo" name="tipo" value="Hardware" />Hardware<br />

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
