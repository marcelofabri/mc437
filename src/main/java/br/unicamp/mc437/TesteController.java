package br.unicamp.mc437;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import br.unicamp.mc437.model.Patrimonio;

@Controller
@RequestMapping("/hello")
public class TesteController {
 
	@PersistenceContext(unitName = "mc437PersistenceUnit")
	private EntityManager entityManager;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	@Transactional
	public @ResponseBody String printHello(ModelMap model) {
	  
		Patrimonio p = new Patrimonio();
		p.setNome("teste");
		
		System.out.println(p);
		p = entityManager.merge(p);
		
		entityManager.flush();
		
		System.out.println(p.getId());
		return "hello";
	}

}