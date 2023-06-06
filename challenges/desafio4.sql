SELECT u.nome AS pessoa_usuaria, 
IF(MAX(DATE(h.data_reproducao)) >= '2021-01-01', 'Ativa', 'Inativa') AS status_pessoa_usuaria
FROM SpotifyClone.usuarios AS u
INNER JOIN SpotifyClone.historico AS h ON u.user_id = h.user_id
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria;
