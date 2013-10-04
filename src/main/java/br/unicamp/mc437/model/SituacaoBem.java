package br.unicamp.mc437.model;

public enum SituacaoBem {
	ATIVO,
	CEDIDO,
	CEDIDO_TERCEIROS,
	DESCONHECIDO;
	
	public static SituacaoBem parseString(String str) {
		
		if (str != null) {
			str = str.toUpperCase();
			
			if ("ATIVO".equals(str)) {
				return ATIVO;
			}
			if ("CEDIDO".equals(str)) {
				return CEDIDO;
			}
			
			if ("CEDIDO P/ TERCEIROS".equals(str)) {
				return CEDIDO_TERCEIROS;
			}
		}
		
		return DESCONHECIDO;
	}
}
