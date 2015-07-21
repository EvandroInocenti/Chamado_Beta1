/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dados;

import sun.security.util.Password;

/**
 *
 * @author evandro
 */
public class Usuario {

    private int codigo;
    private String nome;
    private String senha;
    private String email;
    private Unidade unidade;
    

    public Usuario() {
    }

    public Usuario(int codigo, String nome, String senha, Unidade unidade, String email ) {
        this.codigo = codigo;
        this.nome = nome;
        this.email = email;
        this.unidade = unidade;
        this.senha = senha;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Unidade getUnidade() {
        return unidade;
    }

    public void setUnidade(Unidade unidade) {
        this.unidade = unidade;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    
    
}