import java.util.Scanner;

public class DesafioFinal {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        // Customer Data \\
        System.out.print("""
                *************************
                DADOS INICIAIS DO CLIENTE
                Nome:\s"""
        );
        String customerName = scanner.nextLine();
        System.out.print("Tipo conta: ");
        String customerTipoConta = scanner.nextLine();
        System.out.print("Saldo Inicial: ");
        double customerBalance = scanner.nextDouble();
        System.out.println("*************************");

        // Main loop \\
        boolean continueInApp = true;
        while (continueInApp) {
            // Main menu \\
            System.out.print("""    
                    *************************
                    OPERAÇÕES:
                        [1] Consultar saldo
                        [2] Receber valor
                        [3] Transferir valor
                        [4] Sair
                    *************************
                    
                    Informe a opção desejada
                        ->\s""");
            int menuChoise = scanner.nextInt();
            switch (menuChoise) {
                // Consultar saldo \\
                case 1 -> System.out.printf("""
                        *************************
                        Nome: %s
                        Tipo conta: %s
                        Saldo: %.2f
                        *************************
                        """, customerName, customerTipoConta, customerBalance);

                // Receber valor \\
                case 2 -> {
                    System.out.print("\nInforme o valor para recebimento: R$ ");
                    double depositValue = scanner.nextDouble();
                    if (depositValue >= 0) {
                        customerBalance += depositValue;
                        System.out.printf("""
                                ******************************
                                Valor depositado: R$ %.2f
                                Saldo atual: R$ %.2f
                                ******************************
                                """, depositValue, customerBalance);
                    } else {
                        System.out.println("\nO valor a ser depositado não pode ser negativo! Depósito cancelado!\n");
                    }
                }
                // Transferir valor \\
                case 3 -> {
                    System.out.print("\nInforme o valor a ser transferido R$ ");
                    double transferValue = scanner.nextDouble();
                    if (transferValue > customerBalance) {
                        System.out.println("\nSaldo insuficiente! Transferência não realizada!\n");
                    } else {
                        customerBalance -= transferValue;
                        System.out.printf("""
                                ******************************
                                Valor transferido: R$ %.2f
                                Saldo atual: R$ %.2f
                                ******************************
                                """, transferValue, customerBalance);
                    }
                }
                // Sair \\
                case 4 -> {
                    System.out.println("""
                            ******************************
                                ENCERRANDO APLICAÇÃO
                              AGRADEÇEMOS A PREFERÊNCIA
                            ******************************
                            """);
                    continueInApp = false;
                }
                default -> System.out.println("\nA opção selecionada não existe! Verifique o valor informado!");
            }
        }
    }
}
