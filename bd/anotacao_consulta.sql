-- SQLBook: Code

-- Criar o banco de dados
CREATE DATABASE consulta_psicologica;

-- Excluir o banco de dados
DROP DATABASE consulta_psicologica;

-- Usar o banco de dados
USE consulta_psicologica;

CREATE TABLE anotacao_consulta(
    IdAnotCon INT PRIMARY KEY AUTO_INCREMENT,
    tituloAnotCon VARCHAR(200) NOT NULL,
    descAnotCon VARCHAR(200) NOT NULL
);

-- Alterar a tabela assunto adicionando as chaves estrangeiras

ALTER TABLE anotacao_consulta
    ADD fk_IdAgendCon INT NOT NULL,
    ADD FOREIGN KEY (fk_IdAgendCon) REFERENCES agendamento_consulta(IdAgendCon);

-- Inserir dados na tabela assunto

INSERT INTO anotacao_consulta(descAnotCon, tituloAnotCon, fk_IdAgendCon) VALUES ('Assunto 2', 'Titulo', 3);

-- Exibir todos dados na tabela assunto

SELECT IdAnotCon, tituloAnotCon, descAnotCon, DATE_FORMAT(dataAgendCon, '%d/%m/%Y') AS dataAgendCon, 
       TIME_FORMAT(horarioAgendCon, '%H:%m') AS horarioAgendCon, nomeCliente
FROM anotacao_consulta AS an
INNER JOIN agendamento_consulta AS cs
ON an.fk_IdAgendCon = cs.IdAgendCon
INNER JOIN cliente as cl 
ON cs.fk_IdCliente = cl.IdCliente;

-- Atualizar dados da tabela assunto

UPDATE anotacao_consulta SET descAnotCon='Assunto 2' WHERE IdAnotCon=1;

-- Excluir dados da tabela assunto

DELETE FROM anotacao_consulta WHERE IdAnotCon=1;

-- Campo de pesquisa
SELECT IdAnotCon, tituloAnotCon, descAnotCon, DATE_FORMAT(dataAgendCon, '%d/%m/%Y') AS dataAgendCon, 
       TIME_FORMAT(horarioAgendCon, '%H:%m') AS horarioAgendCon, nomeCliente
FROM anotacao_consulta AS an
INNER JOIN agendamento_consulta AS cs
ON an.fk_IdAgendCon = cs.IdAgendCon
INNER JOIN cliente as cl 
ON cs.fk_IdCliente = cl.IdCliente
WHERE nomeCliente like '%Nicolas%' AND
tituloAnotCon like '%Titulo%';
