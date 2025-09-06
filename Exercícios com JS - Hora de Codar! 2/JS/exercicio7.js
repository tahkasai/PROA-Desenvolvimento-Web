const numeros = [];
var numero,soma = 0;

for (i=0;i<6;i++){
    numero = parseInt(prompt("Informe o "+(i+1)+"° número: "));
    if (numero<72){
        soma+=numero;
    }
    numeros[i]=numero;
}

alert("Os números informados são: "+numeros+"\nA soma dos números menores de 72 é: "+soma);
