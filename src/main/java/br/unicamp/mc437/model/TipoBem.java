package br.unicamp.mc437.model;

public enum TipoBem {
	PROPRIO,
	TERCEIROS;
	
	public String toString() {
		if (this.equals(PROPRIO)) {
			return "Pr\u00F3prio";
		} 
		if (this.equals(TERCEIROS)) {
			return "Terceiros";
		} 
		return super.toString();
	}
}
