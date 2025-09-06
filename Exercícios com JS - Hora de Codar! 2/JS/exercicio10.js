// Tendo como entrada a altura e o gênero designado ao nascer (codificado da seguinte forma: 1: feminino - 2: masculino - ) de uma pessoa, construa um programa que calcule e imprima seu peso ideal, utilizando as seguintes fórmulas.

var altura = parseFloat(prompt("Informe sua altura"));
var genero = parseInt(prompt("Informe seu Gênero\n[1] Feminino\n[2] Masculino"));
alert(genero==1?feminino():masculino());

function feminino(){
    return (62.1 * altura) - 44.7;
}

function masculino(){
    return (72.7 * altura) - 58;
}