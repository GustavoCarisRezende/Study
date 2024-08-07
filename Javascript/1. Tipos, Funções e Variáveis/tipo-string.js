const estudante = "Caroline";
const docente = 'Ana';
const cumprimento = "Nosso lema é 'estudar bastente'";
const citacao = `Ju diz: "Nosso lema é..."`;

console.log(estudante);
console.log(docente);
console.log(cumprimento);
console.log(citacao);

console.log('A estudante chama: ' + estudante);

// template strings
console.log(`A estudante se chama ${estudante}`);

const senha = 'SenhaSegura123'.concat(estudante.toUpperCase());

console.log(senha);

console.log('\u2705 - \u3041');
