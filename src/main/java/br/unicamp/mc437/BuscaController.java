package br.unicamp.mc437;

import java.io.IOException;
import java.io.InputStream;
import java.io.PushbackInputStream;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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

import br.unicamp.mc437.Conflitos.Conflito;
import br.unicamp.mc437.model.AlteracaoPatrimonio;
import br.unicamp.mc437.model.LocalizacaoBem;
import br.unicamp.mc437.model.Patrimonio;
import br.unicamp.mc437.model.StatusAlteracaoPatrimonio;

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
	
	@RequestMapping(value = "/detalhes", method = RequestMethod.GET)
	@Transactional
	public ModelAndView detalhesPatrimonios(ModelMap model, @RequestParam String bem) {
	  
		System.out.println("Got request param: " + bem);  
		
		Query query = entityManager
				.createQuery("SELECT p FROM Patrimonio p WHERE P.chapinha LIKE :number");
		query.setParameter("number", bem);
		
		ModelAndView mav = new ModelAndView("detalhes.jsp");
	    mav.addObject("pventry", query.getResultList().get(0));
	    
		return mav;
	}
	
	@RequestMapping(value = "/conflito", method = RequestMethod.GET)
	@Transactional
	public ModelAndView conflito(ModelMap model) {
		ModelAndView mav = new ModelAndView("conflito.jsp");
		Conflitos c = Conflitos.getInstance();
		mav.addObject("lista",c.lista);
	    
		return mav;
	}
	
	@RequestMapping(value = {"/home", ""}, method = RequestMethod.GET)
	@Transactional
	public String home(ModelMap model) {
		return "home.jsp";
	}
	
	@RequestMapping(value = "/requisicao", method = RequestMethod.GET)
	@Transactional
	public ModelAndView requisicao(ModelMap model) {
		ModelAndView mav = new ModelAndView("requisicao.jsp");
		return mav;
	}
	
	@RequestMapping(value = "/home2", method = RequestMethod.GET)
	@Transactional
	public ModelAndView home2(ModelMap model) {
		ModelAndView mav = new ModelAndView("home2.jsp");
	    
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
		ModelAndView mav = new ModelAndView("erro.jsp");
	    
		return mav;
	}
	
	@RequestMapping(value = "/contato", method = RequestMethod.GET)
	@Transactional
	public ModelAndView contato(ModelMap model) {
		ModelAndView mav = new ModelAndView("contato.jsp");
	    
		return mav;
	}
	
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	@Transactional
	public ModelAndView upload(ModelMap model) {
		ModelAndView mav = new ModelAndView("upload.jsp");
	    
		return mav;
	}
	
	@RequestMapping(value = "/criaAlteracoes", method = RequestMethod.GET)
	@Transactional
	public String criaAlteracoes(ModelMap model) {
		Query q = entityManager.createQuery("SELECT p FROM Patrimonio p WHERE p.chapinha = :chapinha");
		q.setParameter("chapinha", "01/0000027628");
		Patrimonio p = (Patrimonio) q.getSingleResult();
		
		for (int i = 0; i < 10; i++) {
			AlteracaoPatrimonio ap = new AlteracaoPatrimonio();
			ap.setPatrimonio(p);
			ap.setUsuarioCriacao("marcelo");
			ap.setLocalizacaoAntiga(p.getLocalizacao());
			LocalizacaoBem loc = new LocalizacaoBem(p.getLocalizacao());
			loc.setImovel("TESTE");
			ap.setLocalizacaoNova(loc);
			
			entityManager.merge(ap);
		}
		
		entityManager.flush();
		return "home.jsp";
	}
	
	@RequestMapping(value = "/listaAlteracoes", method = RequestMethod.GET)
	@Transactional
	public ModelAndView listaAlteracoes(ModelMap model) {
		ModelAndView mav = new ModelAndView("lista_alteracoes.jsp");
		
		Query query = entityManager.createQuery("SELECT ap FROM AlteracaoPatrimonio ap JOIN FETCH ap.patrimonio WHERE ap.status = :status");
		query.setParameter("status", StatusAlteracaoPatrimonio.PENDENTE);
		
		@SuppressWarnings("unchecked")
		List<AlteracaoPatrimonio> results = query.getResultList();
		for (AlteracaoPatrimonio ap : results) {
			System.out.println(ap.getUsuarioCriacao());
		}
	    mav.addObject("lista", query.getResultList());
	    
	    return mav;
	}
	
	@RequestMapping(value = "/uploadArquivo", method = RequestMethod.POST)
	@Transactional
	public ModelAndView processUpload(@RequestParam MultipartFile file, WebRequest webRequest, Model model) {

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
				Query query = entityManager.createQuery("SELECT p FROM Patrimonio p WHERE p.chapinha = :chapinha");
				query.setParameter("chapinha", p.getChapinha());
				
				try
				{
					Patrimonio p1 = (Patrimonio) query.getSingleResult();
					Conflitos c = Conflitos.getInstance();
					if (!p1.equals(p))
					{
						Conflito e = new Conflito("radio"+c.lista.size(),p1,p);
						c.lista.add(e);
					}
				}
				catch(Exception e)
				{
					
				}
				
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
	
	@RequestMapping(value = "/executaAlteracao", method = RequestMethod.POST)
	@Transactional
	public ModelAndView processUpdate( 
			@RequestParam("j_pi") String pi, @RequestParam("j_imovel") String imovel,
			@RequestParam("j_andar") String andar, @RequestParam("j_complemento") String complemento,
			WebRequest webRequest, Model model)
	{
		AlteracaoPatrimonio ap = new AlteracaoPatrimonio();
		LocalizacaoBem novoLocal = new LocalizacaoBem();
		novoLocal.setAndar(andar.charAt(0));
		novoLocal.setComplemento(complemento);
		novoLocal.setImovel(imovel);
		ap.setLocalizacaoNova(novoLocal);
		Query q = entityManager.createQuery("SELECT p FROM Patrimonio p WHERE p.chapinha = :chapinha");
		q.setParameter("chapinha", pi);
		Patrimonio p = (Patrimonio)q.getSingleResult();
		ap.setPatrimonio(p);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    String name = auth.getName();
	    ap.setUsuarioCriacao(name);
	    ap.setLocalizacaoAntiga(p.getLocalizacao());
	    entityManager.merge(ap);
	    entityManager.flush();
		return new ModelAndView("requisicaoSucesso.html");
	}

}