---
tags:
  - note
topic: "[[00_Prompt Engineering/08_Best Practices/_Best Practices|_Best Practices]]"
---
# Tune sampling (temperature, top-k, top-p) for determinism vs creativity

---
## **Resumo**
Você pode controlar o nível de "ousadia" ou "previsibilidade" do modelo ajustando alguns parâmetros-chave. Isso permite que você decida se quer uma resposta direta e factual ou uma resposta mais criativa e inesperada.

---
## **Conceitos Abordados**

### Oque são estes parâmetros?
Quando o modelo vai escolher a próxima palavra, ele calcula a probabilidade de todas as palavras possíveis. Esses parâmetros filtram essa lista de escolhas. Este conteúdo foi abordado em [[00_Prompt Engineering/02_Sampling Parameters/_Sampling Parameters|Sampling Parameters]].

---
## **Conteúdos Adicionais**

### Como Usar na Prática
Você não precisa ser um especialista, apenas entenda a lógica:
- **Precisa de fatos, código ou um resumo fiel?** 🎯
    - Use **baixa temperatura** (ex: `0.1` a `0.3`). A resposta será consistente e previsível.
        
- **Quer brainstorm de ideias, um poema ou uma história?** 🎨
    - Use **alta temperatura** (ex: `0.7` a `1.0`). A resposta será mais surpreendente e variada.

### Dica profissional
Geralmente, **ajuste apenas a Temperatura ou o Top-p**, não ambos ao mesmo tempo, pois eles controlam a aleatoriedade de maneiras que podem entrar em conflito. A maioria das ferramentas foca na Temperatura por ser mais intuitiva.

---
