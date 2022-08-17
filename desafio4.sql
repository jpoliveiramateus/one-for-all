SELECT nome AS usuario, IF(MAX(YEAR(data_reproducao)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS 'status_usuario'
FROM SpotifyClone.usuario u
INNER JOIN SpotifyClone.historico h ON u.usuario_id = h.usuario_id
GROUP BY nome
ORDER BY usuario;