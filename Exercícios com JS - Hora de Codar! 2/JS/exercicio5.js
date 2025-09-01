var valores = [];
var valor,soma = 0;

for(var i = 0; i < 6; i++){
    valor = parseInt(prompt("Digite o "+(i+1)+"° número"));
    valores.push(valor); // adiciona um valor no final da lista. É como um append do python.
    soma += valor;
}
alert("Os números são: "+valores+"\nA media aritmética dos valores é: "+(soma/6));