function adicao (x,y){
    return x+y;
}
function subtracao (x,y){
    return x-y;
}
function multiplicacao (x,y){
    return x*y;
}
function divisao (x,y){
    return x/y;
}

var valor1,valor2 = 0;

valor1 = parseFloat(prompt("Digite do 1° valor"));
valor1 = parseFloat(prompt("Digite do 2° valor"));
var op = parseInt(prompt("Digite a operação\n[1] Adição\n[2] Subtração\n[3] Multiplicação\n[4] Divisão"));

switch (op){
    case 1: 
        alert("o resultado é: "+adicao(valor1,valor2));
        break;
    case 2:
        alert("O resultado é: "+subtracao(valor1,valor2))
        break;
    case 3:
        alert("O resultado é: "+multiplicacao(valor1,valor2));
        break;
    case 4:
        alert("O resultado é: "+divisao(valor1,valor2))
        break;
    default: 
        alert("Operação incorreta");
        break;
}