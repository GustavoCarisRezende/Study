let notaFinal = 7;
const faltas = 1;
const advertencias = 0;

if(notaFinal < 7 && faltas > 4) {
    console.log("Reprovado, boas festas!")
} else {
    console.log("Não foi reprovado")
}

if(faltas < 2 && !advertencias) {
    notaFinal += notaFinal * 0.2;
    console.log("Recebeu bônus")
} else {
    console.log("Não recebeu o bônus")
}

console.log(`Nota final ${notaFinal}`);
