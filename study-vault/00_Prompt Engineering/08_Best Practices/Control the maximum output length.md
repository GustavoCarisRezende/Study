---
tags:
  - note
topic: "[[00_Prompt Engineering/08_Best Practices/_Best Practices|_Best Practices]]"
---
# Control the maximum output length

---
## **Resumo**
Especifique o quão longa (ou curta) você quer que a resposta seja. Use limites de palavras, frases, parágrafos ou até caracteres.

---
## **Conceitos Abordados**

### Por que funciona?
Isso evita respostas vagas e excessivamente longas ou curtas. Ao definir um limite, você força o modelo a ser conciso e focar nos pontos mais importantes, garantindo que a saída seja adequada para o seu propósito (por exemplo, um tweet, um resumo de e-mail ou um cabeçalho).

---
## **Conteúdos Adicionais**

### Exemplo prático
- **Prompt SEM controle de tamanho:** `"Fale sobre a importância da Revolução Francesa."`
    - _Pode resultar em um ensaio completo._
        
- **Prompt COM controle de tamanho (mais eficaz):** `"Descreva a importância da Revolução Francesa em um único parágrafo, com no máximo 100 palavras."`
    - _Garante uma resposta curta, ideal para um resumo rápido ou um slide de apresentação._

---
