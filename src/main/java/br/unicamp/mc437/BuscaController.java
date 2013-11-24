package br.unicamp.mc437;

import java.io.IOException;
import java.io.InputStream;
import java.io.PushbackInputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import br.unicamp.mc437.model.AlteracaoPatrimonio;
import br.unicamp.mc437.model.LocalizacaoBem;
import br.unicamp.mc437.model.Patrimonio;
import br.unicamp.mc437.model.StatusAlteracaoPatrimonio;

@Controller
@RequestMapping("")
@SessionAttributes({"conflitos", "patrimoniosAInserir"})
public class BuscaController {

	@PersistenceContext(unitName = "mc437PersistenceUnit")
	private EntityManager entityManager;
	
	@ModelAttribute("conflitos")
	private List<Conflito> initConflitos() {
		return new ArrayList<Conflito>();
	}
	
	@ModelAttribute("patrimoniosAInserir")
	private List<Patrimonio> initPatrimoniosAInserir() {
		return new ArrayList<Patrimonio>();
	}

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
	public ModelAndView detalhesPatrimonios(ModelMap model,
			@RequestParam String bem) {

		Patrimonio p = entityManager.find(Patrimonio.class, bem);
		Query hist = entityManager
				.createQuery("SELECT ap FROM AlteracaoPatrimonio ap WHERE ap.patrimonio.chapinha = :chapinha AND ap.status != :status");
		hist.setParameter("chapinha", bem);
		hist.setParameter("status", StatusAlteracaoPatrimonio.PENDENTE);

		ModelAndView mav = new ModelAndView("detalhes.jsp");
		mav.addObject("pventry", p);
		mav.addObject("hist", hist.getResultList());

		return mav;
	}
	
	@RequestMapping(value = { "/home", "" }, method = RequestMethod.GET)
	@Transactional
	public String home(ModelMap model) {
		return "home.jsp";
	}
	
	@RequestMapping(value = "/requisicao", method = RequestMethod.GET)
	@Transactional
	public ModelAndView requisicao() {
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
	
	@RequestMapping(value = "/admin/upload", method = RequestMethod.GET)
	@Transactional
	public ModelAndView upload(ModelMap model) {
		ModelAndView mav = new ModelAndView("upload.jsp");

		return mav;
	}

	@RequestMapping(value = "/admin/listaAlteracoes", method = RequestMethod.GET)
	@Transactional
	public ModelAndView listaAlteracoes() {
		ModelAndView mav = new ModelAndView("lista_alteracoes.jsp");

		Query query = entityManager
				.createQuery("SELECT ap FROM AlteracaoPatrimonio ap JOIN FETCH ap.patrimonio WHERE ap.status = :status");
		query.setParameter("status", StatusAlteracaoPatrimonio.PENDENTE);

		mav.addObject("lista", query.getResultList());

		return mav;
	}
	
	@RequestMapping(value = "/admin/uploadArquivo", method = RequestMethod.POST)
	@Transactional
	public ModelAndView processUpload(@RequestParam MultipartFile file,
			WebRequest webRequest, Model model, 
			@ModelAttribute("conflitos") List<Conflito> conflitos,
			@ModelAttribute("patrimoniosAInserir") List<Patrimonio> patrimoniosAInserir) {

		boolean updated = false;
		
		conflitos.clear();
		patrimoniosAInserir.clear();
		
		try {
			InputStream filecontent = file.getInputStream();
			if (!filecontent.markSupported()) {
				filecontent = new PushbackInputStream(filecontent);
			}

			ExcelXLSX excelXLSX = new ExcelXLSX();
			excelXLSX.lerPlanilha(filecontent);

			List<String> chapinhas = new ArrayList<String>();
			for (Patrimonio p : excelXLSX.getLista()) {
				chapinhas.add(p.getChapinha());
			}

			Query query = entityManager
					.createQuery("SELECT p FROM Patrimonio p WHERE p.chapinha IN :chapinhas");
			query.setParameter("chapinhas", chapinhas);

			@SuppressWarnings("unchecked")
			List<Patrimonio> patrimonios = query.getResultList();

			for (Patrimonio patrimonioXLS : excelXLSX.getLista()) {
				for (Patrimonio patrimonioBD : patrimonios) {
					if (patrimonioXLS.getChapinha().equals(
							patrimonioBD.getChapinha())) {

						if (patrimonioXLS.conflita(patrimonioBD)) {
							Conflito c = new Conflito(patrimonioBD, patrimonioXLS);
							conflitos.add(c);
						}
						break;
					}
				}
			}

			boolean deveInserir = conflitos.size() < 1;
			
			for (Patrimonio patrimonioXLS : excelXLSX.getLista()) {
				if (deveInserir) {
					entityManager.merge(patrimonioXLS);
				} else {
					boolean temConflito = false;
					for (Conflito conflito : conflitos) {
						if (conflito.getPatrimonioNovo().getChapinha().equals(patrimonioXLS.getChapinha())) {
							temConflito = true;
							break;
						}
					}
					if (! temConflito) {
						patrimoniosAInserir.add(patrimonioXLS);
					}
				}
			}

			entityManager.flush();
			

			updated = true;
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        if (conflitos.size() < 1) {
        	ModelMap modelMap = new ModelMap();
        	modelMap.addAttribute("updated", updated);
        	return new ModelAndView("upload.jsp", modelMap);
        } else {
        	ModelAndView mav = new ModelAndView("conflito.jsp");
    		mav.addObject("lista", conflitos);
        	return mav;
        }
	}

	@RequestMapping(value = "/executaAlteracao", method = RequestMethod.POST)
	@Transactional
	public ModelAndView inserirPedidoDeAlteracao(
			@RequestParam("j_pi") String pi,
			@RequestParam("j_imovel") String imovel,
			@RequestParam("j_andar") String andar,
			@RequestParam("j_complemento") String complemento,
			WebRequest webRequest, Model model) {
		//ModelMap modelMap = new ModelMap();
		boolean updated = true;

		AlteracaoPatrimonio ap = new AlteracaoPatrimonio();
		LocalizacaoBem novoLocal = new LocalizacaoBem();
		novoLocal.setAndar(andar);
		novoLocal.setComplemento(complemento);
		novoLocal.setImovel(imovel);
		ap.setLocalizacaoNova(novoLocal);
		try
		{
			Patrimonio p = entityManager.find(Patrimonio.class, pi);
			if (p == null) {
				throw new NoResultException();
			}
			ap.setPatrimonio(p);
			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			String name = auth.getName();
			ap.setUsuarioCriacao(name);
			entityManager.merge(ap);
			entityManager.flush();
		}
		catch (NoResultException nrex)
		{
			nrex.printStackTrace();
			updated = false;
			nrex.printStackTrace();
		}
		ModelAndView modelView = requisicao();
		//modelMap.addAttribute("updated", updated);
		modelView.addObject("updated", updated);
		return modelView;
	}
	
	@RequestMapping(value = "/admin/processarAlteracoes", method = RequestMethod.POST)
	@Transactional
	public ModelAndView processarAlteracoes(WebRequest webRequest, Model model) {
		Map<String, String[]> params = webRequest.getParameterMap();

		for (Map.Entry<String, String[]> entry : params.entrySet()) {
			String key = entry.getKey();

			if (key.startsWith("alteracao_")) {

				String[] value = entry.getValue();

				if (value.length > 0) {
					StatusAlteracaoPatrimonio status = StatusAlteracaoPatrimonio
							.valueOf(value[0]);

					if (!StatusAlteracaoPatrimonio.APROVADA.equals(status)
							&& !StatusAlteracaoPatrimonio.RECUSADA
									.equals(status)) {
						continue;
					}

					Integer id = Integer.parseInt(key.replaceFirst(
							"alteracao_", ""));
					AlteracaoPatrimonio ap = entityManager.find(
							AlteracaoPatrimonio.class, id);

					if (!StatusAlteracaoPatrimonio.PENDENTE.equals(ap
							.getStatus())) {
						continue;
					}

					Patrimonio p = ap.getPatrimonio();

					ap.setStatus(status);
					ap.setDataRevisao(new Date());
					ap.setLocalizacaoAntiga(new LocalizacaoBem(p
							.getLocalizacao()));

					Authentication auth = SecurityContextHolder.getContext()
							.getAuthentication();
					String name = auth.getName();
					ap.setUsuarioRevisao(name);

					if (status.equals(StatusAlteracaoPatrimonio.APROVADA)) {
						p.setLocalizacao(ap.getLocalizacaoNova());
						entityManager.merge(p);
					}

					entityManager.merge(ap);
				}

				entityManager.flush();
			}
		}

		ModelAndView modelView = listaAlteracoes();
		modelView.addObject("updated", Boolean.TRUE);
		return modelView;
	}
}