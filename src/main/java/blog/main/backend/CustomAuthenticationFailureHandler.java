package blog.main.backend;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		String errorMessage;
		if (exception instanceof BadCredentialsException) {
			errorMessage = "Invalid username or password.";
		} else if (exception.getMessage() != null && exception.getMessage().contains("disabled")) {
			errorMessage = "Your account has been banned.";
		} else {
			errorMessage = "Authentication failed for an unknown reason.";
		}

		request.getSession().setAttribute("errorMessage", errorMessage);
		response.sendRedirect("loginPage");
	}
}
