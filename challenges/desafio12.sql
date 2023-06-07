SELECT a.nome_artista AS artista,
       CASE
           WHEN COUNT(cf.id_cancoes) >= 5 THEN 'A'
           WHEN COUNT(cf.id_cancoes) BETWEEN 3 AND 4 THEN 'B'
           WHEN COUNT(cf.id_cancoes) BETWEEN 1 AND 2 THEN 'C'
           ELSE '-'
       END AS ranking
FROM SpotifyClone.artistas a
LEFT JOIN SpotifyClone.album al ON a.artista_id = al.artista_id
LEFT JOIN SpotifyClone.cancoes c ON al.album_id = c.album_id
LEFT JOIN SpotifyClone.cancoes_fav cf ON c.id_cancoes = cf.id_cancoes
GROUP BY a.nome_artista
ORDER BY COUNT(cf.id_cancoes) DESC, a.nome_artista ASC;