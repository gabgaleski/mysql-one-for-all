SELECT 
    CASE
        WHEN idade <= 30 THEN 'Até 30 anos'
        WHEN idade > 30 AND idade <= 60 THEN 'Entre 31 e 60 anos'
        WHEN idade > 60 THEN 'Maior de 60 anos'
    END AS faixa_etaria,
    COUNT(*) AS total_pessoas_usuarias,
    CAST(SUM((SELECT COUNT(*) FROM SpotifyClone.cancoes_fav WHERE user_id = u.user_id)) AS UNSIGNED) AS total_favoritadas
FROM SpotifyClone.usuarios AS u
GROUP BY faixa_etaria
ORDER BY faixa_etaria;
