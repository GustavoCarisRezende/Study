const estudanteReprovou = (notaFinal, faltas) => {
    if(notaFinal < 7 && faltas > 4) {
        return true;
    } else {
        return false;
    }
}

console.log(estudanteReprovou(10, 8));
