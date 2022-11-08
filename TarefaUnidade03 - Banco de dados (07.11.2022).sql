CREATE TABLE GeneroLivro (
IDGeneroLivro INTEGER PRIMARY KEY,
Genero VARCHAR(20) NOT NULL
)

CREATE TABLE Livro (
IDLivro INTEGER PRIMARY KEY,
Nome VARCHAR(50) NOT NULL,
CONSTRAINT FK_IDGeneroLivro FOREIGN KEY (IDLivro) REFERENCES GeneroLivro (IDGeneroLivro)
)

CREATE TABLE Periodo (
IDPeriodo INTEGER PRIMARY KEY,
Nome VARCHAR(15) NOT NULL
)

CREATE TABLE TipoCurso (
IDTipo INTEGER PRIMARY KEY,
Nome VARCHAR(20) NOT NULL
)

CREATE TABLE Curso (
IDCurso INTEGER PRIMARY KEY,
Nome VARCHAR(30) NOT NULL,
CONSTRAINT FK_IDPeriodo FOREIGN KEY (IDCurso) REFERENCES Periodo (IDPeriodo),
CONSTRAINT FK_IDTipo FOREIGN KEY (IDCurso) REFERENCES TipoCurso (IDTipo) 
)

CREATE TABLE Funcionario (
IDFuncionario INTEGER PRIMARY KEY,
Nome VARCHAR(50) NOT NULL
)

CREATE TABLE Aluno (
IDAluno INTEGER PRIMARY KEY,
Nome VARCHAR(50) NOT NULL,
RA TINYINT NOT NULL,
CPF TINYINT NOT NULL,
CONSTRAINT FK_IDCurso FOREIGN KEY (IDAluno) REFERENCES Curso (IDCurso)
)

CREATE TABLE Emprestimo (
IDEmprestimo INTEGER PRIMARY KEY,
CONSTRAINT FK_IDAluno FOREIGN KEY (IDEmprestimo) REFERENCES Aluno (IDAluno),
CONSTRAINT FK_IDLivro FOREIGN KEY (IDEmprestimo) REFERENCES Livro (IDLivro),
DataRetirada DATE NOT NULL,
DataDevolucaoEsperada DATE NOT NULL,
DataDevolucaoEfetiva DATE NOT NULL,
CONSTRAINT FK_IDFuncionario FOREIGN KEY (IDEmprestimo) REFERENCES Funcionario (IDFuncionario) 
)