package Desafios;

import java.util.Calendar;

public class Carro {
    String modelo;
    int ano;
    String cor;

    public void exiveFichaTecnica() {
        System.out.printf("""
                Modelo do veículo: %s
                Ano do veículo: %d
                Cor: %s""", modelo, calculaIdade(), cor);
    }

    public int calculaIdade(){
        Calendar calendar = Calendar.getInstance();
        return calendar.get(Calendar.YEAR) - ano;
    }
}
