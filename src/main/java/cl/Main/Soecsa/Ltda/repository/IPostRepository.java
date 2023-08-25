package cl.Main.Soecsa.Ltda.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import cl.Main.Soecsa.Ltda.entity.Post;

public interface IPostRepository extends JpaRepository<Post,Long>{

}
