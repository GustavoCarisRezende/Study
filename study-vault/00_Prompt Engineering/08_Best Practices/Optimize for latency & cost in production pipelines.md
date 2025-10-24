---
tags:
  - note
topic: "[[00_Prompt Engineering/08_Best Practices/_Best Practices|_Best Practices]]"
---
# Optimize for latency & cost in production pipelines

---
## **Resumo**
Quando seu prompt é usado em um aplicativo real com usuários de verdade, a **velocidade** da resposta (latência) e o **custo** de cada chamada à API se tornam tão importantes quanto a qualidade da resposta. O objetivo é projetar prompts que sejam eficientes.

---
## **Conceitos Abordados**

### Por que isso é tão importante?
- **Custo 💰:** A maioria dos serviços de IA cobra por "tokens" (pedaços de palavras) que entram e saem. Prompts e respostas longos, multiplicados por milhares de usuários, podem gerar uma conta altíssima.
- **Velocidade (Latência) ⚡:** Ninguém gosta de esperar. Se a sua funcionalidade de IA demora muito para responder, a experiência do usuário é prejudicada, e as pessoas simplesmente deixam de usá-la.

---
## **Conteúdos Adicionais**

### Como Otimizar na Prática
- **Escolha o Modelo Certo:** Não use o modelo mais potente e caro para uma tarefa simples. Para classificar um sentimento (positivo/negativo), um modelo menor e mais rápido é suficiente. Reserve os modelos mais poderosos (e mais lentos/caros) para tarefas complexas como escrita criativa ou raciocínio profundo.

- **Minimize o Número de Tokens:**
    - **Prompts Curtos:** Como já vimos, ser conciso não só melhora a clareza, mas também reduz diretamente o custo e o tempo de processamento do seu pedido.
    - **Respostas Curtas:** Limite o comprimento da resposta. Se você só precisa de um "sim" ou "não", instrua o modelo a responder apenas isso. Usar o parâmetro `max_tokens` é uma forma de forçar essa concisão.

- **Use Cache:** Se vários usuários fazem a mesma pergunta, guarde a primeira resposta em um "cache" (uma memória temporária). Para as perguntas seguintes, entregue a resposta salva em vez de chamar a API de IA novamente. Isso reduz o custo a zero e a latência a quase zero para perguntas repetidas.

- **Processamento em Lote (Batch):** Se você precisa executar a mesma tarefa em muitos dados diferentes (ex: resumir 100 artigos), é mais eficiente enviar todos em um único "pacote" (batch request) do que fazer 100 chamadas separadas à API.

---
