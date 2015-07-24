<%-- 
    Document   : mostraChamado
    Created on : 28/06/2014, 19:14:28
    Author     : Evandro
--%>
<link href="css/bootstrap.min.css" rel="stylesheet">

<%@page import="dados.Status"%>
<%@page import="dao.StatusDao"%>
<%@page import="dados.Chamado"%>
<%@page import="java.util.List"%>
<%@page import="dao.ChamadoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exibição de Chamados</title>
    </head>
    <body>


        <%
            String msg = request.getParameter("statAlterado");
            if (msg != null) {
                out.println("<h3>Status <strong>" + msg + "</strong> alterado</h3>");
            } else {
                msg = request.getParameter("erro");
                if (msg != null) {
                    out.println("<h3>Erro: <strong>" + msg + "</strong> ao alterar o status do chamado</h3>");
                }
            }
        %>


        <%
            out.println("<h1>Chamados</h1>");
            out.println("<table border=2px cellpadding=5px cellspacing=0>");
            out.println("<thead>");
            out.println("<tr style=\"background: #DCDCDC\">");
            out.println("<th>Código</th>");
            out.println("<th>Tipo</th>");
            out.println("<th>Descrição</th>");
            out.println("<th>Atendente</th>");
            out.println("<th>Usuario</th>");
            out.println("<th>Status</th>");
            out.println("<th>Alterar</th>");

            out.println("</thead>");

            ChamadoDao chamadoDao = new ChamadoDao();
            List<Chamado> lista = chamadoDao.getChamados();
            int nregistros = lista.size();
            for (Chamado chamado : lista) {

                if (nregistros % 2 == 0) {
                    out.println("<tr style=\"background: #DCDCDC\"");
                    out.println("<tr>");
                    out.println("<td align='center'>" + chamado.getCodigo() + "</td>");
                    out.println("<td>" + chamado.getTipo() + "</td>");
                    out.println("<td>" + chamado.getDescricao() + "</td>");
                    out.println("<td>" + chamado.getAtendente().getNome() + "</td>");
                    out.println("<td>" + chamado.getUsuario().getNome() + "</td>");
                    out.println("<td>" + chamado.getStatus().getSituacao() + "</td>");

                    out.println("<td><form name=\"alterarForm\" action=\"AltraStatusServlet\" method=\"POST\">");
                    out.println("<input type=\"hidden\" name=\"codigo\" id=\"codigo\" value=\"" + chamado.getStatus().getCodigo() + "\"/>");
                    out.println("<input type=\"submit\" value=\"Alterar >>\" name=\"btServletAlterar\" id=\"btServletAlterar\" />");
                    out.println("</form></td>");
                    out.println("</tr>");
                    out.println("</tr>");
                    nregistros++;
                } else {
                    out.println("<tr style=\"background:  #FFFAFA\"");
                    out.println("<tr style=\"background: #DCDCDC\"");
                    out.println("<tr>");
                    out.println("<td align='center'>" + chamado.getCodigo() + "</td>");
                    out.println("<td>" + chamado.getTipo() + "</td>");
                    out.println("<td>" + chamado.getDescricao() + "</td>");
                    out.println("<td>" + chamado.getAtendente().getNome() + "</td>");
                    out.println("<td>" + chamado.getUsuario().getNome() + "</td>");
                    out.println("<td>" + chamado.getStatus().getSituacao() + "</td>");

                    out.println("<td><form name=\"alterarForm\" action=\"AltraStatusServlet\" method=\"POST\">");
                    out.println("<input type=\"hidden\" name=\"codigo\" id=\"codigo\" value=\"" + chamado.getStatus().getCodigo() + "\"/>");
                    out.println("<input type=\"submit\" value=\"Alterar >>\" name=\"btServletAlterar\" id=\"btServletAlterar\" />");
                    out.println("</form></td>");
                    out.println("</tr>");
                    nregistros++;
                }
            }
            out.println("</tbody>");
            out.println("</table>");
            out.println("<br />");
            out.println("<br />");

        %>

        <a href="index.html">Início</a> <br />
    </body>
</html>
