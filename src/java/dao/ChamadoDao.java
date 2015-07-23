/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import conexao.Conecta;
import dados.Atendente;
import dados.Chamado;
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
        UsuarioDao usuarioDao = new UsuarioDao();
        Usuario usuario = new Usuario();

        String loginOk = usuarioDao.verificaLogin(usuario.getNome());
        //String senhaOk = usuarioDao.verificaSenha(usuario.getSenha());

        if (loginOk == usuarioDao.verificaLogin(loginOk)) {
            // if (senhaOk == usuarioDao.verificaSenha(senhaOk)) {

            if ("sucesso".equals(conecta.getMsg())) {
                String sql = "INSERT INTO chamado (tipo, descricao, Atendente_codigo, Status_codigo, Usuario_codigo)"
                        + " VALUES ('" + chamado.getTipo() + "','" + chamado.getDescricao() + "'," + chamado.getAtendente().getCodigo()
                        + "," + chamado.getStatus().getCodigo() + "," + chamado.getUsuario().getCodigo() + "')";
                try {
                    conecta.getStm().execute(sql);
                    return "sucesso";
                } catch (SQLException e) {
                    return ("Erro: " + e.getMessage());
                }

            } else {
                return ("Erro: " + conecta.getMsg());
            }
            // } else {
            //return "Senha Inváilda";
        }else {
          return "Usuario invalido";
        }
    }

    //exibe chamados
    public List<Chamado> getChamados() {
        List<Chamado> lista = new ArrayList<Chamado>();

        Conecta conecta = new Conecta();

        if ("sucesso".equals(conecta.getMsg())) {
            String sql = "select ch.codigo AS chamado, tipo, descricao, aten.nome AS atendente, usu.nome AS usuario, stat.situacao AS Status "
                    + "     from CHAMADO ch "
                    + "     inner join atendente aten on aten.codigo = ch.Atendente_codigo "
                    + "     inner join status stat on stat.codigo = ch.Status_codigo "
                    + "     inner join usuario usu on usu.codigo = ch.Usuario_codigo "
                    + "     order by ch.codigo";
            ResultSet rs;

            try {
                rs = conecta.getStm().executeQuery(sql);

                //percorre a lista
                while (rs.next()) {
                    int cod = rs.getInt("chamado");
                    String tipo = rs.getString("tipo");
                    String desc = rs.getString("descricao");
                    String nomeAte = rs.getString("atendente");
                    String situacao = rs.getString("status");
                    String nomeUsu = rs.getString("usuario");

                    Atendente atendente = new Atendente();
                    atendente.setNome(nomeAte);
                    
                    //String sitStat = rs.getString("SITSTAT");
                    Status status = new Status();
                    status.setSituacao(situacao);

                    //String nomeUsu = rs.getString("NOMEUSU");
                    Usuario usuario = new Usuario();
                    usuario.setNome(nomeUsu);

                    Chamado chamado = new Chamado(cod, tipo, desc, atendente, status, usuario);

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

            String sql = "select ch.codigo AS chamado,tipo, aten.nome AS atendente, stat.situacao AS Status, usu.nome AS usuario "
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
                    String tipo = rs.getString("tipo");
                    String nomeAte = rs.getString("atendente");
                    String situacao = rs.getString("status");
                    String nomeUsu = rs.getString("usuario");

                    Atendente atendente = new Atendente();
                    atendente.setNome(nomeAte);

                    //String sitStat = rs.getString("SITSTAT");
                    Status status = new Status();
                    status.setSituacao(situacao);

                    //String nomeUsu = rs.getString("NOMEUSU");
                    Usuario usuario = new Usuario();
                    usuario.setNome(nomeUsu);

                    Chamado chamado = new Chamado(cod, tipo, situacao, atendente, status, usuario);

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
                    String tipo = rs.getString("tipo");
                    String nomeAte = rs.getString("atendente");
                    String situacao = rs.getString("status");
                    String nomeUsu = rs.getString("usuario");

                    Atendente atendente = new Atendente();
                    atendente.setNome(nomeAte);

                    Status status = new Status();
                    status.setSituacao(situacao);

                    Usuario usuario = new Usuario();
                    usuario.setNome(nomeUsu);

                    Chamado chamado = new Chamado(cod, tipo, situacao, atendente, status, usuario);

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
                    String desc = rs.getString("descricao");
                    String nomeAte = rs.getString("atendente");
                    String situacao = rs.getString("status");
                    String nomeUsu = rs.getString("usuario");

                    Atendente atendente = new Atendente();
                    atendente.setNome(nomeAte);

                    Status status = new Status();
                    status.setSituacao(situacao);

                    Usuario usuario = new Usuario();
                    usuario.setNome(nomeUsu);

                    Chamado chamado = new Chamado(cod, desc, situacao, atendente, status, usuario);

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
