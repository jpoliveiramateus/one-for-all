SELECT nome AS nome_musica,
CASE
	WHEN nome LIKE '%Amar%' THEN REPLACE(nome, 'Amar', 'Code Review')
    WHEN nome LIKE '%SUPERSTAR%' THEN REPLACE(nome, 'SUPERSTAR', 'SUPERDEV')
    WHEN nome LIKE '%Bard%' THEN REPLACE(nome, 'Bard', 'QA')
    WHEN nome LIKE '%SOUL%' THEN REPLACE(nome, 'SOUL', 'CODE')
    WHEN nome LIKE '%Pais%' THEN REPLACE(nome, 'Pais', 'Pull Requests')
END AS novo_nome
FROM SpotifyClone.cancao
WHERE cancao_id IN(9, 7, 6, 1, 3)
ORDER BY nome_musica DESC;
