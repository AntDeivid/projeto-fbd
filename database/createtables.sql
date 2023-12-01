CREATE TABLE Usuário
(
  Nome VARCHAR NOT NULL,
  Dia INT NOT NULL,
  Mês INT NOT NULL,
  Ano INT NOT NULL,
  Idade INT NOT NULL,
  CpfUsuario INT NOT NULL,
  Número INT NOT NULL,
  Endereço VARCHAR NOT NULL,
  Tipo_sanguíneo VARCHAR NOT NULL,
  Histórico_médico VARCHAR NOT NULL,
  Peso FLOAT NOT NULL,
  PRIMARY KEY (CpfUsuario),
  UNIQUE (Número)
);

CREATE TABLE Atividade_Física
(
  Tempo INT NOT NULL,
  Tipo VARCHAR NOT NULL,
  Objetivo VARCHAR NOT NULL,
  AtividadeId INT NOT NULL,
  CpfUsuario INT NOT NULL,
  PRIMARY KEY (AtividadeId),
  FOREIGN KEY (CpfUsuario) REFERENCES Usuário(CpfUsuario)
);

CREATE TABLE Dieta
(
  Meta_Calórica INT NOT NULL,
  Quantidade_de_refeições INT NOT NULL,
  Intervalo_entre_refeições INT NOT NULL,
  Objetivo VARCHAR NOT NULL,
  DietaId INT NOT NULL,
  CpfUsuario INT NOT NULL,
  PRIMARY KEY (DietaId),
  FOREIGN KEY (CpfUsuario) REFERENCES Usuário(CpfUsuario)
);

CREATE TABLE Medicação
(
  Nome VARCHAR NOT NULL,
  Dosagem VARCHAR NOT NULL,
  Tipo VARCHAR NOT NULL,
  Intervalo_ INT NOT NULL,
  MedicacaoId INT NOT NULL,
  CpfUsuario INT NOT NULL,
  PRIMARY KEY (MedicacaoId),
  FOREIGN KEY (CpfUsuario) REFERENCES Usuário(CpfUsuario)
);

CREATE TABLE Registro_Médico
(
  RegistroId INT NOT NULL,
  CpfUsuario INT NOT NULL,
  AtividadeId INT NOT NULL,
  MedicacaoId INT NOT NULL,
  DietaId INT NOT NULL,
  PRIMARY KEY (RegistroId),
  FOREIGN KEY (CpfUsuario) REFERENCES Usuário(CpfUsuario),
  FOREIGN KEY (AtividadeId) REFERENCES Atividade_Física(AtividadeId),
  FOREIGN KEY (MedicacaoId) REFERENCES Medicação(MedicacaoId),
  FOREIGN KEY (DietaId) REFERENCES Dieta(DietaId)
);

CREATE TABLE Exame
(
  Tipo VARCHAR NOT NULL,
  Dia INT NOT NULL,
  Mês INT NOT NULL,
  Ano INT NOT NULL,
  Nome VARCHAR NOT NULL,
  ExameId INT NOT NULL,
  Finalidade VARCHAR NOT NULL,
  CpfUsuario INT NOT NULL,
  PRIMARY KEY (ExameId),
  FOREIGN KEY (CpfUsuario) REFERENCES Usuário(CpfUsuario)
);

CREATE TABLE Usuário_Parentesco
(
  Parentesco VARCHAR NOT NULL,
  CpfUsuario INT NOT NULL,
  PRIMARY KEY (CpfUsuario),
  FOREIGN KEY (CpfUsuario) REFERENCES Usuário(CpfUsuario)
);

CREATE TABLE Dieta_Alimentos
(
  Alimentos VARCHAR NOT NULL,
  DietaId INT NOT NULL,
  PRIMARY KEY (DietaId),
  FOREIGN KEY (DietaId) REFERENCES Dieta(DietaId)
);

CREATE TABLE Medicação_Contraindicação
(
  Contraindicação VARCHAR NOT NULL,
  MedicacaoId INT NOT NULL,
  PRIMARY KEY (MedicacaoId),
  FOREIGN KEY (MedicacaoId) REFERENCES Medicação(MedicacaoId)
);

CREATE TABLE Medicação_Efeitos_Colateráis_
(
  Efeitos_Colateráis_ VARCHAR NOT NULL,
  MedicacaoId INT NOT NULL,
  PRIMARY KEY (MedicacaoId),
  FOREIGN KEY (MedicacaoId) REFERENCES Medicação(MedicacaoId)
);

CREATE TABLE Registro_Médico_Possíveis_Doenças_
(
  Possíveis_Doenças_ NUMERIC NOT NULL,
  RegistroId INT NOT NULL,
  PRIMARY KEY (RegistroId),
  FOREIGN KEY (RegistroId) REFERENCES Registro_Médico(RegistroId)
);

CREATE TABLE Usuário_Reponsável
(
  CpfUsuario INT NOT NULL,
  RegistroId INT NOT NULL,
  PRIMARY KEY (CpfUsuario),
  FOREIGN KEY (CpfUsuario) REFERENCES Usuário(CpfUsuario),
  FOREIGN KEY (RegistroId) REFERENCES Registro_Médico(RegistroId)
);