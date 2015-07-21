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
public class Status {

    private int codigo;
    private String situacao;

    public Status(int codigo, String situacao) {
        this.codigo = codigo;
        this.situacao = situacao;
    }

    public Status() {
    }
    
     public void setSituacao(String situacao) {
         this.situacao = situacao;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getSituacao() {
        return situacao;
    }

   
}
