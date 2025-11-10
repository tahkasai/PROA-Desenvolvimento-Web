package br.com.fiap.produtos;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);

        System.out.println("Digite um valor de 5, 8, 9 e 14 para escolher o exercício:");
        int opt = scan.nextInt();

        switch (opt) {
            case 5:
                exercicio5(scan);
                break;
            case 8:
                exercicio8(scan);
                break;
            case 9:
                exercicio9(scan);
                break;
            case 14:
                exercicio14(scan);
            default:
                System.out.println("Valor incorreto");
                break;
        }
        scan.close();
    }
    // EXERCÍCIO 5
    public static void exercicio5(Scanner scan) {
        System.out.print("Digite um valor: ");
        double num = scan.nextDouble();

        if (num > 0) {
            System.out.println(num + " é Positivo");
        } else if (num == 0) {
            System.out.println(num + " é Neutro");
        } else {
            System.out.println(num + " é Negativo");
        }
    }
    // EXERCÍCIO 8
    public static void exercicio8(Scanner scan) {
        System.out.print("Digite o 1° valor: ");
        double num1 = scan.nextDouble();
        double num2;

        do {
            System.out.print("Digite o 2° valor (diferente de zero): ");
            num2 = scan.nextDouble();
            if (num2 == 0) {
                System.out.println("Valor inválido! O divisor não pode ser zero.");
            }
        } while (num2 == 0);

        double resultado = num1 / num2;
        System.out.printf("Resultado: %.2f%n", resultado);
    }
    // EXERCÍCIO 9
    public static void exercicio9(Scanner scan) {
        double[] vetor = new double[10];
        double somaAritmetica = 0;

        System.out.println("Digite 10 valores:");

        for (int i = 0; i < 10; i++) {
            System.out.print("Valor " + (i + 1) + ": ");
            vetor[i] = scan.nextDouble();
            somaAritmetica += vetor[i];
        }

        System.out.print("Os valores informados são: ");
        for (int i = 0; i < vetor.length; i++) {
            if (i == vetor.length - 1) {
                System.out.print(vetor[i] + ".");
            } else {
                System.out.print(vetor[i] + ", ");
            }
        }
        somaAritmetica /= 10;
        System.out.println("\nA soma aritmética é: " + somaAritmetica);
    }
    // EXERCÍCIO 14
    public static void exercicio14(Scanner scan){
        double soma = 0;
        double[] vetor = new double[6];

        for (int i=0;i<vetor.length;i++){
            double num = scan.nextDouble();
            vetor[i]=num;
            soma +=num;
        }
        soma/=6;
        System.out.println("O aluno tirou: "+soma+", ele esta "+(soma<6.5?"Reprovado":"Aprovado"));
    }
}
