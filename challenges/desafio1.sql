DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.planos(
	id_plano INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	tipo_plano VARCHAR(50),
    valor DECIMAL(3, 2)
) engine = InnoDB;

CREATE TABLE SpotifyClone.usuarios(
	user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(70),
    id_plano INT NOT NULL,
    idade INT,
    FOREIGN KEY (id_plano) REFERENCES planos(id_plano)
) engine = InnoDB;

CREATE TABLE SpotifyClone.artistas(
	artista_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome_artista VARCHAR(50) NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.album(
	album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome_album VARCHAR(70),
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.cancoes(
	id_cancoes INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome_cancoes VARCHAR(100),
    album_id INT NOT NULL,
    duracao INT NOT NULL,
     FOREIGN KEY (album_id) REFERENCES album(album_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.historico(
	user_id INT NOT NULL,
	rep_historico INT,
    data_reproducao DATE,
    CONSTRAINT PRIMARY KEY (user_id, rep_historico),
    FOREIGN KEY (user_id) REFERENCES usuarios(user_id),
    FOREIGN KEY (rep_historico) REFERENCES cancoes(id_cancoes)
) engine = InnoDB;

CREATE TABLE SpotifyClone.seguindo_artistas(
	user_id INT NOT NULL,
	artistas_seguindo INT,
    CONSTRAINT PRIMARY KEY (user_id, artistas_seguindo),
	FOREIGN KEY (user_id) REFERENCES usuarios(user_id),
    FOREIGN KEY (artistas_seguindo) REFERENCES artistas(artista_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.planos (tipo_plano, valor)
VALUES
  ('gratuito', '0'),
  ('familiar', '7.99'),
  ('universitário', '5.99'),
  ('pessoal', '6.99');

INSERT INTO SpotifyClone.usuarios (nome, id_plano, idade)
VALUES
  ('Barbara Liskov', '1', '82'),
  ('Robert Cecil Martin', '1', '58'),
  ('Ada Lovelace', '2', '37'),
  ('Martin Fowler', '2', '46'),
  ('Sandi Metz', '2', '58'),
  ('Paulo Freire', '3', '19'),
  ('Bell Hooks', '3', '26'),
  ('Christopher Alexander', '4', '85'),
  ('Judith Butler', '4', '45'),
  ('Jorge Amado', '4', '58');

INSERT INTO SpotifyClone.artistas (nome_artista)
VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');

INSERT INTO SpotifyClone.album (nome_album, artista_id)
VALUES
  ('Renaissance', '1'),
  ('Jazz', '2'),
  ('Hot Space', '2'),
  ('Falso Brilhante', '3'),
  ('Vento de Maio', '3'),
  ('QVVJFA?', '4'),
  ('Somewhere Far Beyond', '5'),
  ('I Put A Spell On You', '6');

INSERT INTO SpotifyClone.cancoes (album_id, nome_cancoes, duracao)
VALUES
  ('1', 'BREAK MY SOUL', '279'),
  ('1', "VIRGO'S GROOVE", '369'),
  ('1', 'ALIEN SUPERSTAR', '116'),
  ('2', "Don't Stop Me Now", '203'),
  ('3', 'Under Pressure', '152'),
  ('4', 'Como Nossos Pais', '105'),
  ('5', 'O Medo de Amar é o Medo de Ser Livre', '207'),
  ('6', 'Samba em Paris', '267'),
  ('7', "The Bard's Song", '244'),
  ('8', 'Feeling Good', '100');

INSERT INTO SpotifyClone.historico (user_id, rep_historico, data_reproducao)
VALUES
  ('1', '8', '2022-02-28 10:45:55'),
  ('1', '2', '2020-05-02 05:30:35'),
  ('1', '10', '2020-03-06 11:22:33'),
  ('2', '10', '2022-08-05 08:05:17'),
  ('2', '7', '2020-01-02 07:40:33'),
  ('3', '10', '2020-11-13 16:55:13'),
  ('3', '2', '2020-12-05 18:38:30'),
  ('4', '8', '2021-08-15 17:10:10'),
  ('5', '8', '2022-01-09 01:44:33'),
  ('5', '5', '2020-08-06 15:23:43'),
  ('6', '7', '2017-01-24 00:31:17'),
  ('6', '1', '2017-10-12 12:35:20'),
  ('7', '4', '2011-12-15 22:30:49'),
  ('8', '4', '2012-03-17 14:56:41'),
  ('9', '9', '2022-02-24 21:14:22'),
  ('10', '3', '2015-12-13 08:30:22');
  
INSERT INTO SpotifyClone.seguindo_artistas (user_id, artistas_seguindo)
VALUES
  ('1', '1'),
  ('1', '2'),
  ('1', '3'),
  ('2', '1'),
  ('2', '3'),
  ('3', '2'),
  ('4', '4'),
  ('5', '5'),
  ('5', '6'),
  ('6', '6'),
  ('6', '1'),
  ('7', '6'),
  ('9', '3'),
  ('10', '2');
  