package simplecalc;



import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import simplecalc.impl.Calculator;

public class CalculatorTest {

    @Test
    public void testCalculatePlus(){
        ICalculator calculator = new Calculator();
        int expected = 6;
        int actual = calculator.plus(2,6);
        Assertions.assertNotEquals(expected,actual);
    }

    @Test
    public void testCalculateMinus(){
        ICalculator calculator = new Calculator();
        int expected = 6;
        int actual = calculator.subtract(8,2);
        Assertions.assertEquals(expected,actual);
    }

    @Test
    public void testCalculateMultiple1(){
        ICalculator calculator = new Calculator();
        int expected = 16;
        int actual = calculator.multiply(8,2);
        Assertions.assertEquals(expected,actual);
    }

    @Test
    public void testCalculateMultiple2(){
        ICalculator calculator = new Calculator();
        int expected = 16;
        int actual = calculator.multiply(2,2);
        Assertions.assertEquals(expected,actual);
    }
}
