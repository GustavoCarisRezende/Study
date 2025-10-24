---
tags:
  - note
topic: "[[00_Prompt Engineering/08_Best Practices/_Best Practices|_Best Practices]]"
---
# Provide few-shot examples for structure or output style you need

---
## **Resumo**
Esta é a prática de ao invés apenas descrever oque você quer, fornecer exemplos ao **modelo** exatamente o formato da resposta, incluindo de 2 a 5 exemplos completos de "*pergunta e resposta*" no formato desejado antes de realizar o questionamento final.

---
## **Conceitos Abordados**

### O que é
É a prática de incluir no seu prompt de 2 a 5 exemplos completos de "pergunta e resposta" no formato que você deseja, antes de fazer sua pergunta final.

### Por que funciona tão bem?
Modelos de linguagem são ótimos em seguir padrões. Ao ver seus exemplos, ele entende perfeitamente a estrutura, o estilo e o formato esperados, resultando em uma resposta muito mais precisa e consistente, por exemplo:

``` exemplo
Classifique o e-mail no final da lista.

E-mail: "Olá, gostaria de saber o preço do produto X."
Classificação: Venda
---
E-mail: "Não consigo resetar minha senha, podem me ajudar?"
Classificação: Suporte
---
E-mail: "Pessoal, a reunião de sexta foi adiada."
Classificação: Interno
---
E-mail: "Gostaria de agendar uma demonstração do software."
Classificação:
```

---
