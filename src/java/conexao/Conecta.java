/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author evandro
 */
public class Conecta {

    //private String URL = "jdbc:mysql://localhost/progWeb2";

    private String URL = "jdbc:mysql://localhost/chamado";
    private String USERNAME = "root";
    private String PASSWORD = "root";
    private Connection conexao;
    private Statement stm;
    private String msg;

    public Conecta() {
        this.msg = this.iniciaConexao();
    }

    public Conecta(String user, String senha) {
        this.USERNAME = user;
        this.PASSWORD = senha;
        this.msg = this.iniciaConexao();
    }

    public String iniciaConexao() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            this.conexao = DriverManager.getConnection(URL, USERNAME, PASSWORD);

// Definimos o objeto responsÃ¡vel por executar os comandos 
            this.stm = this.getConexao().createStatement();
            return "sucesso";
        } catch (ClassNotFoundException e) {
            this.conexao = null;
            return "Não foi possivel encontrar o driver de banco: " + e.getMessage();
        } catch (SQLException e) {
            this.conexao = null;
            return "SQLException Erro!" + e.getMessage();
        }
    }

    public String fechaConexao() {
        try {
            if (this.getConexao() != null) {
                this.getConexao().close();
                this.conexao = null;
            }
            if (this.getStm() != null) {
                this.stm = null;
            }
            return "";
        } catch (SQLException ex) {
            return "Houve erro no fechamento da conexão! " + ex.getMessage();
        }
    }

    public Connection getConexao() {
        return conexao;
    }

    public Statement getStm() {
        return stm;
    }

    public String getMsg() {
        return msg;
    }
}
