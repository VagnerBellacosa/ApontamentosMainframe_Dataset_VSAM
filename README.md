# Apontamentos Mainframe: Dataset VSAM


# 💾 VSAM para Programadores Júnior — O Guia Essencial

Se você está entrando no universo do mainframe, vai ouvir falar de VSAM o tempo todo. Ele não é apenas um tipo de arquivo — é **um dos pilares de armazenamento de dados no z/OS**.

------

## 📌 O que é VSAM?

**VSAM (Virtual Storage Access Method)** é um método de acesso a dados criado pela IBM para organizar, armazenar e recuperar dados de forma eficiente.

Diferente dos arquivos sequenciais tradicionais, o VSAM permite:

- Acesso rápido (direto e sequencial)
- Organização estruturada
- Controle mais refinado de dados

👉 Pense nele como um “mini banco de dados estruturado”, porém mais próximo do sistema operacional.

------

## 🎯 Para que serve o VSAM?

O VSAM é amplamente usado em:

- Sistemas bancários 💳
- Sistemas de seguros 📄
- Aplicações críticas em tempo real (CICS) ⚡
- Processamentos batch de alto volume

💡 Em resumo:
 Ele é usado quando você precisa de **alta performance + confiabilidade + acesso estruturado aos dados**.

------

## ⚙️ Funcionalidades principais

O VSAM oferece várias capacidades importantes:

- 🔎 **Acesso direto (random)** — buscar um registro específico
- 🔁 **Acesso sequencial** — ler dados em ordem
- 🔐 **Integridade de dados**
- ⚡ **Alta performance em grandes volumes**
- 📊 **Indexação (em alguns tipos)**

------

## 🧰 IDCAMS — O canivete suíço do VSAM

O VSAM é gerenciado principalmente pelo utilitário:

👉 IDCAMS

Com o IDCAMS você pode:

- Criar datasets VSAM (`DEFINE`)
- Deletar (`DELETE`)
- Listar informações (`LISTCAT`)
- Reorganizar dados
- Copiar datasets

### 🧪 Exemplo simples

```
//STEP01 EXEC PGM=IDCAMS
//SYSPRINT DD SYSOUT=*
//SYSIN DD *
  DEFINE CLUSTER(NAME(MEU.KSDS)
  INDEXED
  KEYS(10 0)
  RECORDSIZE(80 80)
  TRACKS(1 1))
/*
```

------

# 📦 Tipos de VSAM

Agora vem a parte mais importante: entender os tipos.

------

## 🔹 ESDS — Entry Sequenced Data Set

7

- Dados gravados **em sequência**
- Não possui chave
- Acesso por posição (RBA)

👉 Uso típico:

- Logs
- Arquivos históricos

------

## 🔹 KSDS — Key Sequenced Data Set

7

- Possui **chave primária**
- Usa índice para acesso rápido
- Permite acesso direto e sequencial

👉 Uso típico:

- Sistemas bancários
- Cadastros de clientes

💡 É o tipo mais usado!

------

## 🔹 RRDS — Relative Record Data Set

6

- Registros organizados por **número relativo (RRN)**
- Acesso direto pelo número do registro
- Estrutura fixa

👉 Uso típico:

- Tabelas com posições fixas
- Sistemas que dependem de índice numérico

------

## 🔹 LDS — Linear Data Set

7

- Não possui estrutura de registros
- Apenas um bloco contínuo de bytes

👉 Uso típico:

- DB2
- Armazenamento interno de bancos

💡 É mais “baixo nível”.

------

# ⚖️ Diferenças entre ESDS, KSDS, RRDS e LDS

| Tipo | Chave       | Acesso              | Estrutura    | Uso comum |
| ---- | ----------- | ------------------- | ------------ | --------- |
| ESDS | ❌           | Sequencial / RBA    | Simples      | Logs      |
| KSDS | ✅           | Direto + Sequencial | Indexado     | Cadastros |
| RRDS | ❌ (usa RRN) | Direto              | Fixo         | Tabelas   |
| LDS  | ❌           | Byte offset         | Sem registro | DB2       |

------

# 🤝 Semelhanças entre eles

Apesar das diferenças, todos compartilham:

- São datasets VSAM
- Gerenciados via IDCAMS
- Altamente performáticos
- Usados no z/OS
- Suportam grandes volumes de dados

------

# 🚀 VSAM NoSQL? O que é isso?

O termo **“VSAM NoSQL”** não é oficial da IBM, mas é usado informalmente para descrever:

👉 Uso do VSAM como armazenamento chave-valor

Exemplo:

- KSDS funcionando como um “NoSQL”
- A chave = identificador
- O registro = documento

💡 Isso aparece muito em:

- APIs expostas via CICS
- Integrações modernas (JSON + COBOL)

------

# 🧠 Resumo estilo Bellacosa

- VSAM é o **motor de dados raiz do mainframe**
- KSDS é o “rei” 👑
- IDCAMS é seu melhor amigo 🧰
- LDS é o “lado obscuro” (baixo nível)
- VSAM ainda vive — e MUITO — em sistemas críticos
