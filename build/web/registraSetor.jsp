<%-- 
    Document   : registraSetor
    Created on : 24/07/2015, 09:08:08
    Author     : evandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Setor</title>
    </head>
    <body>
        <h3>Setor</h3>
        <fieldset><legend>Cadastro de setores</legend>
            <form name="resultform" action="AlimentaSetorServlet" method="POST">
                <label for="name">Nome: </label>
                <input type="text" name="nome" id="nome" value="" size="30"/><br/>
                <br/>
                <input type="submit" value="Cadastrar >>" name="btServlet" id="btServlet" />
                
            </form>
        </fieldset>
        <a href="index.html">Inicio</a>
    </body>
</html>
