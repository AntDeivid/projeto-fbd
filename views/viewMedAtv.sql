CREATE VIEW ResumoAtividadeMedicacao AS
SELECT
    u.cpfusuario AS cpf_usuario,
    u.nome AS nome_usuario,
    COUNT(DISTINCT a.atividadeid) AS total_atividades_fisicas,
    COUNT(DISTINCT m.medicacaoid) AS total_medicacoes,
    STRING_AGG(DISTINCT a.tempo, ', ') AS tempos_atividades
FROM usuario u
LEFT JOIN atividade_fisica a ON u.cpfusuario = a.cpfusuario
LEFT JOIN medicacao m ON u.cpfusuario = m.cpfusuario
GROUP BY u.cpfusuario, u.nome;
