var maior = parseInt(prompt("Digite o primeiro valor"));
var meio = parseInt(prompt("Digite o segundo valor"));
var menor = parseInt(prompt("Digite o terceiro valor"));

var troca = 0;

while(true){
    if (maior>meio>menor){
        false;
    } else{
        if(maior<meio){
            troca = maior;
            maior = meio;
            meio = troca;
        }
        if(meio<menor){
            troca = meio;
            meio = menor;
            menor = troca;
        }
        if(menor>maior){
            troca = menor;
            menor = maior;
            maior = troca;
        }
    }
    break;
}

var soma = maior + meio;
alert(soma);

// melhor forma de resolver
// var x = parseInt(prompt("Digite um numero: "));
// var y = parseInt(prompt("Digite um numero: "));
// var z = parseInt(prompt("Digite um numero: "));
 
// var numbers = [x, y, z];
// var soma = numbers.sort((a, b) => a - b)[1] + numbers.sort((a, b) => a - b)[2];
       
// alert(soma);