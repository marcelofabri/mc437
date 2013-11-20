package br.unicamp.mc437.model;


import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="patrimonio")
public class Patrimonio {
	
	@Column(name="orgao", length=200)
	private String orgao;
	
	@Id
	@Column(name="chapinha", length=200)
	private String chapinha;
	
	@Column(name="descricao", length=400)
	private String descricao;
	
	@Column(name="marca", length=50)
	private String marca;
	
	@Column(name="modelo", length=100)
	private String modelo;
	
	@Column(name="numeroSerie", length=100)
	private String numeroSerie;
	
	@Column(name="dataAquisicao")
	private Date dataAquisicao;
	
	@Column(name="dataFim")
	private Date dataFim;
	
	@Column(name="valorCorrigido")
	private Double valorCorrigido;
	
	@Column(name="processo", length=50)
	private String processo;
	
	@Column(name="documentoFiscal", length=50)
	private String documentoFiscal;
	
	@Embedded
	private LocalizacaoBem localizacao;
	
	@Column(name="situacao", length=50)
	@Enumerated(EnumType.STRING)
	private SituacaoBem situacao;
	
	@Column(name="tipo", length=50)
	@Enumerated(EnumType.STRING)
	private TipoBem tipo;
	
	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	private List<AlteracaoPatrimonio> alteracoes;

	public String getOrgao() {
		return orgao;
	}

	public void setOrgao(String orgao) {
		this.orgao = orgao;
	}

	public String getChapinha() {
		return chapinha;
	}

	public void setChapinha(String chapinha) {
		this.chapinha = chapinha;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public String getModelo() {
		return modelo;
	}

	public void setModelo(String modelo) {
		this.modelo = modelo;
	}

	public String getNumeroSerie() {
		return numeroSerie;
	}

	public void setNumeroSerie(String numeroSerie) {
		this.numeroSerie = numeroSerie;
	}

	public Date getDataAquisicao() {
		return dataAquisicao;
	}

	public void setDataAquisicao(Date dataAquisicao) {
		this.dataAquisicao = dataAquisicao;
	}

	public Date getDataFim() {
		return dataFim;
	}

	public void setDataFim(Date dataFim) {
		this.dataFim = dataFim;
	}

	public Double getValorCorrigido() {
		return valorCorrigido;
	}

	public void setValorCorrigido(Double valorCorrigido) {
		this.valorCorrigido = valorCorrigido;
	}

	public String getProcesso() {
		return processo;
	}

	public void setProcesso(String processo) {
		this.processo = processo;
	}

	public String getDocumentoFiscal() {
		return documentoFiscal;
	}

	public void setDocumentoFiscal(String documentoFiscal) {
		this.documentoFiscal = documentoFiscal;
	}
	
	public SituacaoBem getSituacao() {
		return situacao;
	}

	public void setSituacao(SituacaoBem situacao) {
		this.situacao = situacao;
	}

	public TipoBem getTipo() {
		return tipo;
	}

	public void setTipo(TipoBem tipo) {
		this.tipo = tipo;
	}

	public LocalizacaoBem getLocalizacao() {
		return localizacao;
	}

	public void setLocalizacao(LocalizacaoBem localizacao) {
		this.localizacao = localizacao;
	}
	
	public boolean equals(Patrimonio p2)
	{
		if (this.getChapinha() != p2.getChapinha()) return false;
		if (this.getDataAquisicao() != p2.getDataAquisicao()) return false;
		if (this.getDataFim() != p2.getDataFim()) return false;
		if (this.getDescricao() != p2.getDescricao()) return false;
		if (this.getDocumentoFiscal() != p2.getDocumentoFiscal()) return false;
		if (this.getLocalizacao().getAndar() != p2.getLocalizacao().getAndar()) return false;
		if (this.getLocalizacao().getComplemento() != p2.getLocalizacao().getComplemento()) return false;
		if (this.getLocalizacao().getImovel() != p2.getLocalizacao().getImovel()) return false;
		if (this.getMarca() != p2.getMarca()) return false;
		if (this.getModelo() != p2.getModelo()) return false;
		if (this.getNumeroSerie() != p2.getNumeroSerie()) return false;
		if (this.getOrgao() != p2.getOrgao()) return false;
		if (this.getProcesso() != p2.getProcesso()) return false;
		if (this.getSituacao() != p2.getSituacao()) return false;
		if (this.getTipo() != p2.getTipo()) return false;
		if (this.getValorCorrigido() != p2.getValorCorrigido()) return false;
		return true;
	}
}
