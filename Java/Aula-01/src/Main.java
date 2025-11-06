import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        // Saída: Quando queremos exibir ao utilizador uma mensagem na tela
        System.out.printf("Hello and welcome!");

        // Tipos de print
        System.out.print("Exemplo de print simples sem quebra de linha.");
        System.out.printf("\nExemplo de print com quebra de linha.");
        System.out.println("Exemplo de println que adiciona uma quebra de linha automaticamente.");

        // Criação de uma variável do tipo inteiro chamada "idade" e atribuição do valor 25 a ela
        int idade = 25;
        System.out.printf("\nIdade: %d anos", idade);

        // Criação de uma variável do tipo String chamada "nome" e atribuição do valor "João" a ela
        String nome = "João";

        System.out.printf("\nNome: %s", nome);

        // Criação de uma variável do tipo double chamada "altura" e atribuição do valor 1.75 a ela
        double altura = 1.75;
        System.out.printf("\nAltura: %.2f metros", altura);

        // Tipos Primitivos em Java são:
        // int, double, float, char, boolean, byte, short, long
        // Tipos de primitivos são usados para armazenar valores simples e diretos.
        // Exemplo de uso de boolean
        boolean estudante = true;
        System.out.printf("\nEstudante: %b", estudante);

        //Tipos não primitivos em Java são:
        // String, Arrays, Classes, Interfaces
        // Tipos não primitivos são usados para armazenar objetos e estruturas de dados mais complexos
        String curso = "Ciência da Computação";
        System.out.printf("\nCurso: %s", curso);


        // Entrada de dados:
        Scanner scanner = new Scanner(System.in);
        System.out.print("\nDigite sua cidade: ");

        String cidade = scanner.nextLine();
        System.out.printf("Cidade: %s", cidade);
        scanner.close();


    }
}