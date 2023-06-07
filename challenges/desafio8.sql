SELECT 
	a.nome_artista AS artista,
    alb.nome_album AS album
FROM SpotifyClone.artistas AS a
INNER JOIN SpotifyClone.album AS alb ON alb.artista_id = a.artista_id
WHERE a.nome_artista = 'Elis Regina';