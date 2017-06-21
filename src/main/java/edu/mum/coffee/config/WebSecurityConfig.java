package edu.mum.coffee.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	/*// Authentication : User --> Roles
			protected void configure(AuthenticationManagerBuilder auth)
					throws Exception {
				auth.inMemoryAuthentication().withUser("Destalem").password("12345")
						.roles("USER").and().withUser("admin").password("54321")
						.roles("USER", "ADMIN");
			}

			// Authorization : Role -> Access
			protected void configure(HttpSecurity http) throws Exception {
				http.httpBasic().and().authorizeRequests()
				.antMatchers("/login").anonymous()
				.antMatchers("/matchs")
						.hasRole("USER")
				.antMatchers("/maths/**")
				.hasRole("ADMIN").and()
						.csrf().disable().headers().frameOptions().disable().and()
			            .formLogin()
			            .and()
			                .logout()
			                .logoutSuccessUrl("/");;
			}*/
	
	
	@Override
    protected void configure(HttpSecurity http) throws Exception {
        http
           .authorizeRequests()
               .antMatchers("/product", "/login").permitAll()
               .anyRequest().authenticated()
               .and()
				.csrf().disable().headers().frameOptions().disable().and().
                formLogin()
           	     .permitAll()
            	.and()
                 .logout()
            	.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
            	.logoutSuccessUrl("/");
    }

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.inMemoryAuthentication().withUser("gk@gmail.com").password("12345").roles("USER")
		.and().withUser("Admin").password("pw").roles("ADMIN");
	}
}