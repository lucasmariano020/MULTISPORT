-- Consulta as transmissoes de futebol e retorna seus dados

SELECT * FROM Transmissao WHERE nome_esporte = 'Futebol';

-- Consulta os 3 últimos eventos esportivos assistidos pelo usuário por meio do nome de usuário

SELECT DISTINCT T.nome_evento
FROM Transmissao T
JOIN Transmissao_Usuario TU ON T.numero_transmissao = TU.numero_transmissao
JOIN (
    SELECT email
    FROM Usuario
    WHERE nome = 'João Silva' 
) U ON TU.email_usuario = U.email
ORDER BY T.data_hora_inicio DESC 
LIMIT 3; 

-- Consulta as próximas 3 transmissões de evento esportivo de um time por meio do nome do time
SELECT DISTINCT 
    T.nome_evento AS evento_esportivo,
    T.data_hora_inicio AS data_hora_transmissao
FROM 
    Transmissao T
JOIN 
    Evento_time ET 
    ON T.nome_evento = ET.nome_evento
       AND T.data_hora_evento = ET.data_hora
WHERE 
    ET.nome_time = 'Flamengo' 
    AND T.data_hora_inicio > NOW()
ORDER BY 
    T.data_hora_inicio ASC
LIMIT 3;
