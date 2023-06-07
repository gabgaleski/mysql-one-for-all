SELECT 
    alb.nome_album AS album, COUNT(f.id_cancoes) AS favoritadas
FROM
    SpotifyClone.album AS alb
        INNER JOIN
    SpotifyClone.cancoes AS c ON c.album_id = alb.album_id
        INNER JOIN
    SpotifyClone.cancoes_fav AS f ON f.id_cancoes = c.id_cancoes
GROUP BY album
ORDER BY favoritadas DESC, album LIMIT 3;