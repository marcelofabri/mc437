package br.unicamp.mc437;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.unicamp.mc437.model.Patrimonio;

@Controller
@RequestMapping("/hello")
public class TesteController {
 
	@PersistenceContext(unitName = "mc437PersistenceUnit")
	private EntityManager entityManager;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	@Transactional
	public ModelAndView printHello(ModelMap model) {
	  
		ExcelXLSX excelXLSX = new ExcelXLSX();
		excelXLSX.lerPlanilha();
		
		for (Patrimonio p : excelXLSX.getLista()) {
			entityManager.merge(p);
		}
		
		entityManager.flush();
		
		System.out.println("TESTETEEETETETETE");
		ModelAndView mav = new ModelAndView("busca");
	    mav.addObject("lista", excelXLSX.getLista());
	    
		return mav;
	}

}