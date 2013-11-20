package br.unicamp.mc437.model;

import java.util.Date;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="alteracaoPatrimonio")
@SequenceGenerator(name="AlteracaoPatrimonioSequence", sequenceName="AlteracaoPatrimonioSequence", allocationSize=1, initialValue=0)
public class AlteracaoPatrimonio {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator="AlteracaoPatrimonioSequence")
	private Integer id;
	
	@Column(name="status", length=50)
	@Enumerated(EnumType.STRING)
	private StatusAlteracaoPatrimonio status = StatusAlteracaoPatrimonio.PENDENTE;
	
	@Column(name="dataCriacao")
	private Date dataCriacao = new Date();
	
	@Column(name="dataRevisao")
	private Date dataRevisao;
	
	@Column(name="usuarioCriacao", length=250)
	private String usuarioCriacao;
	
	@Column(name="usuarioRevisao", length=250)
	private String usuarioRevisao;
	
	@Embedded
	@AttributeOverrides({  
	    @AttributeOverride(name="imovel",column=@Column(name="imovel_antigo", length=50)),  
	    @AttributeOverride(name="andar",column=@Column(name="andar_antigo", length=50)),  
	    @AttributeOverride(name="complemento",column=@Column(name="complemento_antigo", length=50))  
	})
	private LocalizacaoBem localizacaoAntiga;
	
	@Embedded
	@AttributeOverrides({  
	    @AttributeOverride(name="imovel",column=@Column(name="imovel_novo", length=50)),  
	    @AttributeOverride(name="andar",column=@Column(name="andar_novo", length=50)),  
	    @AttributeOverride(name="complemento",column=@Column(name="complemento_novo", length=50))  
	})
	private LocalizacaoBem localizacaoNova;
	
	public StatusAlteracaoPatrimonio getStatus() {
		return status;
	}

	public void setStatus(StatusAlteracaoPatrimonio status) {
		this.status = status;
	}

	public Date getDataCriacao() {
		return dataCriacao;
	}

	public void setDataCriacao(Date dataCriacao) {
		this.dataCriacao = dataCriacao;
	}

	public Date getDataRevisao() {
		return dataRevisao;
	}

	public void setDataRevisao(Date dataRevisao) {
		this.dataRevisao = dataRevisao;
	}

	public String getUsuarioCriacao() {
		return usuarioCriacao;
	}

	public void setUsuarioCriacao(String usuarioCriacao) {
		this.usuarioCriacao = usuarioCriacao;
	}

	public String getUsuarioRevisao() {
		return usuarioRevisao;
	}

	public void setUsuarioRevisao(String usuarioRevisao) {
		this.usuarioRevisao = usuarioRevisao;
	}

	public LocalizacaoBem getLocalizacaoAntiga() {
		return localizacaoAntiga;
	}

	public void setLocalizacaoAntiga(LocalizacaoBem localizacaoAntiga) {
		this.localizacaoAntiga = localizacaoAntiga;
	}

	public LocalizacaoBem getLocalizacaoNova() {
		return localizacaoNova;
	}

	public void setLocalizacaoNova(LocalizacaoBem localizacaoNova) {
		this.localizacaoNova = localizacaoNova;
	}

	public Patrimonio getPatrimonio() {
		return patrimonio;
	}

	public void setPatrimonio(Patrimonio patrimonio) {
		this.patrimonio = patrimonio;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch=FetchType.LAZY)
	private Patrimonio patrimonio;
	
	
}
