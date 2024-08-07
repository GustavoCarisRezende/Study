const notaPrimeiroBi = 8;
const notaSegundoBi = 6.3;
const notaTerceiroBi = 7;
const notaQuartoBi = 9.3;

let media = (notaPrimeiroBi + notaSegundoBi + notaTerceiroBi + notaQuartoBi) / 4;

console.log(`A média é ${media}`);
if(media >= 7) {
    media += media *.1;
}

console.log(`A nova média é ${media.toFixed(2)}`);

