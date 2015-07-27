/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import conexao.Conecta;
import dados.Unidade;
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
public class UsuarioDao {

    public String addUsuario(Usuario user) {

        Conecta conecta = new Conecta();

        if ("sucesso".equals(conecta.getMsg())) {
            String sql = "INSERT INTO Usuario(NOME, SENHA, EMAIL, UNIDADE_CODIGO)"
                    + "VALUES ('" + user.getNome() + "','" + user.getSenha() + "','" + user.getEmail() + "','" + user.getUnidade().getCodigo() + "')";
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

    public List<Usuario> getUsuarios() {
        List<Usuario> lista = new ArrayList<Usuario>();

        Conecta conecta = new Conecta();

        if ("sucesso".equals(conecta.getMsg())) {
            //campos contidos no BD

            String sql = "SELECT usu.*, uni.nome as nomeuni from USUARIO usu \n"
                    + "     inner join unidade uni on uni.codigo = usu.Unidade_codigo"
                    + "     order by usu.nome";
            ResultSet rs;

            try {
                rs = conecta.getStm().executeQuery(sql);

                //percorre a lista
                while (rs.next()) {
                    int cod = rs.getInt("CODIGO");
                    String nome = rs.getString("NOME");
                    String senha = rs.getString("SENHA");
                    String email = rs.getString("EMAIL");
                    String nomeUnidade = rs.getString("NOMEUNI");

                    Unidade unidade = new Unidade();
                    unidade.setNome(nomeUnidade);

                    Usuario usuario = new Usuario(cod, nome, senha, unidade, email);
                    lista.add(usuario);
                }
            } catch (SQLException ex) {
                Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
            }
            return lista;
        }
        return lista;
    }
}
