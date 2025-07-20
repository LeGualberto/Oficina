
-- 1. CRIAÇÃO DAS TABELAS

CREATE TABLE CLIENTE (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nm_cliente VARCHAR(100),
    nr_cliente VARCHAR(20),
    ds_endereco VARCHAR(255),
    ds_email VARCHAR(100),
    dt_cadastro DATE
);

CREATE TABLE VEICULO (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    ds_placa VARCHAR(20),
    nm_modelo VARCHAR(50),
    nm_marca VARCHAR(50),
    nr_ano INT,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
);

CREATE TABLE EQUIPE (
    id_equipe INT AUTO_INCREMENT PRIMARY KEY,
    nm_equipe VARCHAR(100),
    ds_especialidade VARCHAR(100)
);

CREATE TABLE ORDEM_SERVICO (
    id_os INT AUTO_INCREMENT PRIMARY KEY,
    dt_emissao DATE,
    dt_conclusao DATE,
    ds_status VARCHAR(50),
    vl_total DECIMAL(10,2),
    id_veiculo INT,
    id_equipe INT,
    FOREIGN KEY (id_veiculo) REFERENCES VEICULO(id_veiculo),
    FOREIGN KEY (id_equipe) REFERENCES EQUIPE(id_equipe)
);

CREATE TABLE MECANICO (
    id_mecanico INT AUTO_INCREMENT PRIMARY KEY,
    nm_mecanico VARCHAR(100),
    ds_endereco VARCHAR(255),
    ds_especialidade VARCHAR(100),
    id_equipe INT,
    FOREIGN KEY (id_equipe) REFERENCES EQUIPE(id_equipe)
);

CREATE TABLE SERVICO (
    id_servico INT AUTO_INCREMENT PRIMARY KEY,
    ds_servico VARCHAR(255),
    vl_mobra DECIMAL(10,2)
);

CREATE TABLE PECA (
    id_peca INT AUTO_INCREMENT PRIMARY KEY,
    nm_peca VARCHAR(100),
    vl_unitario DECIMAL(10,2),
    qt_estoque INT
);

CREATE TABLE OS_SERVICO (
    id_os INT,
    id_servico INT,
    ds_servico VARCHAR(255),
    vl_mobra DECIMAL(10,2),
    PRIMARY KEY (id_os, id_servico),
    FOREIGN KEY (id_os) REFERENCES ORDEM_SERVICO(id_os),
    FOREIGN KEY (id_servico) REFERENCES SERVICO(id_servico)
);

CREATE TABLE OS_PECA (
    id_os INT,
    id_peca INT,
    qt_peca INT,
    PRIMARY KEY (id_os, id_peca),
    FOREIGN KEY (id_os) REFERENCES ORDEM_SERVICO(id_os),
    FOREIGN KEY (id_peca) REFERENCES PECA(id_peca)
);

-- 2. INSERÇÃO DE DADOS DE TESTE

INSERT INTO CLIENTE (nm_cliente, nr_cliente, ds_endereco, ds_email, dt_cadastro)
VALUES ('João Silva', '11999999999', 'Rua A, 123', 'joao@email.com', '2023-01-10');

INSERT INTO VEICULO (ds_placa, nm_modelo, nm_marca, nr_ano, id_cliente)
VALUES ('ABC1234', 'Civic', 'Honda', 2020, 1);

INSERT INTO EQUIPE (nm_equipe, ds_especialidade)
VALUES ('Equipe Alfa', 'Motor');

INSERT INTO ORDEM_SERVICO (dt_emissao, dt_conclusao, ds_status, vl_total, id_veiculo, id_equipe)
VALUES ('2023-03-01', '2023-03-05', 'Concluído', 1500.00, 1, 1);

INSERT INTO MECANICO (nm_mecanico, ds_endereco, ds_especialidade, id_equipe)
VALUES ('Carlos Souza', 'Rua B, 456', 'Motor', 1);

INSERT INTO SERVICO (ds_servico, vl_mobra)
VALUES ('Troca de óleo', 100.00);

INSERT INTO PECA (nm_peca, vl_unitario, qt_estoque)
VALUES ('Filtro de óleo', 30.00, 50);

INSERT INTO OS_SERVICO (id_os, id_servico, ds_servico, vl_mobra)
VALUES (1, 1, 'Troca de óleo', 100.00);

INSERT INTO OS_PECA (id_os, id_peca, qt_peca)
VALUES (1, 1, 1);

-- 3. CONSULTAS SQL COMPLEXAS

-- a) Recuperação simples
SELECT * FROM CLIENTE;

-- b) Filtro com WHERE
SELECT * FROM ORDEM_SERVICO WHERE ds_status = 'Concluído';

-- c) Atributo derivado: tempo de execução da ordem de serviço
SELECT id_os, DATEDIFF(dt_conclusao, dt_emissao) AS dias_execucao FROM ORDEM_SERVICO;

-- d) Ordenação por valor total
SELECT * FROM ORDEM_SERVICO ORDER BY vl_total DESC;

-- e) Agrupamento com HAVING: total de ordens por equipe com mais de 0 ordens
SELECT id_equipe, COUNT(*) AS total_ordens
FROM ORDEM_SERVICO
GROUP BY id_equipe
HAVING COUNT(*) > 0;

-- f) Junção entre tabelas: cliente e veículo
SELECT C.nm_cliente, V.ds_placa, V.nm_modelo
FROM CLIENTE C
JOIN VEICULO V ON C.id_cliente = V.id_cliente;

-- g) Junção entre ordem de serviço, serviço e peça
SELECT OS.id_os, S.ds_servico, P.nm_peca, OP.qt_peca
FROM ORDEM_SERVICO OS
JOIN OS_SERVICO OSS ON OS.id_os = OSS.id_os
JOIN SERVICO S ON OSS.id_servico = S.id_servico
JOIN OS_PECA OP ON OS.id_os = OP.id_os
JOIN PECA P ON OP.id_peca = P.id_peca;
