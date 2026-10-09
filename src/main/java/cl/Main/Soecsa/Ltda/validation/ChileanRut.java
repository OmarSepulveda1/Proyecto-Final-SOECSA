package cl.Main.Soecsa.Ltda.validation;

import java.util.Locale;
import java.util.regex.Pattern;

public final class ChileanRut {

    private static final Pattern RUT_PATTERN = Pattern.compile("^[0-9]{1,8}-?[0-9kK]$");

    private ChileanRut() {
    }

    public static String normalize(String rut) {
        if (rut == null) {
            return null;
        }
        String compact = rut.trim().replace(".", "").toUpperCase(Locale.ROOT);
        if (!RUT_PATTERN.matcher(compact).matches()) {
            return null;
        }

        String digits = compact.replace("-", "");
        String body = digits.substring(0, digits.length() - 1);
        char checkDigit = digits.charAt(digits.length() - 1);
        if (calculateCheckDigit(body) != checkDigit) {
            return null;
        }
        return body + "-" + checkDigit;
    }

    private static char calculateCheckDigit(String body) {
        int sum = 0;
        int factor = 2;
        for (int index = body.length() - 1; index >= 0; index--) {
            sum += Character.digit(body.charAt(index), 10) * factor;
            factor = factor == 7 ? 2 : factor + 1;
        }
        int remainder = 11 - sum % 11;
        if (remainder == 11) {
            return '0';
        }
        if (remainder == 10) {
            return 'K';
        }
        return Character.forDigit(remainder, 10);
    }
}
