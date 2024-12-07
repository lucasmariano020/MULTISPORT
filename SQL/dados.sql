
-- Populating Usuario table

INSERT INTO Usuario (email, nome, data_nascimento, tipo_conta) VALUES
('admin@multisport.com', 'Admin User', '1980-01-01', 'Administrador'),
('joao.silva@email.com', 'João Silva', '1992-03-15', 'Padrão'),
('maria.oliveira@email.com', 'Maria Oliveira', '1987-06-20', 'Padrão');


-- Populating Esporte table

INSERT INTO Esporte (nome_esporte, popularidade, categoria) VALUES
('Futebol', 95, 'Coletivo'),
('Basquete', 80, 'Coletivo'),
('Tênis', 70, 'Individual');


-- Populating Localizacao table

INSERT INTO Localizacao (cidade, estado, pais) VALUES
('São Paulo', 'SP', 'Brasil'),
('Rio de Janeiro', 'RJ', 'Brasil'),
('Belo Horizonte', 'MG', 'Brasil');


-- Populating Instalacao_esportiva table

INSERT INTO Instalacao_esportiva (nome_instalacao, id_localizacao) VALUES
('Estádio do Maracanã', 2),
('Arena Corinthians', 1),
('Mineirão', 3);


-- Populating Evento_esportivo table

INSERT INTO Evento_esportivo (nome_evento, data_hora, nome_instalacao) VALUES
('Final Campeonato Brasileiro', '2024-12-01 16:00:00', 'Estádio do Maracanã'),
('Semifinal Libertadores', '2024-11-25 21:00:00', 'Mineirão'),
('Amistoso Internacional', '2024-07-10 19:00:00', 'Arena Corinthians');


-- Populating Transmissao table

INSERT INTO Transmissao (data_hora_inicio, duracao, qualidade, nome_esporte, nome_evento, data_hora_evento) VALUES
('2024-12-01 16:00:00', 120, 'HD', 'Futebol', 'Final Campeonato Brasileiro', '2024-12-01 16:00:00'),
('2024-11-25 21:00:00', 110, 'Full HD', 'Futebol', 'Semifinal Libertadores', '2024-11-25 21:00:00'),
('2024-07-10 19:00:00', 100, '4K', 'Basquete', 'Amistoso Internacional', '2024-07-10 19:00:00');

