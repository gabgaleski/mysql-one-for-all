SELECT 
	a.nome_artista AS artista,
    alb.nome_album AS album,
    COUNT(s.artistas_seguindo) AS pessoas_seguidoras
FROM SpotifyClone.artistas AS a
INNER JOIN SpotifyClone.album AS alb ON alb.artista_id = a.artista_id
INNER JOIN SpotifyClone.seguindo_artistas AS s ON s.artistas_seguindo = a.artista_id
GROUP BY artista, album
ORDER BY pessoas_seguidoras DESC, artista, album;