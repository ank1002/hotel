package validate;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validator 
{
    public static boolean validateUsername(String username)
    {
        if((username.length()>=4))
            return true;
        else
            return false;
    }
    public static boolean validateEmail(String email)
    {
//          Pattern p=Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$");
//          Matcher m=p.matcher(email);
//          
//          if(m.find())
            return true;
//          else
//            return false;
    }
    public static boolean validatePassword(String password)
    {
        Pattern p=Pattern.compile("(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@#$&*-_]).{6,16}");
        Matcher m=p.matcher(password);
        
        if(m.find())
            return true;
        else
            return false;
    }
}
