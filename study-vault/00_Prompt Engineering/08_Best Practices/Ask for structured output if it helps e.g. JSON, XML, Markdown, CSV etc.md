---
tags:
  - note
topic: "[[00_Prompt Engineering/08_Best Practices/_Best Practices|_Best Practices]]"
---
# Ask for structured output if it helps e.g. JSON, XML, Markdown, CSV etc

---
## **Resumo**
Peça por uma saída estruturada se isso ajudar, por exemplo: JSON, XML, Markdown, CSV etc.

---
## **Conceitos Abordados**

### Ideia principal
Se você precisa que a resposta seja usada por outro programa ou sistema, instrua o modelo a formatar a saída em uma linguagem de marcação ou dados (como JSON, Markdown, etc.).

### Por que funciona?
Isso transforma a resposta de um texto livre e imprevisível em dados consistentes e fáceis de processar. Um programa pode ler um JSON ou um CSV diretamente, sem precisar de lógicas complexas para "entender" uma frase. Isso é fundamental para automação.

---
## **Conteúdos Adicionais**

### Exemplo prático
- **Prompt SEM estrutura:** `"Liste os três maiores planetas do sistema solar e seus diâmetros."`
    - _Resultado possível:_ "Os maiores planetas são Júpiter (com um diâmetro de 139.820 km), Saturno (que tem 116.460 km) e Urano (com 50.724 km)." -> _Difícil para um programa ler._
        
- **Prompt COM estrutura:** `"Liste os três maiores planetas do sistema solar e seus diâmetros. Formate a saída como um array de objetos JSON com as chaves 'planeta' e 'diametro_km'."`
	- Resultado esperado:
```json
[
	{
		"planeta": "Júpiter",
	    "diametro_km": 139820
	},
	{
	    "planeta": "Saturno",
	    "diametro_km": 116460
	},
	{
	    "planeta": "Urano",
	    "diametro_km": 50724
	}
]
```

---
