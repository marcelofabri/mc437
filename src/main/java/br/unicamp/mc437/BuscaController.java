package br.unicamp.mc437;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import br.unicamp.mc437.model.Patrimonio;

@Controller
@RequestMapping("/")
public class BuscaController {
 
	@PersistenceContext(unitName = "mc437PersistenceUnit")
	private EntityManager entityManager;
	
	@RequestMapping(value = "/busca", method = RequestMethod.GET)
	@Transactional
	public ModelAndView buscarPatrimonios(ModelMap model) {
	  
		Query query = entityManager.createQuery("SELECT p FROM Patrimonio p");
		
		ModelAndView mav = new ModelAndView("busca");
	    mav.addObject("lista", query.getResultList());
	    
		return mav;
	}
	
	@RequestMapping(value = "/importar", method = RequestMethod.GET)
	@Transactional
	public @ResponseBody String importarDaPlanilha(ModelMap model) {
	  
		ExcelXLSX excelXLSX = new ExcelXLSX();
		excelXLSX.lerPlanilha();
		
		for (Patrimonio p : excelXLSX.getLista()) {
			entityManager.merge(p);
		}
		
		entityManager.flush();
	    
		return "Pronto!";
	}

}