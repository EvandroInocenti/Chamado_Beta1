/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import conexao.Conecta;
import dados.Chamado;
import dados.Setor;
import dados.Status;
import dados.Usuario;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author evandro
 */
public class ChamadoDao {

    //adiciona chamado 
    //Verificar usuarios
    public String addChamado(Chamado chamado) {

        Conecta conecta = new Conecta();

        if ("sucesso".equals(conecta.getMsg())) {
            String sql = "INSERT INTO chamado (CODIGO, DESCRICAO, STATUS_CODIGO, USUARIO_CODIGO, SETOR_CODIGO)"
                    + " VALUES ('" + chamado.getCodigo() +"','"  + chamado.getDescricao()
                    + "','" + chamado.getStatus().getCodigo() + "','" + chamado.getUsuario().getCodigo() + "','"  + chamado.getSetor().getCodigo()+ ")";
            try {
                conecta.getStm().execute(sql);
                return "sucesso";
            } catch (SQLException e) {
                return ("Erro: " + e.getMessage());
            }

        } else {
            return ("Erro: " + conecta.getMsg());
        }

    }

    //exibe chamados
    public List<Chamado> getChamados() {
        List<Chamado> lista = new ArrayList<Chamado>();

        Conecta conecta = new Conecta();

        if ("sucesso".equals(conecta.getMsg())) {
            String sql = "select ch.codigo AS chamado, descricao, setor.nome AS setor AS setor, usu.nome AS usuario, stat.situacao AS Status "
                    + "     from CHAMADO ch "
                    + "     inner join atendente setor on setor.codigo = ch.Atendente_codigo "
                    + "     inner join status stat on stat.codigo = ch.Status_codigo "
                    + "     inner join usuario usu on usu.codigo = ch.Usuario_codigo "
                    + "     order by ch.codigo";
            ResultSet rs;

            try {
                rs = conecta.getStm().executeQuery(sql);

                //percorre a lista
                while (rs.next()) {
                    int cod = rs.getInt("chamado");
                    String nomSet = rs.getString("setor");
                    String desc = rs.getString("descricao");
                    String situacao = rs.getString("status");
                    String nomeUsu = rs.getString("usuario");

                    Status status = new Status();
                    status.setSituacao(situacao);

                    Usuario usuario = new Usuario();
                    usuario.setNome(nomeUsu);

                    Setor setor = new Setor();
                    setor.setNome(nomSet);

                    Chamado chamado = new Chamado(cod, setor, desc, status, usuario);

                    lista.add(chamado);
                }
            } catch (SQLException ex) {
                Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
            }
            return lista;
        }
        return lista;
    }

//buscas aproximadas
    public List<Chamado> getUsuarioNome(String nomeUsuario) {
        List<Chamado> lista = new ArrayList<Chamado>();

        Conecta conecta = new Conecta();

        if ("sucesso".equals(conecta.getMsg())) {

            String sql = "select ch.codigo AS chamado, descricao, setor.nome AS setor, aten.nome AS atendente, stat.situacao AS Status, usu.nome AS usuario "
                    + "     from CHAMADO ch "
                    + "     inner join atendente aten on aten.codigo = ch.Atendente_codigo "
                    + "     inner join status stat on stat.codigo = ch.Status_codigo "
                    + "     inner join usuario usu on usu.codigo = ch.Usuario_codigo "
                    + "     WHERE usu.nome LIKE ('%" + nomeUsuario + "%')"
                    + "     order by usu.nome";

            ResultSet rs;

            try {
                rs = conecta.getStm().executeQuery(sql);

                //percorre a lista
                while (rs.next()) {
                    int cod = rs.getInt("chamado");
                    String nomSet = rs.getString("setor");
                    String desc = rs.getString("descricao");
                    String situacao = rs.getString("status");
                    String nomeUsu = rs.getString("usuario");

                    Setor setor = new Setor();
                    setor.setNome(nomSet);

                    Status status = new Status();
                    status.setSituacao(situacao);

                    Usuario usuario = new Usuario();
                    usuario.setNome(nomeUsu);

                    Chamado chamado = new Chamado(cod, setor, situacao, status, usuario);

                    lista.add(chamado);
                }
            } catch (SQLException ex) {
                Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
            }
            return lista;
        }
        return lista;
    }

    public List<Chamado> getAtendenteNome(String nomeAtendente) {
        List<Chamado> lista = new ArrayList<Chamado>();

        Conecta conecta = new Conecta();

        if ("sucesso".equals(conecta.getMsg())) {

            String sql = "select ch.codigo AS chamado,tipo, aten.nome AS atendente, stat.situacao AS Status, usu.nome AS usuario "
                    + "     from CHAMADO ch "
                    + "     inner join atendente aten on aten.codigo = ch.Atendente_codigo "
                    + "     inner join status stat on stat.codigo = ch.Status_codigo "
                    + "     inner join usuario usu on usu.codigo = ch.Usuario_codigo "
                    + "     WHERE aten.nome LIKE ('%" + nomeAtendente + "%')";

            ResultSet rs;

            try {
                rs = conecta.getStm().executeQuery(sql);

                //percorre a lista
                while (rs.next()) {
                    int cod = rs.getInt("chamado");
                    String nomSet = rs.getString("setor");
                    String situacao = rs.getString("status");
                    String nomeUsu = rs.getString("usuario");
                   
                    Status status = new Status();
                    status.setSituacao(situacao);

                    Usuario usuario = new Usuario();
                    usuario.setNome(nomeUsu);

                    Setor setor = new Setor();
                    setor.setNome(nomSet);

                    Chamado chamado = new Chamado(cod, setor, situacao, status, usuario);

                    lista.add(chamado);
                }
            } catch (SQLException ex) {
                Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
            }
            return lista;
        }
        return lista;
    }

    public List<Chamado> getContem(String descCham) {
        List<Chamado> lista = new ArrayList<Chamado>();

        Conecta conecta = new Conecta();

        if ("sucesso".equals(conecta.getMsg())) {

            String sql = "select ch.codigo AS chamado,descricao,tipo, aten.nome AS atendente, stat.situacao AS Status, usu.nome AS usuario "
                    + "     from CHAMADO ch"
                    + "     inner join atendente aten on aten.codigo = ch.Atendente_codigo "
                    + "     inner join status stat on stat.codigo = ch.Status_codigo "
                    + "     inner join usuario usu on usu.codigo = ch.Usuario_codigo "
                    + "      WHERE descricao LIKE ('%" + descCham + "%')";

            ResultSet rs;

            try {
                rs = conecta.getStm().executeQuery(sql);

                //percorre a lista
                while (rs.next()) {
                    int cod = rs.getInt("chamado");
                    String nomSet = rs.getString("setor");
                    //String desc = rs.getString("descricao");
                    String situacao = rs.getString("status");
                    String nomeUsu = rs.getString("usuario");
                    
                    Status status = new Status();
                    status.setSituacao(situacao);

                    Usuario usuario = new Usuario();
                    usuario.setNome(nomeUsu);

                    Setor setor = new Setor();
                    setor.setNome(nomSet);

                    Chamado chamado = new Chamado(cod, setor, situacao, status, usuario);

                    lista.add(chamado);
                }
            } catch (SQLException ex) {
                Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
            }
            return lista;
        }
        return lista;
    }
}
