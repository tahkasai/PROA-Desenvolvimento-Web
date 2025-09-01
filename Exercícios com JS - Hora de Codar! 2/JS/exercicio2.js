var valor = parseInt(prompt("Digite um valor"));

if (valor == 0){
    alert("O valor é zero");
} else {
    var resultado = valor<0?"O valor é negativo":"O valor é positivo";
    alert(resultado);
}