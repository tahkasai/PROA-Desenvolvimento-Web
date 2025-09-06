var valor,soma = 0;
var linf = 1;

while(linf<=4){
    valor = parseInt(prompt("Informe o "+linf+" número de 0 a 10"));
    if (valor<0 && valor>10){
        alert("Número incorreto");
    }
    else{
        soma+= valor;
        linf++;
    }
}
soma = soma / 4;
alert(soma>5?"Você passou no teste":"Tente novamente");