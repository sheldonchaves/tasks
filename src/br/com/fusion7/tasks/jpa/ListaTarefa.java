package br.com.fusion7.tasks.jpa;

import java.util.List;

import javax.persistence.Query;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import br.com.fusion7.tasks.modelo.Tarefa;

public class ListaTarefa {
	public static void main(String[] args) {
		EntityManagerFactory factory = Persistence
				.createEntityManagerFactory("tarefas");
		EntityManager manager = factory.createEntityManager();

		Query query = manager.createQuery(
				"select t from Tarefa as t where t.finalizado = :paramFinalizado");
		
		query.setParameter("paramFinalizado", true);
		
		List<Tarefa> lista = query.getResultList();

		for (Tarefa tarefa:lista) {
			System.out.println(">> " + tarefa.getDescricao());
		}
		
		manager.close();
		
	}
}
