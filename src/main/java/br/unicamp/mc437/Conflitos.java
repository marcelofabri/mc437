package br.unicamp.mc437;

import java.util.ArrayList;

import br.unicamp.mc437.model.Patrimonio;

public class Conflitos
{
	public ArrayList<Conflito> lista;
	private static Conflitos instance;
	
	public Conflitos()
	{
		if (instance == null)
		{
			lista = new ArrayList<Conflito>();
			instance = this;
		}
	}
	
	public static Conflitos getInstance()
	{
		if (instance == null)
		{
			return new Conflitos();
		}
		return instance;
	}
	
	public static class Conflito
	{
		String id;
		String antigo;
		String novo;
		
		public Conflito(String id, Patrimonio antigo, Patrimonio novo)
		{
			this.id = id;
			setAntigo(antigo);
			setNovo(novo);
			//formatColor();
		}

		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

		public String getAntigo() {
			return antigo;
		}

		public void setAntigo(Patrimonio p) {
			antigo = "<b>Órgão:</b> "+p.getOrgao()+"<br>";
			antigo += "<b>PI:</b> "+p.getChapinha()+"<br>";
			antigo += "<b>Processo:</b> "+p.getProcesso()+"<br>";
			antigo += "<b>Número de Série:</b> "+p.getNumeroSerie()+"<br>";
			antigo += "<b>Documento Fiscal:</b> "+p.getDocumentoFiscal()+"<br>";
			antigo += "<b>Data Aquisição:</b> "+p.getDataAquisicao()+"<br>";
			antigo += "<b>Data Fim:</b> "+p.getDataFim()+"<br>";
			antigo += "<b>Valor Corrigido:</b> "+p.getDataAquisicao()+"<br>";
			antigo += "<b>Descrição:</b> "+p.getDescricao()+"<br>";
			antigo += "<b>Marca:</b> "+p.getMarca()+"<br>";
			antigo += "<b>Modelo:</b> "+p.getModelo()+"<br>";
			antigo += "<b>Imóvel:</b> "+p.getLocalizacao().getImovel()+"<br>";
			antigo += "<b>Andar:</b> "+p.getLocalizacao().getAndar()+"<br>";
			antigo += "<b>Complemento:</b> "+p.getLocalizacao().getComplemento()+"<br>";
			antigo += "<b>Situação:</b> "+p.getSituacao()+"<br>";
			antigo += "<b>Tipo:</b> "+p.getTipo();

			//formatColor();
		}

		public String getNovo() {
			return novo;
		}

		public void setNovo(Patrimonio p) {
			novo = "<b>Órgão:</b> "+p.getOrgao()+"<br>";
			novo += "<b>PI:</b> "+p.getChapinha()+"<br>";
			novo += "<b>Processo:</b> "+p.getProcesso()+"<br>";
			novo += "<b>Número de Série:</b> "+p.getNumeroSerie()+"<br>";
			novo += "<b>Documento Fiscal:</b> "+p.getDocumentoFiscal()+"<br>";
			novo += "<b>Data Aquisição:</b> "+p.getDataAquisicao()+"<br>";
			novo += "<b>Data Fim:</b> "+p.getDataFim()+"<br>";
			novo += "<b>Valor Corrigido:</b> "+p.getDataAquisicao()+"<br>";
			novo += "<b>Descrição:</b> "+p.getDescricao()+"<br>";
			novo += "<b>Marca:</b> "+p.getMarca()+"<br>";
			novo += "<b>Modelo:</b> "+p.getModelo()+"<br>";
			novo += "<b>Imóvel:</b> "+p.getLocalizacao().getImovel()+"<br>";
			novo += "<b>Andar:</b> "+p.getLocalizacao().getAndar()+"<br>";
			novo += "<b>Complemento:</b> "+p.getLocalizacao().getComplemento()+"<br>";
			novo += "<b>Situação:</b> "+p.getSituacao()+"<br>";
			novo += "<b>Tipo:</b> "+p.getTipo();
			
			//formatColor();
		}
		
		public void formatColor()
		{
			if (antigo!=null && !antigo.isEmpty() && novo!=null && !novo.isEmpty())
			{
				String[] a = antigo.split("<br>");
				String[] n = novo.split("<br>");
				
				if (a.length != n.length) return;
				
				for (int i=0; i<a.length; i++)
				{
					if (!a[i].equals(n[i]))
					{
						antigo.replace(a[i], "<span style=\"color:red\">" + a[i] + "</span>");
						novo.replace(n[i], "<span style=\"color:red\">" + n[i] + "</span>");
						a[i] = "<span style=\"color:red\">" + a[i] + "</span>";
						n[i] = "<span style=\"color:red\">" + n[i] + "</span>";
					}
				}
			}
		}
	}
}
