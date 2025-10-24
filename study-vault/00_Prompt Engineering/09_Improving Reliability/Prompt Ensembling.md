---
tags:
  - note
topic: "[[00_Prompt Engineering/09_Improving Reliability/_Improving Reliability|_Improving Reliability]]"
---
# Prompt Ensembling

---
## **Resumo**
**Prompt Ensembling** é uma técnica avançada de engenharia de prompt onde, em vez de depender de um único prompt "perfeito", você utiliza **múltiplos prompts diferentes** para executar a **mesma tarefa** e, em seguida, combina os resultados para gerar uma resposta final mais robusta e confiável.
A ideia central é análoga ao conceito de "sabedoria das multidões": a resposta agregada de um grupo de "especialistas" (os diferentes prompts) é frequentemente melhor e mais confiável do que a resposta de qualquer especialista individual.

---
## **Conceitos Abordados**

### Como funciona
- **Criação de Variações:** Você cria vários prompts (geralmente de 3 a 5) que pedem a mesma coisa, mas de maneiras diferentes. Eles podem variar em:
    - **Formulação:** "Resuma o texto" vs. "Extraia os pontos-chave" vs. "Qual a ideia central?".
    - **Instruções:** Um prompt pode ser muito detalhado (zero-shot) enquanto outro usa exemplos (few-shot).
    - **Persona:** "Aja como um especialista em finanças e analise..." vs. "Explique para um iniciante...".

- **Execução:** Você envia cada um desses prompts para o LLM. (Frequentemente, ao usar essa técnica, as pessoas aumentam ligeiramente a "Temperatura" do modelo para obter respostas mais diversas que cubram diferentes possibilidades).

- **Agregação (O "Ensemble"):** Você coleta todas as respostas e as combina. A agregação pode ser feita de várias formas:
    - **Votação Majoritária:** (Mais usado para tarefas de classificação). Se 3 de 5 prompts dizem que o sentimento é "Positivo", a resposta final é "Positivo".
    - **Síntese ou Fusão:** (Mais usado para tarefas generativas). Você pode usar o próprio LLM uma última vez, alimentando-o com todas as respostas e pedindo para ele "consolidar" ou "sintetizar" a melhor resposta final a partir delas.
    - **Média:** (Para tarefas numéricas ou de ranking).

### Por que isso melhora a Confiabilidade
O Prompt Ensembling ataca diretamente o problema dos "prompts frágeis" (_brittle prompts_):
1. **Mitiga a Fragilidade do Prompt:** Se um dos seus prompts for mal formulado ou se o modelo o interpretar mal, os outros prompts agem como uma "rede de segurança". É improvável que o modelo interprete mal 3 ou 4 variações diferentes da mesma pergunta.
2. **Reduz a Aleatoriedade:** Diminui a chance de uma única resposta ruim, causada pela natureza probabilística do LLM (uma "alucinação" ou erro aleatório), estragar seu resultado.
3. **Resultados Mais Completos:** Ao forçar o modelo a pensar sobre o mesmo problema de ângulos diferentes (ex: "resuma" vs. "extraia pontos-chave"), a resposta final combinada tende a ser mais abrangente e precisa.

---
## **Conteúdos Adicionais**

### Desvantagem
A principal desvantagem é o custo. Em vez de uma chamada de API para o LLM, você precisa fazer várias (uma para cada prompt, mais uma potencial para a agregação), o que aumenta o custo e a latência.

---
