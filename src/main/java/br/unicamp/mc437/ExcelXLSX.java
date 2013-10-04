package br.unicamp.mc437;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Vector;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import br.unicamp.mc437.model.Patrimonio;
import br.unicamp.mc437.model.SituacaoBem;

public class ExcelXLSX
{
	private ArrayList<Patrimonio> lista = null;
	private ArrayList<String> listaEditada = null;

    public void lerPlanilha() {
    	setLista(getListaBens(lePlanilha("/Users/marcelofabri/Unicamp/mc437/mc437/src/main/webapp/planilha.xlsx")));
        setListaEditada(new ArrayList<String>());
        for (int i=0; i<getLista().size(); i++)
        {
        	Patrimonio bem = getLista().get(i);
        	getListaEditada().add(formatElement(bem.getChapinha(),bem.getDescricao(),
        			bem.getMarca(),bem.getAndar(),bem.getComplemento()));
        }
    }
    
    private Vector<Vector<XSSFCell>> lePlanilha(String nomeArq) {
        Vector<Vector<XSSFCell>> vetor = new Vector<Vector<XSSFCell>>();
        try  {
        	InputStream is = ExcelXLSX.class.getClassLoader().
        			getResourceAsStream(nomeArq);
        	
//            FileInputStream arquivo = new FileInputStream(is);
            XSSFWorkbook planilha = new XSSFWorkbook(is);
            // Read data at sheet 0
            XSSFSheet folha = planilha.getSheetAt(0);
	        Iterator<Row> linhas = folha.rowIterator();   
            // Looping every row at sheet 0
	        
	        int i = 0;
            while (linhas.hasNext()) {
                XSSFRow linhaPlan = (XSSFRow)linhas.next();
                Iterator<Cell> celulas = linhaPlan.cellIterator();
	            Vector<XSSFCell> linhaAtual = new Vector<XSSFCell>();   
                // Looping every cell in each row at sheet 0
	            int idx = 0;
                while (celulas.hasNext() && idx < 14)  {
                    XSSFCell celulaPlan = (XSSFCell) celulas.next();
                    linhaAtual.addElement(celulaPlan);
                    idx++;
                }
                vetor.addElement(linhaAtual);
                System.out.println("Lendo linha " + i);
                i++;
            }
        }
        catch (IOException ex)  {
        	throw new RuntimeException(ex);
        }
        return vetor;
    }

	private ArrayList<Patrimonio> getListaBens(Vector<Vector<XSSFCell>> vectorData) {
		ArrayList<Patrimonio> lista = new ArrayList<Patrimonio>();
        for (int i=1; i<vectorData.size(); i++) {
            Vector<XSSFCell> linha = vectorData.get(i);
            Patrimonio bem = new Patrimonio();
            bem.setOrgao(linha.get(0).getStringCellValue());
            bem.setChapinha(linha.get(1).getStringCellValue());
            bem.setDescricao(linha.get(2).getStringCellValue());
            bem.setMarca(linha.get(3).getStringCellValue());
            bem.setModelo(linha.get(4).getStringCellValue());
            bem.setNumeroSerie(linha.get(5).getStringCellValue());
//            if (linha.get(6).getStringCellValue().length() > 0)
//            {
//	            StringTokenizer dataAquis = new StringTokenizer(linha.get(6).getStringCellValue(), "-");
//	            int dia = Integer.parseInt(dataAquis.nextToken());
//	            int mes = leMes(dataAquis.nextToken());
//	            int ano = Integer.parseInt(dataAquis.nextToken()) - 1900;
//	            bem.setDataAquisicao(new Date(ano, mes, dia));
//            }
//            
            bem.setDataAquisicao(linha.get(6).getDateCellValue());
            bem.setDataFim(linha.get(7).getDateCellValue());
//            if (linha.get(7).getStringCellValue().length() > 0) {
//	            StringTokenizer dataFim = new StringTokenizer(linha.get(7).getStringCellValue(), "-");
//	            int dia = Integer.parseInt(dataFim.nextToken());
//	            int mes = leMes(dataFim.nextToken());
//	            int ano = Integer.parseInt(dataFim.nextToken()) - 1900;
//	            bem.setDataFim(new Date(ano, mes, dia));
//            }
            
            bem.setValorCorrigido(linha.get(8).getNumericCellValue());
            
            bem.setProcesso(linha.get(9).getStringCellValue());
            bem.setDocumentoFiscal(linha.get(10).getStringCellValue());
            
            bem.setImovel(linha.get(11).getStringCellValue());
            
            bem.setAndar(linha.get(12).getStringCellValue().charAt(0));
            bem.setComplemento(linha.get(13).toString());
            
            
            bem.setSituacao(SituacaoBem.parseString(linha.get(14).getStringCellValue()));
            lista.add(bem);
        }
        return lista;
    }

    private String formatElement (String s1, String s2, String s3, Character s4, String s5) {
    	if (s1.isEmpty() && s2.isEmpty() && s3.isEmpty() && s4 != null && s5.isEmpty())
    		return "";
		String ans = "<tr>";
		ans = ans + "<td><a href=\"home.html\">" + s1 + "</a></td>";
		ans = ans + "<td>" + s2 + "</td>";
		ans = ans + "<td>" + s3 + "</td>";
		ans = ans + "<td>" + s4 + "</td>";
		ans = ans + "<td>" + s5 + "</td>";
		ans = ans + "</tr>";
		while (ans.contains("\t")) ans = ans.replace("\t"," ");
		while (ans.contains("  ")) ans = ans.replace("  "," ");
		return ans;
	}

	public ArrayList<String> getListaEditada() {
		return listaEditada;
	}

	public void setListaEditada(ArrayList<String> listaEditada) {
		this.listaEditada = listaEditada;
	}

	public ArrayList<Patrimonio> getLista() {
		return lista;
	}

	public void setLista(ArrayList<Patrimonio> lista) {
		this.lista = lista;
	}
}
