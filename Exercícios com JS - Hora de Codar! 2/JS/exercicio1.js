var a = prompt("Digite o primeiro valor");
var b = prompt("Digite o segundo valor");

var resultado = "";

if(a==b){
    resultado = "Ambos tem o mesmo valor";
}else{
    resultado = a>b?a+" é maior":+b+" é maior"; //Operador ternário
};

alert(resultado);