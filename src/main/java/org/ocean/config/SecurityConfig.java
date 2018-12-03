package org.ocean.config;

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

	@Bean
	public PasswordEncoder passEncoder()
	{
		return new BCryptPasswordEncoder();
	}     
	
	@Override 
	public void configure(WebSecurity web) throws Exception
	{
		web.ignoring().antMatchers("/css/**","/js/**","/images/**");
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception{
	
		
		http.
		authorizeRequests().
			
			antMatchers("/admin/**").hasRole("admin").
			antMatchers("/user/**").hasAnyRole("user","admin").
			antMatchers("/login").permitAll().
			antMatchers("/home").authenticated().
			and().
			formLogin().loginPage("/login").
			loginProcessingUrl("/login").
			defaultSuccessUrl("/home",true).
			failureUrl("/login?success=false").
			and().logout().logoutSuccessUrl("/login?logout=success");
			;
		
		http.csrf().disable();
	}
 	
	@Override
	public void configure(AuthenticationManagerBuilder auth) throws Exception
	{
		auth.inMemoryAuthentication().withUser("Principle").password(passEncoder().encode("123")).roles("admin").and()
		.withUser("Teacher").password(passEncoder().encode("456")).roles("user");
	}

//	@Override
//	public void configure(AuthenticationManagerBuilder auth) throws Exception
//	{
//		auth.inMemoryAuthentication().withUser("Sheriff").password(passEncoder().encode("123"));
//	}
//	
	
}