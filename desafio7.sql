SELECT ar.nome AS artista, al.nome AS album, COUNT(ur.artista_id) AS seguidores FROM SpotifyClone.album al
INNER JOIN SpotifyClone.artista ar ON al.artista_id = ar.artista_id
INNER JOIN SpotifyClone.usuario_artista ur ON ur.artista_id = al.artista_id
GROUP BY artista, album
ORDER BY seguidores DESC, artista ASC, album ASC;