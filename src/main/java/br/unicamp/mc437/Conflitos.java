package br.unicamp.mc437;

import java.util.ArrayList;

public class Conflitos
{
	public ArrayList<Conflito> lista;
	
	public Conflitos()
	{
		lista = new ArrayList<Conflito>();
		lista.add(new Conflito("radio1","antigo1","novo1"));
		lista.add(new Conflito("radio2","antigo2","novo2"));
		lista.add(new Conflito("radio3","antigo3","novo3"));
		lista.add(new Conflito("radio4","antigo4","novo4"));
		lista.add(new Conflito("radio5","antigo5","novo5"));
	}
	
	public class Conflito
	{
		String id;
		String antigo;
		String novo;
		
		public Conflito(String id, String antigo, String novo)
		{
			this.id = id;
			this.antigo = antigo;
			this.novo = novo;
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

		public void setAntigo(String antigo) {
			this.antigo = antigo;
		}

		public String getNovo() {
			return novo;
		}

		public void setNovo(String novo) {
			this.novo = novo;
		}
	}
}
