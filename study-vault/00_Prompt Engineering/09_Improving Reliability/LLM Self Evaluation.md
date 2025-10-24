---
tags:
  - note
topic: "[[00_Prompt Engineering/09_Improving Reliability/_Improving Reliability|_Improving Reliability]]"
---
# LLM Self Evaluation

---
## **Resumo**
**LLM Self-Evaluation** é uma técnica em que você usa um modelo de linguagem (o próprio LLM ou um segundo LLM) para atuar como um "juiz", "avaliador" ou "crítico" da resposta gerada pelo primeiro prompt.
É o equivalente a pedir a alguém para "revisar seu próprio trabalho" antes de entregá-lo. Em vez de um humano verificar manualmente cada resposta (o que é inviável em escala), você automatiza o controle de qualidade (QC) usando a própria IA.

---
## **Conceitos Abordados**

### Como funciona
O processo geralmente tem duas etapas (dois prompts):
1. **Prompt de Geração:** O prompt padrão que executa a tarefa principal.
    - _Exemplo:_ "Resuma o seguinte texto [longo texto aqui] em 3 pontos principais."
    - _Resposta Gerada:_ (O LLM gera um resumo de 3 pontos).

2. **Prompt de Avaliação:** Um segundo prompt (o "avaliador") que recebe a pergunta original, o contexto (se houver) e a resposta gerada. Este prompt pede ao LLM para "dar uma nota" ou verificar critérios específicos.    
    - _Exemplo:_ "Você recebeu um [Texto Original] e um [Resumo Gerado]. Avalie este resumo em uma escala de 1 a 5 nos seguintes critérios:
        - **Fidelidade:** O resumo contém informações que _não_ estavam no texto original?
        - **Completude:** O resumo capturou os 3 pontos _mais importantes_?"
    - _Resposta da Avaliação:_ (O LLM pode retornar um JSON, ex: `{"fidelidade": 5, "completude": 3}`).

### Principais Critérios que um LLM pode Autoavaliar
- **Fidelidade (Faithfulness) / "Groundedness":** Esta é a verificação mais comum. A resposta é fiel ao contexto fornecido (como em um sistema RAG - Retrieval-Augmented Generation)? Ou ela "alucinou" e inventou fatos?
- **Seguimento de Instruções (Constraints):** A resposta seguiu o formato solicitado (ex: JSON, lista, tabela)? Respeitou um limite de palavras?
- **Completude da Resposta:** A resposta abordou todas as partes da pergunta do usuário?
- **Tom e Estilo:** A resposta usou a persona ou o tom solicitado (ex: "formal", "amigável", "como um especialista")?
- **Relevância:** A resposta está realmente respondendo à pergunta ou está divagando?

---
## **Conteúdos Adicionais**

### Por que isso melhora a confiabilidade?
A autoavaliação transforma um sistema "caixa preta" em um sistema com um **mecanismo de controle de qualidade automatizado**.
1. **Detecção de Erros em Tempo Real:** Ele permite que seu sistema identifique e descarte respostas ruins (alucinações, respostas incompletas) _antes_ que elas cheguem ao usuário.
2. **Iteração e Retentativa:** Se o "avaliador" der uma nota baixa (ex: "Não Fiel"), o sistema pode ser programado para "tentar novamente" – ou seja, executar o prompt de geração mais uma vez, talvez com instruções ligeiramente diferentes (como "Seja mais fiel ao texto desta vez").
3. **Filtragem de Baixa Qualidade:** Garante que apenas as respostas que passam por um rigoroso conjunto de regras autoimpostas sejam consideradas "confiáveis" e exibidas.

É uma forma de usar a própria inteligência do LLM para policiar a si mesmo, aumentando drasticamente a consistência e a precisão da saída final.

---
