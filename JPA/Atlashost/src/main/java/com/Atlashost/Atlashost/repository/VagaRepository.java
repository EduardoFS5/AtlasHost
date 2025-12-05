package com.Atlashost.Atlashost.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import com.Atlashost.Atlashost.models.Vaga;


public interface VagaRepository extends crudRepository<Vaga, String>{
  Vaga findByCodigo(long codigo);
  List <Vaga> findBynNome(String nome);
}
