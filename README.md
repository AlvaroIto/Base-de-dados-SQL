# Curso Básico de SQL com Docker e DBeaver

Este repositório contém o material do meu curso básico de SQL, onde aprendi como trabalhar com banco de dados usando SQL, Docker e DBeaver. O curso cobre os conceitos básicos de manipulação de dados e criação de tabelas, incluindo operações como `INSERT`, `SELECT`, `UPDATE`, `DELETE`, `JOIN`, funções agregadas, e muito mais.

## 🚀 Tecnologias Utilizadas

- **SQL**: Linguagem de consulta estruturada para manipulação de banco de dados.
- **Docker**: Utilizado para criar e gerenciar containers de banco de dados, facilitando o ambiente de desenvolvimento.
- **DBeaver**: Ferramenta gráfica para interagir com bancos de dados e executar consultas SQL.

## 📋 Conteúdo do Curso

### 1. **Configuração do Ambiente**
   - Configuração do Docker para rodar containers de banco de dados.
   - Instalação e configuração do DBeaver para se conectar ao banco de dados.

### 2. **Manipulação de Tabelas**
   - Como criar tabelas e adicionar colunas.
   - Definição de tipos de dados para cada coluna.

### 3. **Operações Básicas em SQL**
   - **INSERT**: Como adicionar dados em tabelas.
   - **SELECT**: Como realizar consultas para visualizar dados.
   - **WHERE**: Filtrando dados com condições específicas.
   - **UPDATE**: Atualizando dados existentes nas tabelas.
   - **DELETE**: Removendo dados de uma tabela.

### 4. **Funções e Operações Avançadas**
   - **Joins**: Combinação de tabelas para extrair dados relacionando diferentes fontes.
   - **RAND()**: Gerar valores aleatórios em consultas.
   - **ROUND()**: Arredondamento de valores numéricos.
   - **GROUP BY**: Agrupamento de dados para realizar operações agregadas como `COUNT`, `SUM`, `AVG`, etc.

## 🛠️ Como Rodar o Projeto

1. **Clone o repositório**:
   ```bash
   git clone https://github.com/seu-usuario/nome-do-repositorio.git
   ```
2. **Configure o Docker**: Certifique-se de ter o Docker instalado em sua máquina. Para rodar o banco de dados no Docker, basta usar o seguinte comando:
   ```bash
   docker run --name nome-do-banco -e MYSQL_ROOT_PASSWORD=sua-senha -p 3306:3306 -d mysql:latest
   ```
3. **Conecte ao banco de dados no DBeaver**: Abra o DBeaver e crie uma nova conexão com o banco de dados utilizando as credenciais configuradas no Docker.
4. **Execute os Exemplos de SQL**: Com a conexão estabelecida, você pode começar a rodar os exemplos de SQL presentes neste repositório.


