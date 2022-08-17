SELECT c.nome AS cancao, COUNT(*) AS reproducoes FROM SpotifyClone.historico h
INNER JOIN SpotifyClone.cancao c ON c.cancao_id =  h.cancao_id
GROUP BY c.nome
ORDER BY reproducoes DESC, nome ASC
LIMIT 2;