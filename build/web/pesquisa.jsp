<%-- 
    Document   : pesquisa
    Created on : 21/06/2014, 20:37:49
    Author     : Evandro
--%>

<%@page import="dados.Chamado"%>
<%@page import="java.util.List"%>
<%@page import="dao.ChamadoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa</title>
    </head>
    <body>

        <div>Pesquisa de Chamados</div>
        <form name="resultadoForm" action= "pesquisa.jsp" method="POST" >

            <select name="pesquisa" id="pesquisa" >
                <option value = "nome" >Nome do Usuario</option>
                <option value = "atendente" >Nome Atendente</option> 
                <option value = "contem" >Contem no Chamado</option> 
            </select>  

            <input type="text" placeholder= "Valor da pesquisar" name="pesquisar" id="pesquisar"/><br>
            <input type="submit"  value= "Pesquisar >>" name="pesquisa" /><br><br>

            <%
                String pesquisa = request.getParameter("pesquisa");

                if (pesquisa == null) {
                    return;
                };

                if (pesquisa.equals("nome")) {

                    out.println("<h3>Resultado da Pesquisa</h3>");
                    out.println("<table border=2px cellpadding=5px cellspacing=0>");
                    out.println("<thead>");
                    out.println("<tr>");

                    out.println("<th>Usario</th>");
                    out.println("<th>Tipo</th>");
                    out.println("<th>Status</th>");
                    out.println("<th>Atendente</th>");
                    out.println("</thead>");

                    ChamadoDao chamadoDao = new ChamadoDao();
                    String nome = request.getParameter("pesquisar");
                    List<Chamado> lista = chamadoDao.getUsuarioNome(nome);
                    int nregistros = lista.size();
                    for (Chamado chamado : lista) {

                        if (nregistros % 2 == 0) {
                            out.println("<tr style=\"background: #DCDCDC\"");
                            out.println("<tr>");
                            out.println("<td align='center'>" + chamado.getUsuario().getNome() + "</td>");
                            out.println("<td>" + chamado.getTipo() + "</td>");
                            out.println("<td>" + chamado.getStatus().getSituacao() + "</td>");
                            out.println("<td>" + chamado.getAtendente().getNome() + "</td>");
                            out.println("</form></td>");
                            out.println("</tr>");
                            nregistros++;
                        } else {
                            out.println("<tr style=\"background:  #FFFAFA\"");
                            out.println("<tr style=\"background: #DCDCDC\"");
                            out.println("<tr>");
                            out.println("<td align='center'>" + chamado.getUsuario().getNome() + "</td>");
                            out.println("<td>" + chamado.getTipo() + "</td>");
                            out.println("<td>" + chamado.getStatus().getSituacao() + "</td>");
                            out.println("<td>" + chamado.getAtendente().getNome() + "</td>");
                            out.println("</form></td>");
                            out.println("</tr>");
                            nregistros++;
                        }
                    }
                    out.println("</tbody>");
                    out.println("</table>");
                    out.println("<br />");
                    out.println("<br />Foram encontrados " + lista.size() + " registros<br />");

                } else if (pesquisa.equals("atendente")) {
                    out.println("<h3>Resultado da Pesquisa</h3>");
                    out.println("<table border=2px cellpadding=5px cellspacing=0>");
                    out.println("<thead>");
                    out.println("<tr>");

                    out.println("<th>Atendente</th>");
                    out.println("<th>Tipo</th>");
                    out.println("<th>Status</th>");
                    out.println("<th>Usuario</th>");
                    out.println("</thead>");

                    ChamadoDao chamadoDao = new ChamadoDao();
                    String nome = request.getParameter("pesquisar");
                    List<Chamado> lista = chamadoDao.getAtendenteNome(nome);
                    int nregistros = lista.size();
                    for (Chamado chamado : lista) {

                        if (nregistros % 2 == 0) {
                            out.println("<tr style=\"background: #DCDCDC\"");
                            out.println("<tr>");
                            out.println("<td align='center'>" + chamado.getAtendente().getNome() + "</td>");
                            out.println("<td>" + chamado.getTipo() + "</td>");
                            out.println("<td>" + chamado.getStatus().getSituacao() + "</td>");
                            out.println("<td>" + chamado.getUsuario().getNome() + "</td>");
                            out.println("</form></td>");
                            out.println("</tr>");
                            nregistros++;
                        } else {
                            out.println("<tr style=\"background:  #FFFAFA\"");
                            out.println("<tr style=\"background: #DCDCDC\"");
                            out.println("<tr>");
                            out.println("<td align='center'>" + chamado.getAtendente().getNome() + "</td>");
                            out.println("<td>" + chamado.getTipo() + "</td>");
                            out.println("<td>" + chamado.getStatus().getSituacao() + "</td>");
                            out.println("<td>" + chamado.getUsuario().getNome() + "</td>");
                            out.println("</form></td>");
                            out.println("</tr>");
                            nregistros++;
                        }
                    }
                    out.println("</tbody>");
                    out.println("</table>");
                    out.println("<br />");
                    out.println("<br />Foram encontrados " + lista.size() + " registros<br />");

                } else if (pesquisa.equals("contem")) {
                    out.println("<h3>Resultado da Pesquisa</h3>");
                    out.println("<table border=2px cellpadding=5px cellspacing=0>");
                    out.println("<thead>");
                    out.println("<tr>");

                    out.println("<th>Tipo</th>");
                    out.println("<th>Atendente</th>");
                    out.println("<th>Usuario</th>");
                    out.println("<th>Descição</th>");
                    out.println("<th>Status</th>");
                    out.println("</thead>");

                    ChamadoDao chamadoDao = new ChamadoDao();
                    String nome = request.getParameter("pesquisar");
                    List<Chamado> lista = chamadoDao.getContem(nome);
                    int nregistros = lista.size();
                    for (Chamado chamado : lista) {

                        if (nregistros % 2 == 0) {
                            out.println("<tr style=\"background: #DCDCDC\"");
                            out.println("<tr>");
                            out.println("<td align='center'>" + chamado.getDescricao() + "</td>");
                            out.println("<td>" + chamado.getAtendente().getNome() + "</td>");
                            out.println("<td>" + chamado.getUsuario().getNome() + "</td>");
                            out.println("<td>" + chamado.getTipo() + "</td>");
                            out.println("<td>" + chamado.getStatus().getSituacao() + "</td>");
                            out.println("</form></td>");
                            out.println("</tr>");
                            nregistros++;
                        } else {
                            out.println("<tr style=\"background:  #FFFAFA\"");
                            out.println("<tr style=\"background: #DCDCDC\"");
                            out.println("<tr>");
                            out.println("<td align='center'>" + chamado.getDescricao() + "</td>");
                            out.println("<td>" + chamado.getAtendente().getNome() + "</td>");
                            out.println("<td>" + chamado.getUsuario().getNome() + "</td>");
                            out.println("<td>" + chamado.getTipo() + "</td>");
                            out.println("<td>" + chamado.getStatus().getSituacao() + "</td>");
                            out.println("</form></td>");
                            out.println("</tr>");
                            nregistros++;
                        }
                    }
                    out.println("</tbody>");
                    out.println("</table>");
                    out.println("<br />");
                    out.println("<br />Foram encontrados " + lista.size() + " registros<br />");
                }
            %>

            <br />
            <a href="index.html">Página Principal</a> 
        </form>
    </body>
</html>
