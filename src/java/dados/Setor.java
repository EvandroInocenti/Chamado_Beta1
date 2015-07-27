/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dados;

/**
 *
 * @author evandro
 */
public class Setor {

    private int codigo;
    private String nome;
    Atendente atendente;

    public Setor() {
    }

    public Setor(int codigo, String nome, Atendente atendente) {
        this.codigo = codigo;
        this.nome = nome;
        this.atendente = atendente;
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

    public Atendente getAtendente() {
        return atendente;
    }

    public void setAtendente(Atendente atendente) {
        this.atendente = atendente;
    }

}
