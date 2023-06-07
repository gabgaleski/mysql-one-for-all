CREATE TABLE SpotifyClone.cancoes_fav(
	user_id INT NOT NULL,
	id_cancoes INT NOT NULL,
    CONSTRAINT PRIMARY KEY (user_id, id_cancoes),
    FOREIGN KEY (user_id) REFERENCES SpotifyClone.usuarios(user_id),
    FOREIGN KEY (id_cancoes) REFERENCES SpotifyClone.cancoes(id_cancoes)
) engine = InnoDB;
 INSERT INTO SpotifyClone.cancoes_fav (user_id, id_cancoes)
VALUES
  ('1', '3'),
  ('1', '6'),
  ('1', '10'),
  ('2', '4'),
  ('3', '1'),
  ('3', '3'),
  ('4', '7'),
  ('4', '4'),
  ('5', '10'),
  ('5', '2'),
  ('8', '4'),
  ('9', '7'),
  ('10', '3');
