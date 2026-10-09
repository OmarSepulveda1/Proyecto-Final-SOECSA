package cl.Main.Soecsa.Ltda.service;

import cl.Main.Soecsa.Ltda.entity.Admin;
import cl.Main.Soecsa.Ltda.entity.UserRol;
import cl.Main.Soecsa.Ltda.repository.IAdminRepository;
import cl.Main.Soecsa.Ltda.repository.IUserRepository;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class AdminService {

	private final IAdminRepository adminRepo;
	private final IUserRepository userRepo;
	private final PasswordEncoder passwordEncoder;

	public AdminService(IAdminRepository adminRepo, IUserRepository userRepo, PasswordEncoder passwordEncoder) {
		this.adminRepo = adminRepo;
		this.userRepo = userRepo;
		this.passwordEncoder = passwordEncoder;
	}

	public Admin getAdmin(Long id) {
		return adminRepo.findById(id).orElse(null);
	}

	public Admin createAdmin(String name, String lastName, String userName, String email, String password) {
		String normalizedUserName = userName.trim();
		String normalizedEmail = email.trim();
		if ("admin".equalsIgnoreCase(normalizedUserName)
				|| userRepo.existsByUserNameIgnoreCase(normalizedUserName)) {
			throw new IllegalArgumentException("Ese nombre de usuario ya está registrado.");
		}
		if (userRepo.existsByEmailIgnoreCase(normalizedEmail)) {
			throw new IllegalArgumentException("Ese correo electrónico ya está registrado.");
		}

		Admin admin = new Admin();
		admin.setName(name.trim());
		admin.setLastName(lastName.trim());
		admin.setUserName(normalizedUserName);
		admin.setEmail(normalizedEmail);
		admin.setPassword(passwordEncoder.encode(password));
		admin.setUserRol(UserRol.Admin);
		return adminRepo.save(admin);
	}
}
