package blog.main.backend;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;

import blog.main.entity.User;

@Component
public class ChangePasswordValidator {

	public void validate(Object target, Errors errors, User user, BCryptPasswordEncoder encoder) {
		ChangePassword changePassword = (ChangePassword) target;

		if (!changePassword.getNewPassword().equals(changePassword.getConfirmPassword())) {
			errors.rejectValue("confirmPassword", "password.mismatch", "New password and Confirm password must match.");
		}

		if (!encoder.matches(changePassword.getOldPassword(), user.getPassword().replace("{bcrypt}", ""))) {
			errors.rejectValue("oldPassword", "password.mismatch", "Old password does not match.");

		}
	}
}