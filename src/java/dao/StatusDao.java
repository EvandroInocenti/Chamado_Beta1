/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import conexao.Conecta;
import dados.Status;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Evandro
 */
public class StatusDao {
    
    //3 metodos buscar status
    //aberto, atendimento, encerrado
    
    public List<Status> getStatus() {
        List<Status> lista = new ArrayList<>();

        Conecta conecta = new Conecta();

        if ("sucesso".equals(conecta.getMsg())) {

            String sql = "SELECT ST.* FROM STATUS ST";

            ResultSet rs;

            try {
                rs = conecta.getStm().executeQuery(sql);

                //percorre a lista
                while (rs.next()) {

                    int cod = rs.getInt("CODIGO");
                    String situacao = rs.getString("SITUACAO");

                    Status st = new Status();
                    st.setCodigo(cod);
                    st.setSituacao(situacao);
                    lista.add(st);
                }
            } catch (SQLException ex) {

            }
            return lista;
        }
        return lista;
    }

}

