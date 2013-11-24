package br.unicamp.mc437.model;


import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
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
	
	public boolean conflita(Patrimonio p2) {
		
		try {
			for (PropertyDescriptor propertyDescriptor : 
			    Introspector.getBeanInfo(this.getClass(), Object.class).getPropertyDescriptors()) {

				Method m = propertyDescriptor.getReadMethod();
				
				if (m != null) {
					if (m.getReturnType().equals(LocalizacaoBem.class)) {
						LocalizacaoBem l1 = (LocalizacaoBem) m.invoke(this);
						LocalizacaoBem l2 = (LocalizacaoBem) m.invoke(p2);
						
						for (PropertyDescriptor descriptor : 
						    Introspector.getBeanInfo(LocalizacaoBem.class, Object.class).getPropertyDescriptors()) {
							Method mm = descriptor.getReadMethod();
							
							if (mm != null) {
								Object r1 = mm.invoke(l1);
								Object r2 = mm.invoke(l2);
								if (r1 != r2 && (r1 != null && ! mm.invoke(l1).equals(mm.invoke(l2)))) {
									return true;
								}
							}
						}
					} else {
						Object r1 = m.invoke(this);
						Object r2 = m.invoke(p2);
						if (r1 != r2 && (r1 != null && ! r1.equals(r2))) {
							return true;
						}
					}
				}
			}
		} catch (IntrospectionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
}
