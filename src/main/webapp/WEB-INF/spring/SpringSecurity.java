package cl.Main.Soecsa.Ltda.modelos.security;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests().antMatchers("/admin/**").hasRole("ADMIN") // Definir reglas de autorización
				.antMatchers("/estudiantes/borrar/**").hasRole("ADMIN").antMatchers("/estudiantes/editar/**")
				.hasRole("ADMIN").antMatchers("/estudiantes/crear").hasRole("ADMIN").antMatchers("/post/**")
				.hasRole("ADMIN").anyRequest().authenticated() // Todas las demás solicitudes requieren autenticación
				.and().formLogin() // Configurar la página de inicio de sesión
				.and().logout() // Configurar el logout
				.permitAll(); // Permitir acceso al logout a todos
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.inMemoryAuthentication().withUser("admin").password("{noop}password").roles("ADMIN");
	}

}
