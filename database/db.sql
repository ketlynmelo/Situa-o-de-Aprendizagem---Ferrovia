CREATE DATABASE situação_aprendizagem

USE situação_aprendizagem;


CREATE TABLE trem (
    id_Trem INT NOT NULL AUTO_INCREMENT,
    nome_trem VARCHAR(100) NOT NULL,
    modelo VARCHAR(100) NOT NULL,
    carga VARCHAR(45) NOT NULL,
    velocidade VARCHAR(45) NOT NULL,

    PRIMARY KEY (id_Trem),

    UNIQUE (nome_trem),
    UNIQUE (modelo)
);


CREATE TABLE sensor (
    id_Sensor INT NOT NULL AUTO_INCREMENT,
    nome_sensor VARCHAR(45) NOT NULL,
    localização VARCHAR(45) NOT NULL,
    tipo_dado VARCHAR(45) NOT NULL,
    Trem_id_Trem INT NOT NULL,

    PRIMARY KEY (id_Sensor),

    UNIQUE (nome_sensor),
    UNIQUE (localização),
    UNIQUE (tipo_dado),

    FOREIGN KEY (Trem_id_Trem)
        REFERENCES trem(id_Trem)
);



CREATE TABLE dados_sensor (
    id_dado INT NOT NULL AUTO_INCREMENT,
    valor DECIMAL(10,2) NOT NULL,
    data_hora DATETIME NOT NULL,
    Sensor_id_Sensor INT NOT NULL,

    PRIMARY KEY (id_dado),

    FOREIGN KEY (Sensor_id_Sensor)
        REFERENCES sensor(id_Sensor)
);



CREATE TABLE perfil (
    id_Perfil INT NOT NULL AUTO_INCREMENT,
    nome_Perfil VARCHAR(100) NOT NULL,

    PRIMARY KEY (id_Perfil),

    UNIQUE (nome_Perfil)
);



CREATE TABLE relatorio (
    id_Relatorio INT NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    data_geracao DATETIME NOT NULL,

    PRIMARY KEY (id_Relatorio)
);


CREATE TABLE relatorio_has_dados_sensor (
    Relatorio_id_Relatorio INT NOT NULL,
    Dados_Sensor_id_dado INT NOT NULL,

    PRIMARY KEY (
        Relatorio_id_Relatorio,
        Dados_Sensor_id_dado
    ),

    FOREIGN KEY (Relatorio_id_Relatorio)
        REFERENCES relatorio(id_Relatorio),

    FOREIGN KEY (Dados_Sensor_id_dado)
        REFERENCES dados_sensor(id_dado)
);


CREATE TABLE rota (
    id_Rota INT NOT NULL,
    nome_rota VARCHAR(45) NOT NULL,
    horario_rota VARCHAR(45) NOT NULL,
    ponto_inicial VARCHAR(45) NOT NULL,
    ponto_final VARCHAR(45) NOT NULL,

    PRIMARY KEY (id_Rota)
);



CREATE TABLE trilho (
    id_Trilho INT NOT NULL,
    id_rota INT NOT NULL,
    descricao_trilho VARCHAR(45),

    PRIMARY KEY (id_Trilho)
);



CREATE TABLE rota_has_trilho (
    Rota_id_Rota INT NOT NULL,
    Trilho_id_Trilho INT NOT NULL,

    PRIMARY KEY (
        Rota_id_Rota,
        Trilho_id_Trilho
    ),

    FOREIGN KEY (Rota_id_Rota)
        REFERENCES rota(id_Rota),

    FOREIGN KEY (Trilho_id_Trilho)
        REFERENCES trilho(id_Trilho)
);


CREATE TABLE trem_has_rota (
    Trem_id_Trem INT NOT NULL,
    Rota_id_Rota INT NOT NULL,

    PRIMARY KEY (
        Trem_id_Trem,
        Rota_id_Rota
    ),

    FOREIGN KEY (Trem_id_Trem)
        REFERENCES trem(id_Trem),

    FOREIGN KEY (Rota_id_Rota)
        REFERENCES rota(id_Rota)
);


CREATE TABLE usuario (
    id_Usuario INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(45) NOT NULL,
    tipo_conta VARCHAR(45) NOT NULL,
    status VARCHAR(45) NOT NULL,
    ultimo_acesso VARCHAR(45) NOT NULL,
    Perfil_id_Perfil INT NOT NULL,

    PRIMARY KEY (id_Usuario),

    UNIQUE (nome),
    UNIQUE (email),
    UNIQUE (senha),
    UNIQUE (tipo_conta),
    UNIQUE (status),
    UNIQUE (ultimo_acesso),

    FOREIGN KEY (Perfil_id_Perfil)
        REFERENCES perfil(id_Perfil)
);