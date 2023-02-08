package org.usefullibs.greeter.impl;

import org.junit.Assert;
import org.junit.Test;
import org.usefullibs.greeter.Greeter;

public class HelloWorldTest {

    @Test
    public void testGreet(){
        Greeter greeter = new HelloWorld();

        String actual = greeter.greet();
        String expected = "Hello World!";

        Assert.assertEquals(expected,actual);
    }
}
