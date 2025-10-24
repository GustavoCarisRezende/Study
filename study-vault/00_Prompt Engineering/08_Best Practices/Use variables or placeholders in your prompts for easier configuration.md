---
tags:
  - note
topic: "[[00_Prompt Engineering/08_Best Practices/_Best Practices|_Best Practices]]"
---
# Use variables or placeholders in your prompts for easier configuration

---
## **Resumo**
Em vez de escrever um prompt novo para cada tarefa, crie um "molde" (template) com espaços vazios (variáveis) que você pode preencher depois.

---
## **Conceitos Abordados**

### Por que funciona?
Isso separa a **instrução** (o que fazer) dos **dados** (com o que fazer). Torna o prompt reutilizável e perfeito para automação. Você pode usar o mesmo prompt-base para centenas de entradas diferentes, apenas trocando o valor das variáveis. Isso economiza tempo e reduz erros.

---
## **Conteúdos Adicionais**

### Exemplo prático
Imagine que você precisa enviar e-mails de boas-vindas para novos clientes.
- **Prompt SEM variáveis (ruim para automação):** `"Escreva um e-mail de boas-vindas para o cliente João, que comprou o 'Plano Premium'."` _(Você teria que editar o texto do prompt para cada novo cliente)._
- **Prompt COM variáveis (bom para automação):** `"Escreva um e-mail de boas-vindas para o cliente {{NOME_CLIENTE}}, que comprou o '{{NOME_PLANO}}'."` _(Aqui, `{{NOME_CLIENTE}}` e `{{NOME_PLANO}}` são variáveis. Um sistema pode simplesmente preenchê-las sem tocar no resto do prompt)._

---
