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
    private String descricao;
    private Status status;
    private Usuario usuario;
    private Setor setor;

    public Chamado() {
    }

    public Chamado(int codigo, Setor setor, String descricao, Status status, Usuario usuario) {
        this.codigo = codigo;
        this.setor = setor;
        this.descricao = descricao;
        this.status = status;
        this.usuario = usuario;
        
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
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

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Setor getSetor() {
        return setor;
    }

    public void setSetor(Setor setor) {
        this.setor = setor;
    }
}
