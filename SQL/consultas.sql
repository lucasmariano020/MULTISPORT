-- Consulta as informações de todas as Transmissões para o esporte Futebol
SELECT * FROM Transmissao WHERE nome_esporte = 'Futebol';

-- Consulta o nome dos três últimos eventos esportivos assistidos pelo usuário por meio do nome do usuário
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

