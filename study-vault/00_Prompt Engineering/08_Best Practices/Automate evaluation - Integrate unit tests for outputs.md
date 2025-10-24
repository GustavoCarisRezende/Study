---
tags:
  - note
topic: "[[00_Prompt Engineering/08_Best Practices/_Best Practices|_Best Practices]]"
---
# Automate evaluation - Integrate unit tests for outputs

---
## **Resumo**
Em vez de verificar manualmente se a resposta do modelo está correta, crie um sistema automático (um "teste") que compare a saída do modelo com a "resposta certa" que você já definiu.

---
## **Conceitos Abordados**

### Por que funciona?
Isso transforma a engenharia de prompts de uma arte subjetiva em uma ciência mensurável. Permite que você:
- **Evite Regressões:** Garante que ao melhorar o prompt para um caso de uso, você não piore o resultado para outro que já funcionava.
- **Itere Rapidamente:** Você pode fazer uma alteração no prompt, rodar os testes e saber em segundos se a mudança foi positiva ou negativa no geral.
- **Seja Objetivo:** Dá a você uma nota clara (ex: "95% de acerto") sobre a qualidade do seu prompt, em vez de um "acho que está bom".

### Como funciona na prática?
1. **Crie um "Conjunto de Testes":** Prepare uma lista de exemplos. Cada exemplo deve ter:
    - Uma **Entrada** (o texto/pergunta que você enviará para o modelo).
    - Uma **Saída Esperada** (a resposta exata que você considera correta).
    
2. **Execute os Testes:** Crie um script que, para cada item da sua lista:
    - Envia a **Entrada** para o modelo usando o seu prompt.
    - Recebe a **Saída Real** do modelo.
    - Compara a **Saída Real** com a sua **Saída Esperada**.

3. **Avalie o Resultado:** O script te diz quantos testes passaram e quantos falharam.

---
## **Conteúdos Adicionais**

### Exemplo prático
- **Seu Prompt:** `"Classifique o sentimento do texto a seguir como 'Positivo', 'Negativo' ou 'Neutro'. Responda com apenas uma palavra. Texto: {{TEXTO}}"`
- **Seu Conjunto de Testes:**
    1. **Entrada:** "Amei o filme, foi incrível!" -> **Saída Esperada:** `Positivo`
    2. **Entrada:** "O serviço demorou muito e a comida estava fria." -> **Saída Esperada:** `Negativo`
    3. **Entrada:** "A reunião foi agendada para as 15h." -> **Saída Esperada:** `Neutro`

---
