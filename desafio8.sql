SELECT ar.nome AS artista, al.nome AS album
FROM SpotifyClone.album al
INNER JOIN SpotifyClone.artista ar ON al.artista_id = ar.artista_id
WHERE ar.nome = 'Elis Regina'
ORDER BY album;