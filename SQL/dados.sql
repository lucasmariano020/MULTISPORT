-- Alimentação Inicial da Base de Dados
-- Script para povoar todas as tabelas do esquema com dados iniciais

-- Tabela Localizacao
INSERT INTO Localizacao (id_localizacao, cidade, estado, pais) VALUES
(1, 'São Paulo', 'SP', 'Brasil'),
(2, 'Rio de Janeiro', 'RJ', 'Brasil');

-- Tabela Instalacao_esportiva
INSERT INTO Instalacao_esportiva (nome_instalacao, id_localizacao) VALUES
('Estádio do Maracanã', 2),
('Arena Corinthians', 1);

-- Tabela Esporte
INSERT INTO Esporte (nome_esporte, popularidade, categoria) VALUES
('Futebol', 95, 'Coletivo'),
('Basquete', 75, 'Coletivo');

-- Tabela Time
INSERT INTO Time (nome_time) VALUES
('Flamengo'),
('Palmeiras');

-- Tabela Atleta
INSERT INTO Atleta (CPF, nome_time, nome, data_nascimento) VALUES
('12345678901', 'Flamengo', 'Gabriel Barbosa', '1996-08-30'),
('98765432109', 'Palmeiras', 'Dudu', '1991-05-14');

-- Tabela Evento_esportivo
INSERT INTO Evento_esportivo (nome_evento, data_hora, nome_instalacao) VALUES
('Campeonato Brasileiro - Rodada 1', '2024-02-15 16:00:00', 'Estádio do Maracanã'),
('Campeonato Brasileiro - Rodada 2', '2024-02-22 16:00:00', 'Arena Corinthians');

-- Tabela Evento_time
INSERT INTO Evento_time (nome_time, nome_evento, data_hora) VALUES
('Flamengo', 'Campeonato Brasileiro - Rodada 1', '2024-02-15 16:00:00'),
('Palmeiras', 'Campeonato Brasileiro - Rodada 2', '2024-02-22 16:00:00');

-- Tabela Tag
INSERT INTO Tag (nome) VALUES
('Futebol Brasileiro'),
('Série A');

-- Tabela Usuario
INSERT INTO Usuario (email, nome, data_nascimento, tipo_conta) VALUES
('admin@plataforma.com', 'Administrador Principal', '1985-01-01', 'Administrador'),
('usuario1@email.com', 'João Silva', '1990-05-15', 'Padrão');

-- Tabela Transmissao
INSERT INTO Transmissao (numero_transmissao, data_hora_inicio, duracao, qualidade, nome_esporte, nome_evento) VALUES
(1, '2024-02-15 16:00:00', 120, 'HD', 'Futebol', 'Campeonato Brasileiro - Rodada 1'),
(2, '2024-02-22 16:00:00', 120, 'Full HD', 'Futebol', 'Campeonato Brasileiro - Rodada 2');

-- Tabela Transmissao_Usuario
INSERT INTO Transmissao_Usuario (numero_transmissao, email_usuario) VALUES
(1, 'usuario1@email.com'),
(2, 'admin@plataforma.com');

-- Tabela Tag_transmissao
INSERT INTO Tag_transmissao (nomeTag, numeroTransmissao) VALUES
('Futebol Brasileiro', 1),
('Série A', 2);

-- Tabela Anuncio
INSERT INTO Anuncio (numero_anuncio, link_nuvem) VALUES
(1, 'https://exemplo.com/anuncio1'),
(2, 'https://exemplo.com/anuncio2');

-- Tabela User_transm_anuncio
INSERT INTO User_transm_anuncio (numero_transmissao, email_usuario, numero_anuncio) VALUES
(1, 'usuario1@email.com', 1),
(2, 'admin@plataforma.com', 2);

-- Tabela Comentario
INSERT INTO Comentario (email_usuario, data_hora, conteudo, status, email_adm, num_TRANSMISSAO) VALUES
('usuario1@email.com', '2024-02-15 16:30:00', 'Que jogo incrível!', 'Ativo', 'admin@plataforma.com', 1),
('admin@plataforma.com', '2024-02-22 16:45:00', 'Excelente transmissão', 'Ativo', NULL, 2);

-- Tabela Banimento (se aplicável)
INSERT INTO Banimento (email_adm, email_usuario, data_hora, tipo_conta) VALUES
('admin@plataforma.com', 'usuario1@email.com', '2024-02-20 10:00:00', 'Temporário');
