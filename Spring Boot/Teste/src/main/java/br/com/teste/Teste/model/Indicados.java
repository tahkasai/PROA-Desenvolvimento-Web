package br.com.teste.Teste.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import jakarta.persistence.Column;

@Getter
@Setter
@Entity 
@Table(name = "indicados_ao_oscar")
public class Indicados {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_registro", nullable = false, unique = true)
    private Long idRegistro; 
    
    @Column(name = "ano_filmagem")
    private int anoFilmagem;

    @Column(name = "ano_cerimonia")
    private int anoCerimonia;

    @Column(name = "edicao_cerimonia")
    private int edicaoCerimonia;

    @Column(name = "categoria")
    private String categoria;

    @Column(name = "nome_filme")
    private String nomeFilme;

    @Column(name = "nome_indicado")
    private String nomeIndicado;

    @Column(name = "vencedor")
    private boolean vencedor;

    // Constructors
    public Indicados() {
    }

    public Indicados(int anoFilmagem, int anoCerimonia, int edicaoCerimonia, String categoria, String nomeFilme,
            String nomeIndicado, boolean vencedor) {
        this.anoFilmagem = anoFilmagem;
        this.anoCerimonia = anoCerimonia;
        this.edicaoCerimonia = edicaoCerimonia;
        this.categoria = categoria;
        this.nomeFilme = nomeFilme;
        this.nomeIndicado = nomeIndicado;
        this.vencedor = vencedor;
    }

    // Getters and Setters
    public int getAnoFilmagem() {
        return anoFilmagem;
    }

    public void setAnoFilmagem(int anoFilmagem) {
        this.anoFilmagem = anoFilmagem;
    }

    public int getAnoCerimonia() {
        return anoCerimonia;
    }

    public void setAnoCerimonia(int anoCerimonia) {
        this.anoCerimonia = anoCerimonia;
    }

    public int getEdicaoCerimonia() {
        return edicaoCerimonia;
    }

    public void setEdicaoCerimonia(int edicaoCerimonia) {
        this.edicaoCerimonia = edicaoCerimonia;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getNomeFilme() {
        return nomeFilme;
    }

    public void setNomeFilme(String nomeFilme) {
        this.nomeFilme = nomeFilme;
    }

    public String getNomeIndicado() {
        return nomeIndicado;
    }

    public void setNomeIndicado(String nomeIndicado) {
        this.nomeIndicado = nomeIndicado;
    }

    public boolean isVencedor() {
        return vencedor;
    }

    public void setVencedor(boolean vencedor) {
        this.vencedor = vencedor;
    }

    public Long getIdRegistro() {
        return idRegistro;
    }

    public void setIdRegistro(Long idRegistro) {
        this.idRegistro = idRegistro;
    }
}
