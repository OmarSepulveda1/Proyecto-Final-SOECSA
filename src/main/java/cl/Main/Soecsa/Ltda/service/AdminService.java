package cl.Main.Soecsa.Ltda.service;

import cl.Main.Soecsa.Ltda.entity.Admin;
import cl.Main.Soecsa.Ltda.repository.IAdminRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {

	public AdminService() {
		super();
	}

	@Autowired
	private IAdminRepository adminRepo;
	
	public Admin getAdmin(Long id) {
		return adminRepo.findById(id).get();
	}

	public void createAdmin(Admin admin) {
		adminRepo.save(admin);
	}

	public void update(Admin admin) {
		adminRepo.save(admin);
	}

	
}
