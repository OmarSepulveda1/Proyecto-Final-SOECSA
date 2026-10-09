package cl.Main.Soecsa.Ltda.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import cl.Main.Soecsa.Ltda.entity.User;

public interface IUserRepository extends JpaRepository<User, Long> {

    boolean existsByUserNameIgnoreCase(String userName);

    boolean existsByEmailIgnoreCase(String email);
}
