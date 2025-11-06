## 🧠 Descrição do Projeto
O **Cabine Digital** é um sistema proposto para modernizar a experiência de eventos acadêmicos na **UFMS**. Ele permite que os participantes tirem fotos e respondam a questionários interativos, enquanto administradores e organizadores gerenciam molduras e eventos por meio de uma interface web.

O projeto tem como objetivo representar a **arquitetura do sistema Cabine Digital** utilizando o **C4 Model**, abordando os níveis de:
1. **Contexto** – visão geral do sistema e seus atores.
2. **Containers** – visão dos principais componentes internos do sistema.
3. **Implantação** – visão de como os componentes são hospedados e distribuídos.

---

## 🧩 Modelagem (C4 Model)

### 1️⃣ Diagrama de Contexto
Apresenta uma visão geral do sistema **Cabine Digital**, mostrando os usuários e os sistemas externos envolvidos.

**Atores principais:**
- **Administrador:** gerencia usuários, molduras e eventos.
- **Organizador:** cria e gerencia eventos.
- **Participante:** utiliza a cabine para tirar fotos e preencher o questionário.
- **Sistema Externo:** Passaporte UFMS (usado para autenticação institucional).

---

### 2️⃣ Diagrama de Containers
Mostra os principais componentes internos que compõem o sistema.

| Container | Descrição |
|------------|------------|
| Aplicação Web | Interface usada por administradores e organizadores para gerenciar eventos e molduras. |
| Aplicação Mobile | Interface usada pelos participantes para tirar fotos e responder questionários. |
| API Backend | Responsável pela lógica de negócio e pela comunicação entre os frontends e o banco de dados. |
| Banco de Dados | Armazena informações sobre usuários, eventos, molduras e registros de participação. |

---

### 3️⃣ Diagrama de Implantação
Mostra o ambiente físico e lógico de hospedagem do sistema.

**Componentes principais:**
- **Servidor UFMS (Agetic):** onde ficam hospedados a API Backend e o Banco de Dados.  
- **Navegador Web:** acessado por administradores e organizadores.  
- **Dispositivo Mobile:** usado por participantes durante os eventos.  

---

## 🧾 Como visualizar os diagramas

Os diagramas foram desenvolvidos no **Structurizr DSL** e estão disponíveis no workspace:

🔗 [Acessar Diagramas no Structurizr](https://structurizr.com/workspace/107914)

### Diagramas disponíveis:
- **Contexto**
- **Containers**
- **Implantação**
