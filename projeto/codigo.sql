-- Comandos DDL (Data Definition Language)

-- Verifica se a tabela Contato já existe antes de criar
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Contato')
BEGIN
    CREATE TABLE Contato (
        idContato INT PRIMARY KEY,
        Telefone VARCHAR(20),
        Celular VARCHAR(20),
        Email VARCHAR(100)
    );
    PRINT 'Tabela Contato criada com sucesso.';
END
ELSE
BEGIN
    PRINT 'A tabela Contato já existe.';
END;

-- Verifica se a tabela Endereco já existe antes de criar
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Endereco')
BEGIN
    CREATE TABLE Endereco (
        idEndereco INT PRIMARY KEY,
        Cidade VARCHAR(100),
        Rua VARCHAR(100),
        Email VARCHAR(100)
    );
    PRINT 'Tabela Endereco criada com sucesso.';
END
ELSE
BEGIN
    PRINT 'A tabela Endereco já existe.';
END;

-- Verifica se a tabela EnderecoContato já existe antes de criar
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'EnderecoContato')
BEGIN
    CREATE TABLE EnderecoContato (
        idContato INT,
        idEndereco INT,
        PRIMARY KEY (idContato, idEndereco),
        FOREIGN KEY (idContato) REFERENCES Contato(idContato),
        FOREIGN KEY (idEndereco) REFERENCES Endereco(idEndereco)
    );
    PRINT 'Tabela EnderecoContato criada com sucesso.';
END
ELSE
BEGIN
    PRINT 'A tabela EnderecoContato já existe.';
END;

-- Verifica se a tabela Pessoa já existe antes de criar
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Pessoa')
BEGIN
    CREATE TABLE Pessoa (
        idPessoa INT PRIMARY KEY,
        nome VARCHAR(100),
        cpf VARCHAR(14),
        idade INT,
        idEndereco INT,
        idContato INT,
        FOREIGN KEY (idEndereco) REFERENCES Endereco(idEndereco),
        FOREIGN KEY (idContato) REFERENCES Contato(idContato)
    );
    PRINT 'Tabela Pessoa criada com sucesso.';
END
ELSE
BEGIN
    PRINT 'A tabela Pessoa já existe.';
END;

-- Verifica se a tabela Formado já existe antes de criar
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Formado')
BEGIN
    CREATE TABLE Formado (
        idFormado INT PRIMARY KEY,
        idPessoa INT,
        ativo BOOLEAN,
        FOREIGN KEY (idPessoa) REFERENCES Pessoa(idPessoa)
    );
    PRINT 'Tabela Formado criada com sucesso.';
END
ELSE
BEGIN
    PRINT 'A tabela Formado já existe.';
END;

-- Verifica se a tabela Departamento já existe antes de criar
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Departamento')
BEGIN
    CREATE TABLE Departamento (
        NomeDepartamento VARCHAR(100) PRIMARY KEY,
        Numero INT,
        Coordenador VARCHAR(100)
    );
    PRINT 'Tabela Departamento criada com sucesso.';
END
ELSE
BEGIN
    PRINT 'A tabela Departamento já existe.';
END;

-- Verifica se a tabela Curso já existe antes de criar
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Curso')
BEGIN
    CREATE TABLE Curso (
        nomeCurso VARCHAR(100) PRIMARY KEY,
        NomeDepartamento VARCHAR(100),
        FOREIGN KEY (NomeDepartamento) REFERENCES Departamento(NomeDepartamento)
    );
    PRINT 'Tabela Curso criada com sucesso.';
END
ELSE
BEGIN
    PRINT 'A tabela Curso já existe.';
END;

-- Verifica se a tabela Disciplina já existe antes de criar
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Disciplina')
BEGIN
    CREATE TABLE Disciplina (
        idDisciplina INT PRIMARY KEY,
        nomeDisciplina VARCHAR(100),
        diciplinaCurso VARCHAR(100)
    );
    PRINT 'Tabela Disciplina criada com sucesso.';
END
ELSE
BEGIN
    PRINT 'A tabela Disciplina já existe.';
END;

-- Verifica se a tabela DisciplinaCurso já existe antes de criar
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'DisciplinaCurso')
BEGIN
    CREATE TABLE DisciplinaCurso (
        idDisciplina INT,
        nomeCurso VARCHAR(100),
        PRIMARY KEY (idDisciplina, nomeCurso),
        FOREIGN KEY (idDisciplina) REFERENCES Disciplina(idDisciplina),
        FOREIGN KEY (nomeCurso) REFERENCES Curso(nomeCurso)
    );
    PRINT 'Tabela DisciplinaCurso criada com sucesso.';
END
ELSE
BEGIN
    PRINT 'A tabela DisciplinaCurso já existe.';
END;

-- Comandos DML (Data Manipulation Language)

-- Inserir dados na tabela Contato
INSERT INTO Contato (idContato, Telefone, Celular, Email)
VALUES
    (1, '123456789', '987654321', 'contato1@example.com'),
    (2, '987654321', '123456789', 'contato2@example.com');

-- Inserir dados na tabela Endereco
INSERT INTO Endereco (idEndereco, Cidade, Rua, Email)
VALUES
    (1, 'Cidade A', 'Rua 1', 'endereco1@example.com'),
    (2, 'Cidade B', 'Rua 2', 'endereco2@example.com');

-- Inserir dados na tabela EnderecoContato
INSERT INTO EnderecoContato (idContato, idEndereco)
VALUES
    (1, 1),
    (2, 2);

-- Inserir dados na tabela Pessoa
INSERT INTO Pessoa (idPessoa, nome, cpf, idade, idEndereco, idContato)
VALUES
    (1, 'Fulano', '123.456.789-00', 30, 1, 1),
    (2, 'Ciclano', '987.654.321-00', 25, 2, 2);

-- Inserir dados na tabela Formado
INSERT INTO Formado (idFormado, idPessoa, ativo)
VALUES
    (1, 1, 1),
    (2, 2, 0);

-- Inserir dados na tabela Departamento
INSERT INTO Departamento (NomeDepartamento, Numero, Coordenador)
VALUES
    ('Departamento A', 101, 'Coordenador A'),
    ('Departamento B', 102, 'Coordenador B');

-- Inserir dados na tabela Curso
INSERT INTO Curso (nomeCurso, NomeDepartamento)
VALUES
    ('Curso A', 'Departamento A'),
    ('Curso B', 'Departamento B');

-- Inserir dados na tabela Disciplina
INSERT INTO Disciplina (idDisciplina, nomeDisciplina, diciplinaCurso)
VALUES
    (1, 'Disciplina A', 'Curso A'),
    (2, 'Disciplina B', 'Curso B');

-- Inserir dados na tabela DisciplinaCurso
INSERT INTO DisciplinaCurso (idDisciplina, nomeCurso)
VALUES
    (1, 'Curso A'),
    (2, 'Curso B');

-- Comandos DQL (Data Query Language) com Provas de Conceito

-- Exemplo de consulta: Dado o RA ou o Nome do Aluno, buscar no BD todos os demais dados do aluno.
-- Query:
SELECT * FROM Pessoa WHERE nome = 'Nome do Aluno' OR RA = 'RA do Aluno';
-- Prova de Conceito:
-- Retorna todos os dados da pessoa cujo nome é 'Nome do Aluno' ou cujo RA é 'RA do Aluno'.

-- Exemplo de consulta: Dado o nome de um departamento, exibir o nome de todos os cursos associados a ele.
-- Query:
SELECT nomeCurso FROM Curso WHERE NomeDepartamento = 'Nome do Departamento';
-- Prova de Conceito:
-- Retorna o nome de todos os cursos associados ao departamento cujo nome é 'Nome do Departamento'.

-- Exemplo de consulta: Dado o nome de uma disciplina, exibir a qual ou quais cursos ela pertence.
-- Query:
SELECT nomeCurso FROM DisciplinaCurso WHERE idDisciplina = (SELECT idDisciplina FROM Disciplina WHERE nomeDisciplina = 'Nome da Disciplina');
-- Prova de Conceito:
-- Retorna o nome do curso ou cursos aos quais a disciplina cujo nome é 'Nome da Disciplina' pertence.

-- Exemplo de consulta: Dado o CPF de um aluno, exibir quais disciplinas ele está cursando.
-- Query:
SELECT nomeDisciplina FROM Disciplina WHERE idDisciplina IN (SELECT idDisciplina FROM DisciplinaCurso WHERE nomeCurso IN (SELECT nomeCurso FROM Curso WHERE idPessoa = (SELECT idPessoa FROM Pessoa WHERE cpf = 'CPF do Aluno')));
-- Prova de Conceito:
-- Retorna o nome das disciplinas que o aluno com o CPF 'CPF do Aluno' está cursando.

-- Exemplo de consulta: Filtrar todos os alunos matriculados em um determinado curso.
-- Query:
SELECT * FROM Pessoa WHERE idPessoa IN (SELECT idPessoa FROM Curso WHERE nomeCurso = 'Nome do Curso');
-- Prova de Conceito:
-- Retorna todos os dados dos alunos matriculados no curso cujo nome é 'Nome do Curso'.

-- Exemplo de consulta: Filtrar todos os alunos matriculados em determinada disciplina.
-- Query:
SELECT * FROM Pessoa WHERE idPessoa IN (SELECT idPessoa FROM DisciplinaCurso WHERE idDisciplina = (SELECT idDisciplina FROM Disciplina WHERE nomeDisciplina = 'Nome da Disciplina'));
-- Prova de Conceito:
-- Retorna todos os dados dos alunos matriculados na disciplina cujo nome é 'Nome da Disciplina'.

-- Exemplo de consulta: Filtrar alunos formados.
-- Query:
SELECT * FROM Pessoa WHERE idPessoa IN (SELECT idPessoa FROM Formado);
-- Prova de Conceito:
-- Retorna todos os dados dos alunos que se formaram.

-- Exemplo de consulta: Filtrar alunos ativos.
-- Query:
SELECT * FROM Pessoa WHERE idPessoa IN (SELECT idPessoa FROM Formado WHERE ativo = 1);
-- Prova de Conceito:
-- Retorna todos os dados dos alunos ativos.

-- Exemplo de consulta: Apresentar a quantidade de alunos ativos por curso.
-- Query:
SELECT nomeCurso, COUNT(*) AS Quantidade FROM Pessoa WHERE idPessoa IN (SELECT idPessoa FROM Formado WHERE ativo = 1) GROUP BY nomeCurso;
-- Prova de Conceito:
-- Retorna o nome do curso e a quantidade de alunos ativos matriculados nele.

-- Exemplo de consulta: Apresentar a quantidade de alunos ativos por disciplina.
-- Query:
SELECT nomeDisciplina, COUNT(*) AS Quantidade FROM Disciplina WHERE idDisciplina IN (SELECT idDisciplina FROM DisciplinaCurso WHERE nomeCurso IN (SELECT nomeCurso FROM Curso WHERE idPessoa IN (SELECT idPessoa FROM Formado WHERE ativo = 1))) GROUP BY nomeDisciplina;
-- Prova de Conceito:
-- Retorna o nome da disciplina e a quantidade de alunos ativos matriculados nela.
