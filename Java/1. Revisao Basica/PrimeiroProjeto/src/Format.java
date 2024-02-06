public class Format {
    public static void main(String[] args) {
        String nome = "Gustavo";
        int idade = 20;
        double valor = 37.75;
        // O intellij informou que escrever o String.format é redundante
        System.out.printf("Meu nome é %s, tenho %d anos e hoje gastei R$%.2f.%n", nome, idade, valor);

        int quantidadeAulas = 10;
        String mensagem = """
                Olá %s!
                Boas vindas ao curso de Java!
                Teremos %d aulas!
                """.formatted(nome, quantidadeAulas);
        System.out.println(mensagem);
    }
}
