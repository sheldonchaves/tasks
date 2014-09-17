package br.com.fusion7.tasks.controller;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.fusion7.tasks.dao.JdbcTarefaDao;
import br.com.fusion7.tasks.modelo.Tarefa;

@Controller
public class TarefasController {
	
	@Autowired
	private JdbcTarefaDao dao;
	
	@RequestMapping("tarefas/nova")
	public String nova() {
		return "tarefa/form";
	}
	
	@RequestMapping("tarefas/adiciona")
	public String adiciona(@Valid Tarefa tarefa, BindingResult result) {
		
		if (result.hasFieldErrors("descricao")) {
			return "tarefa/formulario";
		}
		
		dao.adiciona(tarefa);
		return "tarefa/adicionada";
	}
	
	@RequestMapping("tarefas/lista")
	public String lista(Model model) {
		model.addAttribute("tarefas", dao.lista());
		return "tarefa/lista";
	}
	
	@RequestMapping("tarefas/remove")
	public String remove(Long id) {
		dao.remove(id);
		return "redirect:/tarefas/lista";
	}
	
	@RequestMapping("tarefas/edita")
	public String edita(Long id, Model model) {
		model.addAttribute("tarefa", dao.buscaPorId(id));
		return "tarefa/edita";
	}
	
	@RequestMapping("tarefas/altera")
	public String altera(@Valid Tarefa tarefa) {
		dao.altera(tarefa);
		return "redirect:/tarefas/lista";
	}
	
	@RequestMapping("tarefas/finaliza")
	public void finaliza(Long id, HttpServletResponse res) {
		dao.finaliza(id);
		//return "redirect:/tarefas/lista";
		System.out.println("*** finaliza ***");
		res.setStatus(200);
	}
}
