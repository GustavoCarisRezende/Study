---
tags:
  - note
topic: "[[00_Prompt Engineering/09_Improving Reliability/_Improving Reliability|_Improving Reliability]]"
---
# Calibrating LLMs

---
## **Resumo**
**Calibrating LLMs** refere-se ao processo de ajustar um modelo para garantir que os "níveis de confiança" (confidence scores) que ele gera para suas respostas reflitam com precisão a _probabilidade real_ de essas respostas estarem corretas.

---
## **Conceitos Abordados**

### O problema principal
Muitos LLMs modernos, especialmente após o ajuste fino (fine-tuning) e o RLHF (Aprendizado por Reforço com Feedback Humano), são **mal calibrados**.
Isso significa que eles se tornam **extremamente superconfiantes (overconfident)**. Um modelo pode dizer que está "99,9% certo" sobre um fato que, na realidade, está completamente errado (uma alucinação).
Para um sistema confiável, um modelo que está "50% confiante" e acerta 50% das vezes é muito mais útil e seguro do que um modelo que está "99% confiante" e acerta apenas 50% das vezes.

### Calibragem na Engenharia de Prompt
Enquanto a "calibragem profunda" (como _Temperature Scaling_) é uma técnica matemática aplicada _após_ o treinamento do modelo (geralmente por cientistas de dados), existem várias técnicas de _prompt_ que podemos usar para forçar uma "calibragem comportamental" e melhorar a confiabilidade.
O objetivo é fazer com que o modelo expresse incerteza quando apropriado, em vez de sempre afirmar algo com autoridade total.

### Principais Técnicas via Prompt
- **Solicitação Explícita de Confiança:** Esta é a técnica mais direta. Você pede ao modelo para autoavaliar sua confiança.
    - "Responda à pergunta e, em seguida, forneça um nível de confiança (Baixo, Médio, Alto) para sua resposta."
    - "Em uma escala de 0 a 10, quão certo você está desta informação?"
    - _Nota: Embora esse número não seja uma probabilidade estatística "real", ele força o modelo a refletir e expor dúvidas._

- **Oferecer uma "Válvula de Escape" (Escape Hatch):** Esta é uma das técnicas mais importantes para a confiabilidade. Você dá ao modelo permissão explícita para _não_ saber a resposta. Isso evita que ele invente (alucine) uma resposta apenas para satisfazer o prompt.
    - "Responda à pergunta com base _apenas_ no texto fornecido. **Se a resposta não estiver no texto, responda exatamente com 'Informação não encontrada'.**"
    - "Você sabe quem foi [pessoa obscura]? Se não tiver certeza, apenas diga 'Eu não sei'."

- **Forçar Raciocínio (Chain of Thought - CoT):** Pedir ao modelo para "pensar passo a passo" antes de dar a resposta final atua como um calibrador. Se a lógica nos passos do raciocínio for fraca, inconsistente ou baseada em suposições, fica evidente (para um humano ou um segundo LLM avaliador) que a confiança na resposta final deve ser baixa.
    - "Primeiro, liste os fatos. Segundo, analise os fatos. Terceiro, chegue a uma conclusão."

---
## **Conteúdos Adicionais**

### Por que isso melhora a confiabilidade
Um sistema confiável não é apenas aquele que acerta muito; é também aquele que **sabe quando está prestes a errar** e avisa você.

A calibragem permite que você confie no "nível de confiança" do modelo. Se um modelo calibrado diz que tem "Baixa Confiança", seu aplicativo pode automaticamente:
- Não exibir a resposta.
- Tentar um prompt diferente (como no _Prompt Ensembling_).
- Encaminhar a consulta para uma revisão humana.

Isso previne que informações falsas (alucinações) ditas com alta autoridade sejam repassadas ao usuário, tornando o sistema como um todo muito mais seguro e confiável.

---
