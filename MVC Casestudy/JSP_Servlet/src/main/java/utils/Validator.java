package utils;

import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validator {
    //Số điện thoại phải đúng định dạng 090xxxxxxx hoặc 091xxxxxxx hoặc (84)+90xxxxxxx hoặc (84)+91xxxxxxx
    private final String PHONE_REGEX = "^(0|84)9[01] \\d{4} \\d{3}$";

    //Số CMND phải đúng định dạng XXXXXXXXX hoặc XXXXXXXXXXXX (X là số 0-9)
    private final String ID_CARD_REGEX = "\\d{12}|\\d{9}";

    private final String MAIL_REGEX = "^([a-z0-9]+(?:[._-][a-z0-9]+)*)@([a-z0-9]+(?:[.-][a-z0-9]+)*\\.[a-z]{2,})$";

    public boolean isValidPhone(String phone) {

        return phone.matches(PHONE_REGEX);
    }

    public boolean isValidIdCard(String idCard) {

        return idCard.matches(ID_CARD_REGEX);
    }

    public boolean isValidEmail(String email) {

        return email.matches(MAIL_REGEX);
    }

    public boolean isPositiveInteger(String number) {
        try {
            int num = Integer.parseInt(number);

            return num >= 0;
        } catch (NumberFormatException exception) {
            System.out.println(exception.getMessage());
            return false;
        }
    }

    public boolean isValidPrice(String price) {
        try {
            int num = Integer.parseInt(price);

            return num > 10000000;
        } catch (NumberFormatException exception) {
            System.out.println(exception.getMessage());
            return false;
        }
    }

    public String getUsernameFromEmail(String email) {

        Matcher matcher = Pattern.compile(MAIL_REGEX).matcher(email);

        if (matcher.find())
            return matcher.group(1);
        else return "none";
    }

    public boolean isValidBirthday(Date birthday) {

        return birthday.before(new Date());
    }
}
