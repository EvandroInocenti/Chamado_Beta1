/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import conexao.Conecta;
import dados.Atendente;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author evandro
 */
public class AtendenteDao {

    public String addAtendente(Atendente atendente) {

        Conecta conecta = new Conecta();

        if ("sucesso".equals(conecta.getMsg())) {
            String sql = "INSERT INTO atendente(CODIGO, NOME, EMAIL, Setor_codigo)"
                    + "VALUES ('" + atendente.getCodigo() + "','" + atendente.getNome()
                    + "','" + atendente.getEmail() + "','" + atendente.getSetor().getCodigo() + "')";
            try {
                conecta.getStm().execute(sql);
                return "sucesso";
            } catch (Exception e) {
                return ("erro" + e.getMessage());
            }
        } else {
            return ("erro:" + conecta.getMsg());
        }
    }

    public List<Atendente> getAtendentes() {
        List<Atendente> listAten = new ArrayList<Atendente>();

        Conecta conecta = new Conecta();

        if ("sucesso".equals(conecta.getMsg())) {

            String sql = "SELECT * FROM ATENDENTE \n"
                    +"    inner join setor on setor.codigo = atendente.Setor_codigo"
                    +"     order by atendente.nome";
            
            ResultSet rs;

            try {
                rs = conecta.getStm().executeQuery(sql);

                while (rs.next()) {
                    int cod = rs.getInt("CODIGO");
                    String nome = rs.getString("NOME");
                    String email = rs.getString("EMAIL");

                    Atendente atendente = new Atendente();
                    atendente.setCodigo(cod);
                    atendente.setNome(nome);
                    atendente.setEmail(email);
                    listAten.add(atendente);
                }
            } catch (Exception e) {

            }
            return listAten;
        }
        return listAten;

    }
}
