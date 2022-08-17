SELECT
	MIN(preco) AS 'faturamento_minimo',
    MAX(preco) AS 'faturamento_maximo',
    ROUND(AVG(preco), 2) AS 'faturamento_medio',
    SUM(preco) AS 'faturamento_total'
FROM SpotifyClone.usuario u
INNER JOIN SpotifyClone.plano p ON u.plano_id = p.plano_id;
