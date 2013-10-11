package br.unicamp.mc437;

import java.io.IOException;
import java.io.InputStream;
import java.io.PushbackInputStream;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import br.unicamp.mc437.model.Patrimonio;

@Controller
@RequestMapping("")
public class BuscaController {
 
	@PersistenceContext(unitName = "mc437PersistenceUnit")
	private EntityManager entityManager;
	
	@RequestMapping(value = "/busca", method = RequestMethod.GET)
	@Transactional
	public ModelAndView buscarPatrimonios(ModelMap model) {
	  
		Query query = entityManager.createQuery("SELECT p FROM Patrimonio p");
		
		ModelAndView mav = new ModelAndView("busca.jsp");
	    mav.addObject("lista", query.getResultList());
	    
		return mav;
	}
	
	@RequestMapping(value = {"/home", ""}, method = RequestMethod.GET)
	@Transactional
	public String home(ModelMap model) {
		return "home.html";
	}
	
	@RequestMapping(value = "/home2", method = RequestMethod.GET)
	@Transactional
	public ModelAndView home2(ModelMap model) {
		ModelAndView mav = new ModelAndView("home2.html");
	    
		return mav;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	@Transactional
	public ModelAndView login(ModelMap model) {
		ModelAndView mav = new ModelAndView("login.jsp");
	    
		return mav;
	}
	
	@RequestMapping(value = "/erro", method = RequestMethod.GET)
	@Transactional
	public ModelAndView erro(ModelMap model) {
		ModelAndView mav = new ModelAndView("erro.html");
	    
		return mav;
	}
	
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	@Transactional
	public ModelAndView upload(ModelMap model) {
		ModelAndView mav = new ModelAndView("upload.jsp");
	    
		return mav;
	}
	
	@RequestMapping(value = "/uploadArquivo", method = RequestMethod.POST)
	@Transactional
	public ModelAndView processUpload(@RequestParam MultipartFile file, WebRequest webRequest, Model model) {

		System.out.println("entrou!!!");
        ModelMap modelMap = new ModelMap(); 
        boolean updated = false;
        try {
        	InputStream filecontent = file.getInputStream();
			if (!filecontent.markSupported()) {
				filecontent = new PushbackInputStream(filecontent);
			}

			ExcelXLSX excelXLSX = new ExcelXLSX();
			excelXLSX.lerPlanilha(filecontent);
			
			for (Patrimonio p : excelXLSX.getLista()) {
				entityManager.merge(p);
			}
			
			entityManager.flush();
			
			updated = true;
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        modelMap.addAttribute("updated", updated);
        return new ModelAndView("upload.jsp", modelMap);
    }

}