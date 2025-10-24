---
tags:
  - note
topic: "[[00_Prompt Engineering/08_Best Practices/_Best Practices|_Best Practices]]"
---
# Prioritize giving clearer instructions over adding constraints

---
## **Resumo**
É mais eficaz dizer ao modelo exatamente o que você quer (o resultado ideal) do que listar tudo o que você _não_ quer.

---
## **Conceitos Abordados**

### Por que funciona?
Instruções claras e positivas guiam o modelo diretamente para o alvo. Um excesso de restrições (o que não fazer) pode confundir, limitar a criatividade e resultar em um texto forçado ou de baixa qualidade, pois o modelo gasta mais "esforço" tentando evitar os erros do que acertar no objetivo principal.

---
## **Conteúdos Adicionais**

### Exemplo prático
- **Prompt focado em RESTRIÇÕES (menos eficaz):** `"Escreva uma descrição para um novo fone de ouvido. Não use jargões técnicos. Não soe como um vendedor. Evite a palavra 'barato'."`
    - _O modelo pode se tornar excessivamente cauteloso e produzir algo genérico._
        
- **Prompt focado em INSTRUÇÕES CLARAS (mais eficaz):** `"Escreva uma descrição para um novo fone de ouvido. Use uma linguagem simples e amigável, focando em como o som cristalino e o conforto melhoram a experiência do dia a dia do ouvinte."`    
    - _Isso descreve o resultado desejado, dando ao modelo um caminho claro a seguir._

---
