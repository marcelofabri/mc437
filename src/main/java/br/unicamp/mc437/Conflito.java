package br.unicamp.mc437;

import java.io.Serializable;

import br.unicamp.mc437.model.Patrimonio;

public class Conflito implements Serializable {
	
	private static final long serialVersionUID = -4311078210763046667L;

	private Patrimonio patrimonioAntigo;
	
	private Patrimonio patrimonioNovo;
	
	public Conflito(Patrimonio patrimonioBD, Patrimonio patrimonioXLS) {
		patrimonioAntigo = patrimonioBD;
		patrimonioNovo = patrimonioXLS;
	}

	public Patrimonio getPatrimonioAntigo() {
		return patrimonioAntigo;
	}

	public void setPatrimonioAntigo(Patrimonio patrimonioAntigo) {
		this.patrimonioAntigo = patrimonioAntigo;
	}

	public Patrimonio getPatrimonioNovo() {
		return patrimonioNovo;
	}

	public void setPatrimonioNovo(Patrimonio patrimonioNovo) {
		this.patrimonioNovo = patrimonioNovo;
	}
	
}
