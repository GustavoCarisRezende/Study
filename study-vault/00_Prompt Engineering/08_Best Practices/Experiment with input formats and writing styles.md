---
tags:
  - note
topic: "[[00_Prompt Engineering/08_Best Practices/_Best Practices|_Best Practices]]"
---
# Experiment with input formats and writing styles

---
## **Resumo**
A forma como você pergunta importa tanto quanto _o que_ você pergunta. Testar diferentes maneiras de formular seu pedido pode levar a resultados drasticamente melhores.

---
## **Conceitos Abordados**

### Por que funciona?
O modelo de linguagem não "pensa" como um humano; ele responde a padrões que aprendeu em seus dados de treinamento. Uma pequena mudança na sua formulação pode ativar um padrão diferente e mais eficaz para a sua tarefa. É como tentar chaves diferentes em uma fechadura até encontrar a que abre a porta perfeitamente.

### O que você pode experimentar?
- **Comando vs. Pergunta:** Em vez de "Resuma este texto", tente "Qual é a ideia principal deste texto?".
- **Parágrafo vs. Lista:** Em vez de descrever o que você quer em um parágrafo, liste os requisitos com marcadores (bullets).
- **Persona:** Comece o prompt com "Você é um especialista em marketing..." ou "Aja como um roteirista de cinema..." para definir um tom e estilo específicos.
- **Positivo vs. Negativo:** Como vimos antes, focar no que você quer (`"Use uma linguagem simples"`) geralmente é melhor do que focar no que não quer (`"Não use palavras complicadas"`).

---
## **Conteúdos Adicionais**

### Exemplo prático
- **Tentativa 1 (Simples):** `"Me dê ideias para um post de blog sobre produtividade."`
    - _Resultado provável:_ Ideias genéricas como "Gerenciamento de tempo", "Técnica Pomodoro", etc.
        
- **Tentativa 2 (Com Persona e formato de pergunta):** `"Você é um coach de carreira experiente. Quais são as 3 dicas menos óbvias, mas mais impactantes, que você daria para um profissional que quer parar de procrastinar?"`
    - _Resultado provável:_ Ideias muito mais específicas, criativas e úteis, pois o prompt guiou o modelo para um "canto" mais especializado de seu conhecimento.

---
