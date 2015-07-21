/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import conexao.Conecta;
import dados.Unidade;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author evandro
 */
public class UnidadeDao {

    public String AddUnidade(Unidade unidade) {

        Conecta conecta = new Conecta();

        if ("sucesso".equals(conecta.getMsg())) {
            String sql = "INSERT INTO unidade(NOME)"
                    + "VALUES ('" + unidade.getNome() + "')";
            try {
                conecta.getStm().execute(sql);

            } catch (Exception e) {
                return ("erro:" + e.getMessage());
            }
        } else {
            return ("erro:" + conecta.getMsg());
        }
        return null;
    }

    public List<Unidade> getUnidades() {
        List<Unidade> lista = new ArrayList<>();

        Conecta conecta = new Conecta();

        if ("sucesso".equals(conecta.getMsg())) {

            String sql = "SELECT UNI.* FROM UNIDADE UNI";

            ResultSet rs;

            try {
                rs = conecta.getStm().executeQuery(sql);

                //percorre a lista
                while (rs.next()) {

                    int cod = rs.getInt("CODIGO");
                    String nome = rs.getString("NOME");

                    Unidade uni = new Unidade();
                    uni.setNome(nome);
                    uni.setCodigo(cod);
                    lista.add(uni);
                }
            } catch (SQLException ex) {

            }
            return lista;
        }
        return lista;
    }

}
