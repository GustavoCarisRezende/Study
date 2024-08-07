package Desafios;

public class ConversorTemperatura {
    public static void main(String[] args) {
        double temperaturaCelsius = 35;
        double temperaturaFahrenheit = (temperaturaCelsius * 1.8) + 32;
        System.out.printf("A temperatura em Fahrenheit é %.2f ºF.%n", temperaturaFahrenheit);
    }
}
