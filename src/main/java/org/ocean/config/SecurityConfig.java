package org.ocean.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;


@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
 
	
//	PasswordEncoder encoder =
//    PasswordEncoderFactories.createDelegatingPasswordEncoder();
//	
//	@Override
// 	public void configure(WebSecurity web) throws Exception {
// 		web.ignoring()
// 		// Spring Security should completely ignore URLs starting with /resources/
// 				.antMatchers("/css/**","/js/**","/images/**");
// 	}
//
// 	@Override
// 	protected void configure(HttpSecurity http) throws Exception {
// 		http.authorizeRequests().antMatchers("/**").hasRole("USER").and()
// 				// Possibly more configuration ...
// 				.formLogin() // enable form based log in
// 				// set permitAll for all URLs associated with Form Login
// 				.permitAll();
// 		http.csrf().disable();
// 	}
//
// 	@Override
// 	protected void configure(AuthenticationManagerBuilder auth) throws Exception{
// 		auth.inMemoryAuthentication().withUser("ssh").password(encoder.encode("123")).roles("USER") ;
// 	}

	
	@Autowired
	private DataSource dataSource;
	
	@Bean
	public PasswordEncoder passwordEncoder()
	{
		return new BCryptPasswordEncoder();
	}     
	
	@Override 
	public void configure(WebSecurity web) throws Exception
	{
		web.ignoring().antMatchers("/css/**","/js/**","/images/**");
	}
	
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception
	{
		auth.
			jdbcAuthentication()
			.usersByUsernameQuery("SELECT email,password,active FROM USER WHERE email = ?")
			.authoritiesByUsernameQuery("SELECT email,role FROM USER WHERE email = ?")
			.dataSource(dataSource)
			.passwordEncoder(passwordEncoder());
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception{
	
		
		http.
		authorizeRequests().
			
			antMatchers("/admin/**").hasAuthority("admin").
			antMatchers("/user/**").hasAnyAuthority("admin","user").
			antMatchers("/login").permitAll().
			anyRequest().authenticated().
			and().
			formLogin().loginPage("/login").
			loginProcessingUrl("/login").
			defaultSuccessUrl("/home",true).
			failureUrl("/login?success=false").
			usernameParameter("email").
			passwordParameter("password").
			and().logout().logoutSuccessUrl("/login?logout=success").
			and().
			exceptionHandling().accessDeniedPage("/403-UnauthorizedAccess")
			;
	}
 	
	
	

//	@Override
//	public void configure(AuthenticationManagerBuilder auth) throws Exception
//	{
//		auth.inMemoryAuthentication().withUser("Sheriff").password(passEncoder().encode("123"));
//	}
//	
	
}