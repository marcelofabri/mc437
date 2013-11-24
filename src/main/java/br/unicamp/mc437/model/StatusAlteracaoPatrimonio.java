package br.unicamp.mc437.model;

public enum StatusAlteracaoPatrimonio {
	PENDENTE,
	APROVADA,
	RECUSADA;
	
	public String toString() {
		if (this.equals(PENDENTE)) {
			return "Pendente";
		}
		if (this.equals(APROVADA)) {
			return "Aprovada";
		}
		if (this.equals(RECUSADA)) {
			return "Recusada";
		}
		return super.toString();
	}
}
