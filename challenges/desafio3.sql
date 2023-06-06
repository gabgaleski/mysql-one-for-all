SELECT u.nome AS pessoa_usuaria, COUNT(h.rep_historico) AS musicas_ouvidas, ROUND(SUM(c.duracao)/60, 2) AS total_minutos
FROM SpotifyClone.usuarios AS u
INNER JOIN SpotifyClone.historico AS h ON u.user_id = h.user_id
INNER JOIN  SpotifyClone.cancoes AS c ON h.rep_historico = c.id_cancoes
GROUP BY pessoa_usuaria 
ORDER BY pessoa_usuaria;