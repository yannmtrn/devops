CREATE TABLE `Entreprise` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255)
);

CREATE TABLE `Grille` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `entreprise_id` integer,
  `created_at` timestamp
);

CREATE TABLE `Axe` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `nom` varchar(255),
  `grille_id` integer
);

CREATE TABLE `Categorie` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `nom` varchar(255),
  `axe_id` integer
);

CREATE TABLE `Progression` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `texte` varchar(255),
  `categorie_id` integer
);

CREATE TABLE `Question` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `texte` varchar(255),
  `texte_2_point` varchar(255),
  `texte_1_point` varchar(255),
  `texte_0_point` varchar(255),
  `categorie_id` integer
);

CREATE TABLE `Reponse` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `point` int,
  `commentaire` varchar(255),
  `question_id` int
);

ALTER TABLE `Grille` ADD FOREIGN KEY (`entreprise_id`) REFERENCES `Entreprise` (`id`);

ALTER TABLE `Axe` ADD FOREIGN KEY (`grille_id`) REFERENCES `Grille` (`id`);

ALTER TABLE `Categorie` ADD FOREIGN KEY (`axe_id`) REFERENCES `Axe` (`id`);

ALTER TABLE `Progression` ADD FOREIGN KEY (`categorie_id`) REFERENCES `Categorie` (`id`);

ALTER TABLE `Question` ADD FOREIGN KEY (`categorie_id`) REFERENCES `Categorie` (`id`);

ALTER TABLE `Reponse` ADD FOREIGN KEY (`question_id`) REFERENCES `Question` (`id`);
