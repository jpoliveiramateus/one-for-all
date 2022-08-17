SELECT u.nome AS usuario,
COUNT(u.usuario_id) AS 'qt_de_musicas_ouvidas',
ROUND(SUM(c.duracao_segundos) / 60, 2) AS 'total_minutos'
FROM SpotifyClone.usuario u
INNER JOIN SpotifyClone.historico h ON h.usuario_id = u.usuario_id
INNER JOIN SpotifyClone.cancao c ON h.cancao_id = c.cancao_id
GROUP BY h.usuario_id
ORDER BY usuario;