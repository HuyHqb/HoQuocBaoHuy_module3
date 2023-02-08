package org.uesfullibs.greeter.impl;

import org.uesfullibs.greeter.Greeter;

public class HelloWorld implements Greeter {
    @Override
    public String greet() {
        return "Hello World!";
    }
}
