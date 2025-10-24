---
tags:
  - note
topic: "[[00_Prompt Engineering/09_Improving Reliability/_Improving Reliability|_Improving Reliability]]"
---
# Prompt Debiasing

---
## **Resumo**
**Prompt Debiasing** é o processo de criar ou refinar um prompt para identificar, mitigar e corrigir tendências (vieses) indesejadas na resposta de um modelo de linguagem (LLM).

---
## **Conceitos Abordados**

### Problema Principal
LLMs são treinados em enormes volumes de texto da internet, os quais refletem os vieses, estereótipos e preconceitos históricos e sociais da humanidade. Se um prompt não for cuidadosamente construído, ele pode facilmente "ativar" esses vieses, resultando em respostas que são injustas, estereotipadas ou que fazem suposições indevidas (por exemplo, sobre gênero, raça, nacionalidade ou profissão), por exemplo:
- **Prompt vago:** "Escreva sobre um médico."
- **Resultado potencialmente enviesado:** O modelo pode assumir automaticamente que o médico é um homem ("_Ele_ trabalha longas horas...").
- **Prompt vago:** "Descreva um CEO."
- **Resultado potencialmente enviesado:** O modelo pode descrever características associadas a estereótipos de liderança ocidentais ou masculinos.

### Objetivo
O objetivo do debiasing não é "retreinar" o modelo, mas sim **orientar a saída** para que ela seja neutra, justa e objetiva, apesar dos vieses presentes nos dados de treinamento.

---
## **Conteúdos Adicionais**

### Principais Técnicas
- **Linguagem Neutra e Específica:** A forma mais simples. Em vez de usar linguagem que possa sugerir um grupo, seja explícito sobre a neutralidade.    
    - **Antes:** "Quando um usuário esquece _sua_ senha..." (Pode induzir ao masculino).
    - **Depois:** "Quando um usuário esquece _sua_ (dele ou dela) senha..." ou "Quando usuários esquecem _suas_ senhas..."

- **Instruções Explícitas de Imparcialidade:** Diga diretamente ao modelo para ser objetivo e evitar suposições.
    - "Descreva os papéis de um(a) enfermeiro(a) e um(a) engenheiro(a), garantindo uma descrição objetiva e **evitando estereótipos de gênero**."
    - "Forneça uma análise imparcial do tópico X, apresentando os fatos sem tomar partido."

- **Balanceamento de Perspectivas (Contextual Priming):** Se o tópico for sensível, peça explicitamente ao modelo para considerar múltiplos pontos de vista.
    - "Analise o impacto econômico da política Y, considerando tanto os argumentos dos seus defensores quanto as críticas dos seus opositores."

- **Uso de Restrições Claras:** Proíba o comportamento indesejado.
    - "Descreva o candidato ideal para esta vaga de emprego. **Não faça suposições** sobre a etnia, idade ou gênero do candidato."

---
