/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import conexao.Conecta;
import dados.Atendente;
import dados.Setor;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

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

            String sql = "SELECT aten.*,setor.nome as Setor FROM atendente aten \n"
                    + "    inner join setor on setor.codigo = aten.Setor_codigo"
                    + "     order by aten.nome";

            ResultSet rs;

            try {
                rs = conecta.getStm().executeQuery(sql);

                while (rs.next()) {
                    int cod = rs.getInt("CODIGO");
                    String nome = rs.getString("NOME");
                    String email = rs.getString("EMAIL");
                    String nomeSetor = rs.getString("SETOR");

                    Setor setor = new Setor();
                    setor.setNome(nomeSetor);

                    Atendente atendente = new Atendente(cod, nome, email, setor);
                    listAten.add(atendente);
                }
            } catch (Exception e) {
                
            }
            return listAten;
        }
        return listAten;

    }
}
