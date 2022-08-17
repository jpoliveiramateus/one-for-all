SELECT c.nome, COUNT(c.cancao_id) AS reproducoes
FROM SpotifyClone.historico h
INNER JOIN SpotifyClone.usuario u ON h.usuario_id = u.usuario_id
INNER JOIN SpotifyClone.cancao c ON h.cancao_id = c.cancao_id
WHERE u.plano_id IN (1, 4)
GROUP BY c.cancao_id
ORDER BY nome;