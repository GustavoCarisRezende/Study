---
tags:
  - note
topic: "[[00_Prompt Engineering/08_Best Practices/_Best Practices|_Best Practices]]"
---
# Document and track prompt versions

---
## **Resumo**
Trate seus prompts como se fossem código: salve cada mudança significativa como uma nova versão para que você possa comparar resultados e reverter para uma versão anterior se algo der errado.

---
## **Conceitos Abordados**

### Por que isso é Crucial?
Sem um histórico, a melhoria de prompts se torna um processo de tentativa e erro caótico. O versionamento resolve isso ao garantir:
1. **Rastreabilidade:** Se a qualidade das respostas de repente piora, você sabe exatamente qual mudança no prompt causou o problema.
2. **Reprodutibilidade:** Você pode, a qualquer momento, voltar para uma versão anterior que funcionava bem para uma tarefa específica.
3. **Colaboração:** Se mais de uma pessoa trabalha nos prompts, todos sabem qual é a versão "oficial" e podem ver o histórico de alterações.   
4. **Otimização Sistemática:** Permite realizar testes A/B entre versões para provar objetivamente qual prompt é melhor, usando os testes automatizados que discutimos no tópico anterior.

### Como fazer na prática?
Existem abordagens de diferentes níveis de complexidade:

- **Nível Simples: Uma Planilha ou Documento** Crie uma tabela simples com colunas como: | Versão | Data | Autor | Mudanças Realizadas | Notas de Performance | | :--- | :--- | :--- | :--- | :--- | | v1.0 | 15/10/25 | Eu | Versão inicial para resumir artigos. | Funciona bem, mas às vezes é longo. | | v1.1 | 17/10/25 | Eu | Adicionado limite de "máximo 100 palavras". | Resumos mais concisos, 90% de acerto. |

- **Nível Intermediário: Controle de Versão (Git)** Esta é a abordagem profissional. Como você está criando um repositório de estudos, essa prática se encaixa perfeitamente.
    1. Salve cada prompt em um arquivo de texto simples (ex: `resume_artigo.txt` ou `resume_artigo.md`).
    2. Use um sistema de controle de versão como o Git para gerenciar as mudanças.
    3. Cada vez que você fizer uma alteração significativa, faça um "commit" com uma mensagem clara. Ex: `git commit -m "feat: Adiciona limite de 100 palavras ao prompt de resumo"`

- **Nível Avançado: Plataformas de "Prompt Management"** Já existem ferramentas e plataformas especializadas para equipes gerenciarem, testarem e implementarem prompts em larga escala.

---
## **Conteúdos Adicionais**

### Conectando com seu fluxo de trabalho
Considerando seu interesse em **Obsidian** e na criação de um repositório, a abordagem ideal para você seria usar arquivos Markdown dentro do seu cofre (Vault) e versioná-los com Git.

Você poderia criar um template em Markdown no Obsidian para cada prompt que desenvolver, algo assim:

```markdown
---
prompt_id: resumo-tecnico-001
version: 1.1
date: 2025-10-17
author: Seu Nome
status: em-producao
changes: "Adicionado limite explícito de 3 parágrafos para maior concisão."
performance_notes: "Atingiu 98% de conformidade nos testes de resumo."
---

# Prompt: Resumo Técnico

## Descrição
Este prompt tem como objetivo resumir artigos técnicos complexos em um formato acessível para iniciantes.

## Texto do Prompt

'''prompt
Resuma o texto a seguir em exatamente 3 parágrafos.
Use uma linguagem simples e evite jargões técnicos. O público-alvo são estudantes de tecnologia.

Texto a ser resumido:
{{TEXTO_ARTIGO}}
'''
```

---
