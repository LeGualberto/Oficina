
# Projeto Oficina - Banco de Dados Relacional

Este projeto foi desenvolvido como parte do **curso "Formação: Modelagem de Banco de Dados" da DIO em parceria com a Heineken**. O objetivo é aplicar os conceitos de modelagem de dados, desde o esquema conceitual até a implementação prática em SQL.

## 📌 Objetivo

Criar um sistema de banco de dados para gerenciar clientes, veículos, ordens de serviço, equipes, mecânicos, serviços e peças de uma oficina.

## 🧱 Estrutura do Projeto

- **Modelo ER**: Diagrama entidade-relacionamento com entidades, atributos e relacionamentos.
- **Esquema Lógico**: Conversão do modelo ER para o modelo relacional.
- **Script SQL**: Criação das tabelas, inserção de dados de teste e consultas SQL.
- **Consultas SQL**: Exemplos de queries com:
  - `SELECT`, `WHERE`, `ORDER BY`, `HAVING`
  - Atributos derivados com `DATEDIFF`
  - Junções entre tabelas com `JOIN`

## 🗃️ Tabelas Criadas

- `CLIENTE`
- `VEICULO`
- `EQUIPE`
- `MECANICO`
- `ORDEM_SERVICO`
- `SERVICO`
- `PECA`
- `OS_SERVICO`
- `OS_PECA`

## 🧪 Dados de Teste

O script inclui dados fictícios para simular o funcionamento do sistema e testar as consultas.

## 📊 Exemplos de Consultas

- Listar todos os clientes
- Buscar ordens de serviço concluídas
- Calcular tempo de execução de ordens
- Agrupar ordens por equipe
- Relacionar clientes com veículos
- Relacionar ordens com serviços e peças

## 🚀 Como Executar

1. Instale o MySQL ou use uma ferramenta como MySQL Workbench.
2. Importe o arquivo `projeto_oficina.sql`.
3. Execute as queries para testar o banco de dados.

## 📁 Arquivo Principal

- `projeto_oficina.sql`

