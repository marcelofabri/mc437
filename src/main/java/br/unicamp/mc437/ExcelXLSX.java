package br.unicamp.mc437;

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
import br.unicamp.mc437.model.TipoBem;

public class ExcelXLSX
{
	private ArrayList<Patrimonio> lista = null;

    public void lerPlanilha(InputStream is) {
    	int pagina = 0;
    	lista = extractPatrimoniosFromCells(lePlanilha(is, pagina), pagina);
    }
    
    private Vector<Vector<XSSFCell>> lePlanilha(InputStream is, int sheet) {
        Vector<Vector<XSSFCell>> vetor = new Vector<Vector<XSSFCell>>();
        try  {
            XSSFWorkbook planilha = new XSSFWorkbook(is);
            // Read data at sheet 0
            XSSFSheet folha = planilha.getSheetAt(sheet);
	        Iterator<Row> linhas = folha.rowIterator();   
            // Looping every row at sheet 0
	        
            while (linhas.hasNext()) {
                XSSFRow linhaPlan = (XSSFRow)linhas.next();
                Iterator<Cell> celulas = linhaPlan.cellIterator();
	            Vector<XSSFCell> linhaAtual = new Vector<XSSFCell>();   
                // Looping every cell in each row at sheet 0
                while (celulas.hasNext())  {
                    XSSFCell celulaPlan = (XSSFCell) celulas.next();
                    linhaAtual.addElement(celulaPlan);
                }
                vetor.addElement(linhaAtual);
            }
        }
        catch (IOException ex)  {
        	throw new RuntimeException(ex);
        }
        return vetor;
    }

	private ArrayList<Patrimonio> extractPatrimoniosFromCells(Vector<Vector<XSSFCell>> vectorData, int sheet) {
		ArrayList<Patrimonio> lista = new ArrayList<Patrimonio>();
        for (int i=1; i<vectorData.size(); i++) {
            Vector<XSSFCell> linha = vectorData.get(i);
            Patrimonio bem = new Patrimonio();
            bem.setOrgao(linha.get(0).getStringCellValue());
            
            String chapinha = linha.get(1).getStringCellValue();
            if (chapinha == null || chapinha.trim().length() < 1) {
            	break;
            }
			bem.setChapinha(chapinha);
			
            bem.setDescricao(linha.get(2).getStringCellValue());
            bem.setMarca(linha.get(3).getStringCellValue());
            
            linha.get(4).setCellType(Cell.CELL_TYPE_STRING); // para poder pegar como string
            bem.setModelo(linha.get(4).getStringCellValue());
            
            linha.get(5).setCellType(Cell.CELL_TYPE_STRING); // para poder pegar como string
            bem.setNumeroSerie(linha.get(5).getStringCellValue());

            bem.setDataAquisicao(linha.get(6).getDateCellValue());
            bem.setDataFim(linha.get(7).getDateCellValue());

            bem.setValorCorrigido(linha.get(8).getNumericCellValue());
            
            bem.setProcesso(linha.get(9).getStringCellValue());

            linha.get(10).setCellType(Cell.CELL_TYPE_STRING); // para poder pegar como string
            bem.setDocumentoFiscal(linha.get(10).getStringCellValue());
            
            bem.setImovel(linha.get(11).getStringCellValue());
            
            linha.get(12).setCellType(Cell.CELL_TYPE_STRING); // para poder pegar como string
            String andar = linha.get(12).getStringCellValue();
            if (andar != null && andar.length() > 0) {
            	bem.setAndar(andar.charAt(0));
            }
            bem.setComplemento(linha.get(13).toString());
            
            
            bem.setSituacao(SituacaoBem.parseString(linha.get(14).getStringCellValue()));
            
            bem.setTipo(sheet == 0 ? TipoBem.PROPRIO : TipoBem.TERCEIROS);
            lista.add(bem);
        }
        return lista;
    }

	public ArrayList<Patrimonio> getLista() {
		return lista;
	}

	public void setLista(ArrayList<Patrimonio> lista) {
		this.lista = lista;
	}
}
