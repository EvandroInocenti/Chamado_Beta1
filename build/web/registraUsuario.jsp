<%-- 
    Document   : registraChamado
    Created on : 28/05/2014, 09:04:17
    Author     : evandro
--%>
<link href="css/bootstrap.min.css" rel="stylesheet">
<%@page import="dados.Unidade"%>
<%@page import="dao.UnidadeDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Registro de Usuario</title>
    </head>
    <body>
        <h1>Cadastro</h1>

        <fieldset><legend>Cadastre seu usuário: </legend>
            <form name="resultform" action="AlimentaUsuarioServlet" method="POST">

                <label for="name">Nome: </label>
                <input type="text" name="nome" id="nome" value="" size="50" /><br/>
                <label for="senha">Senha: </label>
                <input type="password" name="senha" id="senha" value="" size="50" /><br/>
                <label for="email">Email: </label>
                <input type="text" name="email" id="email" value="" size="50" /><br/>
                <label>Unidade: </label>
                <select name="unidade">
                    <%
                        UnidadeDao unidadeDao = new UnidadeDao();
                        for (Unidade unidade : unidadeDao.getUnidades()) {
                            out.print("<option value=\"" + unidade.getCodigo() + "\">" + unidade.getNome() + "</option>");
                        }
                    %>
                </select>
                <br />
                <input type="submit" value="Cadastrar>>" name="btServlet" id="btServlet" />
            </form> 
        </fieldset>
        <hr>
        <br />
        <form name="frmDelete" action="ExcluirServlet" method="POST">
            <input type="hidden" name="codigo" id="codigo" value="" />
        </form>
        <a href="index.html">Inicio</a><br />
    </body>
</html>
