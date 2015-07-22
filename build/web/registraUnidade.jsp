<%-- 
    Document   : registraUnidade
    Created on : 21/07/2015, 17:30:41
    Author     : evandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Unidade</title>
    </head>
    <body>
        <h1>Unidades</h1>
        <fieldset><legend>Cadastro da Unidade</legend>
            <form name="resultform" action="AlimentaUnidadeServlet" method="POST">
                <label for="name">Nome:</label>
                <input type="text" name="nome" id="nome" value="" size="30"/><br/>
                <label for="fone">Telefone:</label>
                <input type="text" name="fone" id="fone" value="" size="30"/><br/>
                <label for="uf">Estado:</label>
                <input type="text" name="estado" id="estado" value="" size="2"/><br/>
                <label for="voip">VoIP:</label>
                <input type="text" name="voip" id="voip" value="" size="4"/><br/>

                <br />
                <input type="submit" value="Cadastrar>>" name="btServlet" id="btServlet" />
            </form>
        </fieldset>
        <a href="index.html">Inicio</a><br />
    </body>
</html>
