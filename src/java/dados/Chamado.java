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
public class Chamado {

    private int codigo;
    private String tipo, descricao;

    //private Atendente atendente;
    private Status status;
    private Usuario usuario;
    private Setor setor;

    public Chamado() {
    }

    public Chamado(int codigo, String tipo, String descricao, Status status, Usuario usuario, Setor setor) {
        this.codigo = codigo;
        this.tipo = tipo;
        this.descricao = descricao;
        this.status = status;
        this.usuario = usuario;
        this.setor = setor;

    }

    public Setor getSetor() {
        return setor;
    }

    public void setSetor(Setor setor) {
        this.setor = setor;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

}
