# 🔧 Script de Limpeza de Arquivos Temporários e Disco no Windows

Este é um **script PowerShell** que realiza uma limpeza automatizada das pastas de arquivos temporários do Windows e também executa a ferramenta de **Limpeza de Disco** da unidade `C:`. O script foi projetado para **ignorar arquivos específicos**, garantindo que arquivos importantes não sejam excluídos por engano.

---

## 📂 **O que este script faz?**

1. Limpa a pasta **`%Temp%` do usuário atual**, ignorando arquivos que terminam com `.tmp`.
2. Limpa a pasta **`C:\Windows\Temp`**, ignorando arquivos que terminam com `.log`.
3. Executa a **Limpeza de Disco** usando a ferramenta do Windows (`cleanmgr.exe`).

---

## 🖥️ **Como executar o script?**

### Passo 1: Abra o PowerShell como Administrador
1. Pressione as teclas **`Win + S`** e digite **PowerShell**.
2. Clique com o botão direito em **Windows PowerShell** e selecione **Executar como Administrador**.

### Passo 2: Baixe ou copie o script
1. Salve o script em um arquivo de texto com a extensão **`.ps1`**. Por exemplo: `limpeza_temp.ps1`.

### Passo 3: Execute o script
No PowerShell, navegue até o diretório onde o script está salvo e execute o comando:

```powershell
.\cleaner.ps1
```

---

## ⚙️ **Personalização do Script**
Se você quiser **ignorar outros tipos de arquivos** durante a limpeza, basta editar as seguintes linhas no script:

- Para ignorar arquivos na pasta `%Temp%`, edite esta linha:
  ```powershell
  Limpar-Temp "$env:TEMP" ".tmp"
  ```
- Para ignorar arquivos na pasta `C:\Windows\Temp`, edite esta linha:
  ```powershell
  Limpar-Temp "C:\Windows\Temp" ".log"
  ```

Por exemplo, para ignorar arquivos `.bak`, você pode alterar o argumento para `".bak"`.

---

## 🚨 **Avisos Importantes**
- Certifique-se de que você está executando o PowerShell como **Administrador**.
- O script **ignora arquivos importantes** como `.log` e `.tmp`, mas sempre revise a lista de exclusão antes de executar.
- O comando de **Limpeza de Disco** pode demorar alguns minutos para ser concluído, dependendo do tamanho do disco.

---

## ❓ **Perguntas Frequentes**

### 1. Por que preciso rodar como Administrador?
Algumas pastas e arquivos são protegidos pelo sistema operacional. Executar como Administrador garante que o script tenha permissão para acessar e limpar esses arquivos.

### 2. Este script pode causar algum dano ao meu sistema?
Não. O script foi projetado para **evitar a exclusão de arquivos importantes**. Ele limpa apenas arquivos temporários que normalmente podem ser removidos com segurança.

### 3. O que é a Limpeza de Disco?
A **Limpeza de Disco** é uma ferramenta do Windows que remove arquivos desnecessários, como arquivos de sistema temporários, arquivos da Lixeira e outros arquivos que podem ocupar espaço no disco.

---

## 🤔 **Dúvidas ou Problemas?**
Se você encontrar algum problema ao executar o script, verifique os seguintes pontos:
- O PowerShell está sendo executado como **Administrador**?
- O script foi salvo com a extensão **`.ps1`**?
- Você digitou o caminho correto do arquivo no PowerShell?

Caso ainda tenha dúvidas, procure um especialista em TI para auxiliá-lo.

---

## 🎉 **Pronto!**
Agora você pode manter seu sistema Windows mais limpo e eficiente com este script automatizado. 😊

