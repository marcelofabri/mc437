package br.unicamp.mc437.model;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="patrimonio")
public class Patrimonio {
	
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
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
	
	@Column(name="imovel", length=50)
	private String imovel;

	@Column(name="andar", length=1)
	private Character andar;
	
	@Column(name="complemento", length=50)
	private String complemento;
	
	@Column(name="situacao", length=50)
	@Enumerated(EnumType.STRING)
	private SituacaoBem situacao;
	
	@Column(name="tipo", length=50)
	@Enumerated(EnumType.STRING)
	private TipoBem tipo;

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
	
	public String getImovel() {
		return imovel;
	}

	public void setImovel(String imovel) {
		this.imovel = imovel;
	}

	public Character getAndar() {
		return andar;
	}

	public void setAndar(Character andar) {
		this.andar = andar;
	}

	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
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

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
}
