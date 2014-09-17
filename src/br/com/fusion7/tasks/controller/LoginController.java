package br.com.fusion7.tasks.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.fusion7.tasks.dao.JdbcUsuarioDao;
import br.com.fusion7.tasks.modelo.Usuario;

@Controller
public class LoginController {
	
	@RequestMapping("loginForm")
	public String loginForm() {
		return "formulario-login";
	}
	
	@RequestMapping("efetuaLogin")
	public String efetuaLogin(Usuario user, HttpSession session) {
		if (new JdbcUsuarioDao().existeUsuario(user)){
			session.setAttribute("usuarioLogado", user);
			return "home";
		}
		return "redirect:loginForm";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/loginForm";
	}
}
