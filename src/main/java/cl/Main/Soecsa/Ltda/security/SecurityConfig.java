package cl.Main.Soecsa.Ltda.security;

import java.util.UUID;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    private static final Logger LOGGER = Logger.getLogger(SecurityConfig.class.getName());

    @Value("${SOECSA_ADMIN_PASSWORD:}")
    private String adminPassword;

    @Autowired
    private UserDetailsService adminDetailsService;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/", "/goHome", "/goRegistration", "/goGallery", "/goNews", "/goLogin",
                        "/login", "/error", "/res/**", "/webjars/**", "/estudiantes/registro",
                        "/post/noticias", "/post/noticia/**")
                .permitAll()
                .antMatchers("/admin/**", "/estudiantes/**", "/post/**")
                .hasRole("ADMIN")
                .anyRequest().authenticated()
                .and()
                .formLogin()
                .loginPage("/goLogin")
                .loginProcessingUrl("/login")
                .usernameParameter("username")
                .passwordParameter("password")
                .failureUrl("/goLogin?error=true")
                .permitAll()
                .and()
                .logout()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/goLogin?logout=true")
                .invalidateHttpSession(true)
                .deleteCookies("JSESSIONID")
                .permitAll();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(adminDetailsService).passwordEncoder(passwordEncoder());

        boolean passwordConfigured = adminPassword != null && !adminPassword.trim().isEmpty();
        if (!passwordConfigured) {
            LOGGER.warning("SOECSA_ADMIN_PASSWORD is not set; administrator authentication is unavailable.");
        }

        auth.inMemoryAuthentication()
                .withUser("admin")
                .password(passwordEncoder().encode(passwordConfigured ? adminPassword : UUID.randomUUID().toString()))
                .roles("ADMIN");
    }
}
