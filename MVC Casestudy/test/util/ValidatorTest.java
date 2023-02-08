package util;

import org.junit.Assert;
import org.junit.Test;

public class ValidatorTest {
    Validator validator = new Validator();
    @Test
    public void testPhoneValidator(){
        Assert.assertTrue(validator.isValidPhone("090 1234 321"));
    }

    @Test
    public void testPhoneValidator2(){
        Assert.assertTrue(validator.isValidPhone("8491 1234 321"));
    }

    @Test
    public void testPhoneValidator3(){
        Assert.assertFalse(validator.isValidPhone("0901234321"));
    }

    @Test
    public void testIdCardValidator(){
        Assert.assertTrue(validator.isValidIdCard("123123123121"));
    }
}
