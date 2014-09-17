package br.com.fusion7.tasks.jpa;

import java.util.Calendar;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import br.com.fusion7.tasks.modelo.Tarefa;

public class AdicionaTarefa {
	public static void main(String[] args) {
		Tarefa tarefa = new Tarefa();
		tarefa.setDescricao("Estudar " + Math.round(Math.random() * 999999999));
		
		Long finalizadoN = Math.round(Math.random() * 9) % 2;
		Boolean finalizado = finalizadoN==0? true: false;
		tarefa.setFinalizado(finalizado);
		tarefa.setDataFinalizacao(Calendar.getInstance());
		
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("tarefas");
		EntityManager manager = factory.createEntityManager();
		
		manager.getTransaction().begin();
		manager.persist(tarefa);
		manager.getTransaction().commit();
		
		System.out.println("Id da tarefa criada: " + tarefa.getId()+ " | " + tarefa.isFinalizado());
		
		manager.close();
	}
}
