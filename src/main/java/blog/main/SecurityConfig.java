package blog.main;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.security.web.firewall.HttpFirewall;

import blog.main.backend.CustomAuthenticationFailureHandler;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private DataSource myDataSource;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {

		auth.jdbcAuthentication().dataSource(myDataSource);

	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http.authorizeRequests()
				.antMatchers("/administration/category-list", "/administration/category-form",
						"/administration/comment-list", "/administration/slide-form", "/administration/slide-list",
						"/administration/slide-update", "/administration/tag-list", "/administration/tag-form",
						"/administration/user-list")
				.hasRole("admin").antMatchers("/**").permitAll().antMatchers("/administration/**")
				.hasAnyRole("admin", "user").anyRequest().authenticated().and().formLogin().loginPage("/loginPage")
				.defaultSuccessUrl("/administration/post-list").failureHandler(authenticationFailureHandler())
				.loginProcessingUrl("/authenticateTheUser").permitAll();

	}

	@Bean
	public AuthenticationFailureHandler authenticationFailureHandler() {
		return new CustomAuthenticationFailureHandler();
	}

}
