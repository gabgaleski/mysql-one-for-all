SELECT c.nome_cancoes AS cancao, COUNT(rep_historico) AS reproducoes
FROM SpotifyClone.cancoes AS c
INNER JOIN SpotifyClone.historico AS h ON c.id_cancoes = h.rep_historico
GROUP BY nome_cancoes
ORDER BY reproducoes DESC, cancao
LIMIT 2;