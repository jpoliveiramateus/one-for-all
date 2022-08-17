DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.plano(
    `plano_id` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(45) NOT NULL,
    `preco` DECIMAL NOT NULL,
    PRIMARY KEY (`plano_id`)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artista(
    `artista_id` INT NOT NULL,
    `nome` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`artista_id`)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.album(
    `album_id` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(45) NOT NULL,
    `ano_lancamento` YEAR NOT NULL,
    `artista_id` INT NOT NULL,
    PRIMARY KEY (`album_id`),
    FOREIGN KEY (`artista_id`) REFERENCES `SpotifyClone`.`artista` (`artista_id`)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.cancao(
    `cancao_id` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(45) NOT NULL,
    `duracao_segundos` INT NOT NULL,
    `artista_id` INT NOT NULL,
    `album_id` INT NOT NULL,
    PRIMARY KEY (`cancao_id`),
    FOREIGN KEY (`artista_id`) REFERENCES `SpotifyClone`.`artista` (`artista_id`),
    FOREIGN KEY (`album_id`) REFERENCES `SpotifyClone`.`album` (`album_id`)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.usuario(
    `usuario_id` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(45) NOT NULL,
    `idade` INT NOT NULL,
    `data_assinatura` DATE NOT NULL,
    `plano_id` INT NOT NULL,
    PRIMARY KEY (`usuario_id`),
    FOREIGN KEY (`plano_id`) REFERENCES `SpotifyClone`.`plano` (`plano_id`)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.historico(
    `historico_id` INT NOT NULL AUTO_INCREMENT,
    `data_reproducao` DATETIME NOT NULL,
    `cancao_id` INT NOT NULL,
    `usuario_id` INT NOT NULL,
    PRIMARY KEY (`historico_id`, `cancao_id`, `usuario_id`),
    FOREIGN KEY (`cancao_id`) REFERENCES `SpotifyClone`.`cancao` (`cancao_id`),
    FOREIGN KEY (`usuario_id`) REFERENCES `SpotifyClone`.`usuario` (`usuario_id`)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.usuario_artista(
    `usuario_id` INT NOT NULL,
    `artista_id` INT NOT NULL,
    PRIMARY KEY(`usuario_id`, `artista_id`),
    FOREIGN KEY (`usuario_id`) REFERENCES `SpotifyClone`.`usuario` (`usuario_id`),
    FOREIGN KEY (`artista_id`) REFERENCES `SpotifyClone`.`artista` (`artista_id`)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.plano (plano_id, nome, preco)
  VALUES
    (1, 'gratuito', 0.00),
    (2, 'familiar', 7.99),
    (3, 'universitário', 5.99),
    (4, 'pessoal', 6.99);

  INSERT INTO SpotifyClone.artista (artista_id, nome)
  VALUES
    (1, 'Beyoncé'),
    (2, 'Queen'),
    (3, 'Elis Regina'),
    (4, 'Baco Exu do Blues'),
    (5, 'Blind Guardian'),
    (6, 'Nina Simone');

  INSERT INTO SpotifyClone.album (album_id, nome, ano_lancamento, artista_id)
  VALUES
    (1, 'Renaissance', 2022, 1),
    (2, 'Jazz', 1978, 2),
    (3, 'Hot Space', 1982, 2),
    (4, 'Falso Brilhante', 1998, 3),
    (5, 'Vento de Maio', 2001, 3),
    (6, 'QVVJFA?', 2003, 4),
    (7, 'Somewhere Far Beyond', 2007, 5),
    (8, 'I Put A Spell On You', 2012, 6);

  INSERT INTO SpotifyClone.cancao (cancao_id, nome, duracao_segundos, artista_id, album_id)
  VALUES
    (1, 'BREAK MY SOUL', 279, 1, 1),
    (2, 'VIRGO’S GROOVE', 369, 1, 1),
    (3, 'ALIEN SUPERSTAR', 116, 1, 1),
    (4, 'Don’t Stop Me Now', 203, 2, 2),
    (5, 'Under Pressure', 152, 2, 3),
    (6, 'Como Nossos Pais', 105, 3, 4),
    (7, 'O Medo de Amar é o Medo de Ser Livre', 207, 3, 5),
    (8, 'Samba em Paris', 267, 4, 6),
    (9, 'The Bard’s Song', 244, 5, 7),
    (10, 'Feeling Good', 100, 6, 8);

  INSERT INTO SpotifyClone.usuario (usuario_id, nome, idade, data_assinatura, plano_id)
  VALUES
    (1, 'Barbara Liskov', 82, '2019-10-20', 1),
    (2, 'Robert Cecil Martin', 58, '2017-01-06', 1),
    (3, 'Ada Lovelace', 37, '2017-12-30', 2),
    (4, 'Martin Fowler', 46, '2017-01-17', 2),
    (5, 'Sandi Metz', 58, '2018-04-29', 2),
    (6, 'Paulo Freire', 19, '2018-02-14', 3),
    (7, 'Bell Hooks', 26, '2018-01-05', 3),
    (8, 'Christopher Alexander', 85, '2019-06-05', 4),
    (9, 'Judith Butler', 45, '2020-05-13', 4),
    (10, 'Jorge Amado', 58, '2017-02-17', 4);

  INSERT INTO SpotifyClone.historico (historico_id, data_reproducao, cancao_id, usuario_id)
  VALUES
    (1, '2022-02-28 10:45:55', 8, 1),
    (2, '2020-05-02 05:30:35', 2, 1),
    (3, '2020-03-06 11:22:33', 10, 1),
    (4, '2022-08-05 08:05:17', 10, 2),
    (5, '2020-01-02 07:40:33', 7, 2),
    (6, '2020-11-13 16:55:13', 10, 3),
    (7, '2020-12-05 18:38:30', 2, 3),
    (8, '2021-08-15 17:10:10', 8, 4),
    (9, '2022-01-09 01:44:33', 8, 5),
    (10, '2020-08-06 15:23:43', 5, 5),
    (11, '2017-01-24 00:31:17', 7, 6),
    (12, '2017-10-12 12:35:20', 1, 6),
    (13, '2011-12-15 22:30:49', 4, 7),
    (14, '2012-03-17 14:56:41', 4, 8),
    (15, '2022-02-24 21:14:22', 9, 9),
    (16, '2015-12-13 08:30:22', 3, 10);

  INSERT INTO SpotifyClone.usuario_artista (usuario_id, artista_id)
  VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (9, 3),
    (10, 2);