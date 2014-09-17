package br.com.fusion7.tasks.jpa;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import br.com.fusion7.tasks.modelo.Tarefa;

public class RemoveTarefa {
	public static void main(String[] args) {
		EntityManagerFactory factory = Persistence
				.createEntityManagerFactory("tarefas");
		EntityManager manager = factory.createEntityManager();

		Tarefa encontrada = manager.find(Tarefa.class, 3L);
		
		manager.getTransaction().begin();
		manager.remove(encontrada);
		manager.getTransaction().commit();

		manager.close();

	}
}
