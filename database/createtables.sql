CREATE TABLE Usuario
(
  Nome VARCHAR NOT NULL,
  Dia INT NOT NULL,
  Mes INT NOT NULL,
  Ano INT NOT NULL,
  Idade INT NOT NULL,
  CpfUsuario INT NOT NULL,
  Numero INT NOT NULL,
  Endereco VARCHAR NOT NULL,
  Tipo_sanguineo VARCHAR NOT NULL,
  Historico_medico VARCHAR NOT NULL,
  Peso FLOAT NOT NULL,
  PRIMARY KEY (CpfUsuario),
  UNIQUE (Numero)
);

CREATE TABLE Atividade_Fisica
(
  Tempo INT NOT NULL,
  Tipo VARCHAR NOT NULL,
  Objetivo VARCHAR NOT NULL,
  AtividadeId INT NOT NULL,
  CpfUsuario INT NOT NULL,
  PRIMARY KEY (AtividadeId),
  FOREIGN KEY (CpfUsuario) REFERENCES Usuario(CpfUsuario)
);

CREATE TABLE Dieta
(
  Meta_Calorica INT NOT NULL,
  Quantidade_de_refeicoes INT NOT NULL,
  Intervalo_entre_refeicoes INT NOT NULL,
  Objetivo VARCHAR NOT NULL,
  DietaId INT NOT NULL,
  CpfUsuario INT NOT NULL,
  PRIMARY KEY (DietaId),
  FOREIGN KEY (CpfUsuario) REFERENCES Usuario(CpfUsuario)
);

CREATE TABLE Medicacao
(
  Nome VARCHAR NOT NULL,
  Dosagem VARCHAR NOT NULL,
  Tipo VARCHAR NOT NULL,
  Intervalo_ INT NOT NULL,
  MedicacaoId INT NOT NULL,
  CpfUsuario INT NOT NULL,
  PRIMARY KEY (MedicacaoId),
  FOREIGN KEY (CpfUsuario) REFERENCES Usuario(CpfUsuario)
);

CREATE TABLE Registro_Medico
(
  RegistroId INT NOT NULL,
  CpfUsuario INT NOT NULL,
  AtividadeId INT NOT NULL,
  MedicacaoId INT NOT NULL,
  DietaId INT NOT NULL,
  PRIMARY KEY (RegistroId),
  FOREIGN KEY (CpfUsuario) REFERENCES Usuario(CpfUsuario),
  FOREIGN KEY (AtividadeId) REFERENCES Atividade_Fisica(AtividadeId),
  FOREIGN KEY (MedicacaoId) REFERENCES Medicacao(MedicacaoId),
  FOREIGN KEY (DietaId) REFERENCES Dieta(DietaId)
);

CREATE TABLE Exame
(
  Tipo VARCHAR NOT NULL,
  Dia INT NOT NULL,
  Mes INT NOT NULL,
  Ano INT NOT NULL,
  Nome VARCHAR NOT NULL,
  ExameId INT NOT NULL,
  Finalidade VARCHAR NOT NULL,
  CpfUsuario INT NOT NULL,
  PRIMARY KEY (ExameId),
  FOREIGN KEY (CpfUsuario) REFERENCES Usuario(CpfUsuario)
);

CREATE TABLE Usuario_Parentesco
(
  Parentesco VARCHAR NOT NULL,
  CpfUsuario INT NOT NULL,
  PRIMARY KEY (CpfUsuario),
  FOREIGN KEY (CpfUsuario) REFERENCES Usuario(CpfUsuario)
);

CREATE TABLE Dieta_Alimentos
(
  Alimentos VARCHAR NOT NULL,
  DietaId INT NOT NULL,
  PRIMARY KEY (DietaId),
  FOREIGN KEY (DietaId) REFERENCES Dieta(DietaId)
);

CREATE TABLE Medicacao_Contraindicacao
(
  Contraindicacao VARCHAR NOT NULL,
  MedicacaoId INT NOT NULL,
  PRIMARY KEY (MedicacaoId),
  FOREIGN KEY (MedicacaoId) REFERENCES Medicacao(MedicacaoId)
);

CREATE TABLE Medicacao_Efeitos_Colaterais_
(
  Efeitos_Colaterais_ VARCHAR NOT NULL,
  MedicacaoId INT NOT NULL,
  PRIMARY KEY (MedicacaoId),
  FOREIGN KEY (MedicacaoId) REFERENCES Medicacao(MedicacaoId)
);

CREATE TABLE Registro_Medico_Possiveis_Doencas_
(
  Possiveis_Doencas_ NUMERIC NOT NULL,
  RegistroId INT NOT NULL,
  PRIMARY KEY (RegistroId),
  FOREIGN KEY (RegistroId) REFERENCES Registro_Medico(RegistroId)
);

CREATE TABLE Usuario_Reponsavel
(
  CpfUsuario INT NOT NULL,
  RegistroId INT NOT NULL,
  PRIMARY KEY (CpfUsuario),
  FOREIGN KEY (CpfUsuario) REFERENCES Usuario(CpfUsuario),
  FOREIGN KEY (RegistroId) REFERENCES Registro_Medico(RegistroId)
);