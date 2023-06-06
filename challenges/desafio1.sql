DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.planos(
	id_plano INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	tipo_plano VARCHAR(50)
) engine = InnoDB;

CREATE TABLE SpotifyClone.usuarios(
	user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(70),
    id_plano INT NOT NULL,
    FOREIGN KEY (id_plano) REFERENCES planos(id_plano)
) engine = InnoDB;

CREATE TABLE SpotifyClone.artistas(
	artista_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome_artista VARCHAR(50)
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

INSERT INTO SpotifyClone.planos (tipo_plano)
VALUES
  ('gratuito'),
  ('familiar'),
  ('universitário'),
  ('pessoal');

INSERT INTO SpotifyClone.usuarios (nome, id_plano)
VALUES
  ('Barbara Liskov', '1'),
  ('Robert Cecil Martin', '1'),
  ('Ada Lovelace', '2'),
  ('Martin Fowler', '2'),
  ('Sandi Metz', '2'),
  ('Paulo Freire', '3'),
  ('Bell Hooks', '3'),
  ('Christopher Alexander', '4'),
  ('Judith Butler', '4'),
  ('Jorge Amado', '4');

INSERT INTO SpotifyClone.artistas (nome_artista)
VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina SImone');

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
  ('2', 'Under Pressure', '152'),
  ('3', 'Como Nossos Pais', '105'),
  ('3', 'O Medo de Amar é o Medo de Ser Livre', '207'),
  ('4', 'Samba em Paris', '267'),
  ('5', "The Bard's Song", '244'),
  ('6', 'Feeling Good', '100');

INSERT INTO SpotifyClone.historico (user_id, rep_historico)
VALUES
  ('1', '8'),
  ('1', '2'),
  ('1', '10'),
  ('2', '10'),
  ('2', '7'),
  ('3', '10'),
  ('3', '2'),
  ('4', '8'),
  ('5', '8'),
  ('5', '5'),
  ('6', '7'),
  ('6', '1'),
  ('7', '4'),
  ('8', '4'),
  ('9', '9'),
  ('10', '3');
  
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
