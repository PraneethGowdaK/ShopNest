package other;

import com.shopNest.dbHandler.DataFetcher;
import com.shopNest.dbHandler.DataInjector;

/**
 * Handles password reset validation logic.
 * Checks that the email matches the account and that the two new passwords match.
 */
public class PassValidator {

    private PassValidator() {}

    /**
     * Validates the reset request and updates the password if everything checks out.
     * Returns a status message describing the outcome.
     */
    public static String password(String name, String mail, String newPass, String rePass) {

        if (name == null || name.isEmpty() || mail == null || mail.isEmpty()) {
            return "Please fill in all fields";
        }

        String storedMail = DataFetcher.mail(name);

        if (!storedMail.equals(mail)) {
            return "Mail id not matching";
        }

        if (!newPass.equals(rePass)) {
            return "Password not matching";
        }

        DataInjector.updatePassword(storedMail, rePass);
        return "password changed successfully";
    }
}
