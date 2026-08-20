# 🛠️ OpenCode Tools Repository

Este repositório contém os scripts, executáveis e binários locais que expandem as capacidades do assistente OpenCode através do Model Context Protocol (MCP).

Enquanto o repositório [.agents](https://github.com/gersonfribeiro-dev-configurations/.agents) define o **comportamento** (a mente) e o [.config/opencode](https://github.com/gersonfribeiro-dev-configurations/.opencode) define a **conectividade** (os nervos), este repositório fornece a **capacidade de execução** (os braços).

## 📦 Componentes

### 1. Pencil MCP (`pencil-mcp.bat`)

Este é um wrapper de inicialização para a integração com o `pen.dev`.

- **Função:** Garante que o servidor MCP do Pencil seja iniciado com os parâmetros corretos (`--app desktop` e `--agent openCodeCLI`).
- **Uso:** É chamado automaticamente pelo OpenCode via configuração no `opencode.json`.

<!--
### 2. Scripts de Automação
(Espaço reservado para novos scripts de shell, python ou batch que automatizem tarefas repetitivas do workspace).
-->
---

## 🚀 Como Instalar e Configurar

Para que as ferramentas deste repositório funcionem, siga estes passos:

1. **Clone o Repositório:**
   Clone este repositório na pasta `~/.tools/` (ou o caminho configurado no seu `opencode.json`).

2. **Configure o Caminho no OpenCode:**
   No seu arquivo `opencode.json`, aponte o comando do MCP para o script correspondente:

   ```json
   "pencil": {
     "type": "local",
     "command": ["~/.tools/pencil-mcp.bat", "--app", "desktop", "--agent", "openCodeCLI"],
     "enabled": true
   }
   ```

3. **Permissões de Execução:**
   No Windows, certifique-se de que os arquivos `.bat` tenham permissão de execução. No Linux/Mac, utilize `chmod +x` nos scripts.

---

## 🛡️ Segurança

As ferramentas locais têm acesso ao seu sistema de arquivos e terminal.

- **Auditoria:** Sempre revise o conteúdo de scripts `.bat` ou `.sh` antes de executá-los.
- **Isolamento:** Sempre que possível, utilize MCPs que rodam dentro de containers (via `MCP_DOCKER`) para isolar a execução da IA do seu sistema host.

## 🔗 Links Úteis

- [Documentação de Configuração Global](https://github.com/gersonfribeiro-dev-configurations/.config/opencode)
- [Diretrizes de Agentes e Skills](https://github.com/gersonfribeiro-dev-configurations/.agents)
