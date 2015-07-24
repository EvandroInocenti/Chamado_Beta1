/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import conexao.Conecta;
import dados.Setor;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author evandro
 */
public class SetorDao {

    public String addSetor(Setor setor) {

        Conecta conecta = new Conecta();

        if ("sucesso".equals(conecta.getMsg())) {
            String sql = "INSERT INTO Setor (NOME)"
                    + "VALUES ('" + setor.getNome() + "')";
            try {
                conecta.getStm().execute(sql);
                return "sucesso";
            } catch (Exception e) {
                return ("Erro: " + e.getMessage());
            }
        } else {
            return ("Erro:" + conecta.getMsg());
        }
    }

    public List<Setor> getSetores() {
        List<Setor> lista = new ArrayList<Setor>();

        Conecta conecta = new Conecta();

        if ("sucesso".equals(conecta.getMsg())) {

            String sql = "SELECT * FROM SETOR";

            ResultSet rs;

            try {
                rs = conecta.getStm().executeQuery(sql);

                while (rs.next()) {

                    int cod = rs.getInt("CODIGO");
                    String nome = rs.getString("NOME");

                    Setor setor = new Setor();
                    setor.setCodigo(cod);
                    setor.setNome(nome);
                    lista.add(setor);
                }
            } catch (Exception e) {

            }
            return lista;
        }
        return lista;
    }
}
