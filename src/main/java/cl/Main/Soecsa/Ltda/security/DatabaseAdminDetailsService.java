package cl.Main.Soecsa.Ltda.security;

import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import cl.Main.Soecsa.Ltda.entity.Admin;
import cl.Main.Soecsa.Ltda.repository.IAdminRepository;

@Service
public class DatabaseAdminDetailsService implements UserDetailsService {

    private final IAdminRepository adminRepository;

    public DatabaseAdminDetailsService(IAdminRepository adminRepository) {
        this.adminRepository = adminRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Admin admin = adminRepository.findByUserNameIgnoreCase(username);
        if (admin == null) {
            throw new UsernameNotFoundException("No existe el administrador solicitado.");
        }
        return User.withUsername(admin.getUserName())
                .password(admin.getPassword())
                .roles("ADMIN")
                .build();
    }
}
