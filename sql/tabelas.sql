create table alunos (
    id_aluno serial,
    nome varchar(50) not null,
    rating_atual int not null,
    primary key(id_aluno)
);

create table faixas_rating (
    id_faixa serial,
    nome varchar(20),
    rating_minimo int,
    rating_maximo int,
    primary key(id_faixa)
);

create table aberturas (
    id_abertura serial,
    categoria varchar(20),
    nome varchar(100),
    cor varchar(20),
    movimentos_iniciais varchar(100),
    primary key(id_abertura)
);

create table exercicios (
    id_exercicio serial,
    dificuldade int,
    enunciado varchar(200),
    solucao varchar(200),
    primary key(id_exercicio)
);

create table temas (
    id_tema serial,
    nome varchar(50),
    fase varchar(20),
    descricao varchar(200),
    primary key(id_tema)
);

create table faixas_aberturas (
    id_abertura int not null references aberturas(id_abertura),
    id_faixa int not null references faixas_rating(id_faixa),
    primary key(id_abertura, id_faixa)
);

create table faixas_exercicios (
    id_exercicio int not null references exercicios(id_exercicio),
    id_faixa int not null references faixas_rating(id_faixa),
    primary key(id_exercicio, id_faixa)
);

create table exercicios_temas (
    id_exercicio int not null references exercicios(id_exercicio),
    id_tema int not null references temas(id_tema),
    primary key(id_exercicio, id_tema)
);