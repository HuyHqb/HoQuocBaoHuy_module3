package simplecalc.impl;

import simplecalc.ICalculator;


public class Calculator implements ICalculator {
    @Override
    public int plus(int arg1, int arg2) {
        return arg1 + arg2;
    }

    @Override
    public int subtract(int arg1, int arg2) {
        return arg1 - arg2;
    }

    @Override
    public int multiply(int arg1, int arg2) {
        return arg1 * arg2;
    }

    @Override
    public double divide(int arg1, int arg2) {
        return (double) arg1/ (double) arg2;
    }
}
