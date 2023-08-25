package cl.Main.Soecsa.Ltda.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import cl.Main.Soecsa.Ltda.entity.Admin;

public interface IAdminRepository extends JpaRepository<Admin, Long> {
}
