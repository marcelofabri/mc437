package br.unicamp.mc437.model;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class LocalizacaoBem {

	@Column(name="imovel", length=50)
	private String imovel;

	@Column(name="andar", length=1)
	private Character andar;
	
	@Column(name="complemento", length=50)
	private String complemento;

	public LocalizacaoBem(LocalizacaoBem loc) {
		this.setAndar(loc.getAndar());
		this.setComplemento(loc.getComplemento());
		this.setImovel(loc.getImovel());
	}
	
	public LocalizacaoBem() {
		super();
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
}
