const valores = [];  //const: valores que não vão mudar. var: valores mutateis
var primeiro,ultimo, maior, valor = 0;

for(var i=0; i<4; i++){
    valor =  parseInt(prompt("Digite o "+(i+1)+"° valor"));
    if (i==0){
        primeiro = valor;
    }else if (i==3){
        ultimo = valor;
    }
    valores.push(valor);
}
maior = primeiro;

for (i=0; i<4; i++){
    if(maior<valores[i]){
        maior = valores[i];
    }
}
alert("O primeiro número é: "+primeiro+"\nO último valor é: "+ultimo+"\nO maior valor é: "+maior);