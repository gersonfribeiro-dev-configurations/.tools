# 🛠️ Ferramentas de Desenvolvimento (Global Tools)

Este diretório centraliza binários e scripts de utilidade utilizados em múltiplos projetos e configurações de ambiente do usuário.

## 🚀 Configuração do `direnv`

O `direnv` é uma ferramenta essencial para o ecossistema de desenvolvimento, permitindo que variáveis de ambiente sejam carregadas automaticamente ao entrar em diretórios específicos (via arquivos `.envrc`).

### 1. Instalação do Binário

Se você ainda não possui o `direnv` instalado:

- **Windows (via Winget)**:

  ```powershell
  winget install direnv
  ```

- **Instalação Manual**:
  1. Baixe o binário `direnv-windows-amd64.exe` no [GitHub Releases](https://github.com/direnv/direnv/releases).
  2. Renomeie para `direnv.exe`.
  3. Mova o arquivo para `C:\Users\Gerson Ribeiro\.tools\`.
  4. Adicione `C:\Users\Gerson Ribeiro\.tools` ao seu **PATH do Sistema**.

### 2. Ativação do Hook (Git Bash)

Para que o `direnv` funcione, ele precisa de um "gancho" no seu shell. Adicione a seguinte linha ao seu arquivo `~/.bashrc` (ou `C:\Users\Gerson Ribeiro\.bashrc`):

```bash
eval "$(direnv hook bash)"
```

*Após adicionar, execute `source ~/.bashrc` ou reinicie o terminal.*

### 3. O conceito do `.bathrc`

Para manter a organização, utilizamos a convenção `.bathrc`. Embora o Bash utilize o `.bashrc`, o padrão `.bathrc` neste ambiente serve como um repositório de scripts e configurações globais que podem ser versionados e compartilhados entre diferentes máquinas.

- **Responsabilidade**: Centralizar hooks de ambiente, aliases globais e scripts de setup.
- **Como carregar**: No seu `.bashrc` global, você pode referenciar as configurações do diretório `.bathrc` utilizando o comando `source` ou `.` (dot operator).

### 4. Fluxo de Trabalho com `.envrc`

Ao entrar em um projeto que possua um arquivo `.envrc`:

1. O `direnv` detectará o arquivo.
2. Por segurança, ele não carregará as variáveis automaticamente na primeira vez.
3. Execute o comando:

   ```bash
   direnv allow
   ```

4. Agora, todas as variáveis definidas no `.envrc` estão disponíveis para o seu terminal e para as ferramentas que o utilizam (como o opencode).

---
**Dica**: Mantenha seus tokens secretos em variáveis de ambiente do sistema e referencie-as no `.envrc` para evitar a exposição de senhas em arquivos de texto.
