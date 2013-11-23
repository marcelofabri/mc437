package br.unicamp.mc437;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.DependsOn;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import br.unicamp.mc437.model.StatusAlteracaoPatrimonio;

@DependsOn("entityManager")
public class InterceptorController implements HandlerInterceptor {

	@PersistenceContext(unitName = "mc437PersistenceUnit")
	private EntityManager entityManager;

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		Authentication authentication = SecurityContextHolder.getContext()
				.getAuthentication();
		
		for (GrantedAuthority auth : authentication.getAuthorities()) {
            if ("ROLE_ADMIN".equals(auth.getAuthority())) {
            	
            	Query query = entityManager
        				.createQuery("SELECT COUNT(ap) FROM AlteracaoPatrimonio ap WHERE ap.status = :status");
        		query.setParameter("status", StatusAlteracaoPatrimonio.PENDENTE);

        		modelAndView.addObject("pendentes", query.getSingleResult());
        		
                break;
            }
        }
	}

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

	}

	@Override
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2) throws Exception {
		return true;
	}

}