-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : mer. 26 avr. 2023 à 09:25
-- Version du serveur : 5.7.39
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `devops`
--

-- --------------------------------------------------------

--
-- Structure de la table `Axe`
--

CREATE TABLE `Axe` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `grille_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Axe`
--

INSERT INTO `Axe` (`id`, `nom`, `grille_id`) VALUES
(1, 'Compétence', 1),
(2, 'Réactivité', 1),
(3, 'Numérique', 1);

-- --------------------------------------------------------

--
-- Structure de la table `Categorie`
--

CREATE TABLE `Categorie` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `axe_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Categorie`
--

INSERT INTO `Categorie` (`id`, `nom`, `axe_id`) VALUES
(1, 'Excellence Technique/Communauté de pratiques', 1),
(2, 'Faire agile', 1),
(3, 'Gestion humaine des compétences', 1),
(4, 'Vélocité de réponse', 2),
(5, 'Environnements souples', 2),
(6, 'Défi environnemental', 2),
(7, 'Veille et benchmark', 2),
(8, 'Business model', 3),
(9, 'Relation client', 3),
(10, 'Management', 3);

-- --------------------------------------------------------

--
-- Structure de la table `Entreprise`
--

CREATE TABLE `Entreprise` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Entreprise`
--

INSERT INTO `Entreprise` (`id`, `name`) VALUES
(1, 'Mauzer Faucker');

-- --------------------------------------------------------

--
-- Structure de la table `Grille`
--

CREATE TABLE `Grille` (
  `id` int(11) NOT NULL,
  `entreprise_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Grille`
--

INSERT INTO `Grille` (`id`, `entreprise_id`, `created_at`) VALUES
(1, 1, '2023-04-25 11:42:13');

-- --------------------------------------------------------

--
-- Structure de la table `Progression`
--

CREATE TABLE `Progression` (
  `id` int(11) NOT NULL,
  `texte` text,
  `categorie_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Progression`
--

INSERT INTO `Progression` (`id`, `texte`, `categorie_id`) VALUES
(1, 'Mise en place :\r\n- De formations / coachings techniques,\r\n- Du temps institutionnalisé pour la veille et/ou l\'apprentissage,\r\n- D\'incitations pour la tenue à jour des compétences des équipes internes ET externes,\r\n- De communautés de pratiques ou d\'intérêts, des guildes,\r\n- Mentorat interne,\r\n- De revues d\'amélioration continue,\r\n- D\'Hackathons ou évènements pour promouvoir l\'excellence technique et l\'esprit agile', 1),
(2, 'Pour un pilote : une équipe / un ilôt de projet\r\n\r\nPour le déploiement systématique, l\'entreprise a une démarche d\'analyse globale des pôles / projets / produits devant entrer dans un processus pour \"faire agile\". Si les conditions sont remplies, l\'équipe projets / produits utilise la ou les \"méthodes\" préconisées.\r\n\r\nVous devriez être à la promotion de quelques valeurs agiles en :\r\n- Construisant vos projets autour de personnes motivées\r\n- Développant les compétences pour la compréhension du client\r\n- Vous attachant davantage à la qualité qu\'au coût lors des recrutements (en particulier externe)\r\n- Accompagnant vos clients\r\n\r\nVous atteignez un état d\'esprit agile en :\r\n- Promouvant systématiquement le \"Fail Fast\"\r\n- Valorisant le métier de facilitateur plus que celui de pilote\r\n- Favorisant un management agile ou transformationnel\r\n- Acceptant que les équipes s\'auto-organisent\r\n- Rentrant dans une logique de gestion de produits / services plus que de projets.', 2),
(3, 'Le second niveau devrait impliquer une attention à :\r\n- Des filières d\'évolution distinctes (gestion de projet & expertise technique & expertise fonctionnelle & etc)\r\n- Des plans de formations en adéquation avec les filières\r\n- La recherche de profils avec des compétences \"Agiles\"\r\n- Un plan de développement structuré autour de l\'agile\r\n\r\nLa gestion humaine des compétences impliquerait :\r\n- Une organisation vers la pluri-compétence\r\n- Une GPEC orientée vers un développement systématique de la liquidité des compétences\r\n- Des entretiens pluri-annuels\r\n- Des entretiens 360°', 3),
(4, 'Améliorer la vélocité des équipes en :\r\n- proposant aux clients internes comme externes, des MVP\r\n- traitant les aléas au fil de l\'eau (via un PDCA par exemple)\r\n- mesurant cette vélocité (par la mise en place de burn down chart par exemple)\r\n- en formant les équipes aux outils de gestion du temps et des priorités dans un monde VUCA (pomodoro, kanban board...)\r\nVUCA : ', 4),
(5, 'Au sein de l\'entreprise, nommer un Business Analyst qui sera alors le véritable chaînon manquant entre la DSI et les métiers.\r\n\r\nInvestir dans le Businness Object et le no-code\r\n\r\nFormer les équipes au Lean et/ou aux méthodes agiles\r\n\r\nDès que possible instaurer les concepts du juste à temps', 5),
(6, 'Faire de l\'ugence climatique une priorité sur l\'ensemble des activités de l\'entreprise par la mise en place de démarches :\r\n- d\'éco-conception des produits\r\n- d\'éco-industrialisation et d\'éco-production sur l\'ensemble des process\r\n- de développement durable (axes environnemental, social et sociétal)\r\n- performance énergétique des bâtiments et infrastructures des systèmes d\'informations\r\n- green supply chain management', 6),
(7, 'Former les équipes à l\'intelligence économique, la veille et le benchmarking.\r\nDevenir proactif : Apprendre à prendre du recul dans l\'instantanéité pour avoir un coup d\'avance', 7);

-- --------------------------------------------------------

--
-- Structure de la table `Question`
--

CREATE TABLE `Question` (
  `id` int(11) NOT NULL,
  `texte` varchar(255) DEFAULT NULL,
  `texte_2_point` text,
  `texte_1_point` text,
  `texte_0_point` text,
  `categorie_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Question`
--

INSERT INTO `Question` (`id`, `texte`, `texte_2_point`, `texte_1_point`, `texte_0_point`, `categorie_id`) VALUES
(1, 'Formations pour Apprendre à apprendre, changement de paradigme, \"être à la page\" (au-delà des compétences \"justes\" nécessaires)', 'Possibilité de choisir et de suivre des formations \"annexes\" au métier et/ou temps dédié pour de la veille ou de l\'auto-formation ', 'Nombreuses formations métiers dans le plan de formation', 'Désintérêt pour l\'amélioration de la compétence des équipes', 1),
(2, 'Le co-développement (outil d\'intelligence collective) existe-t-il dans l\'entreprise ?', 'Démarche instaurée et pratiquée régulièrement', 'Quelques initiatives', 'Pas du tout', 1),
(3, 'Les collaborateurs sont-ils amenés à partager leurs compétences et sous quelles formes ?', 'Véritable communauté de pratiques mise en place', 'Capitalisation d\'un certain nombre de savoirs', 'Aucune initiative', 1),
(4, 'Le mentoring (fonctionnement en binôme) existe-t-il pour assurer le transfert de compétences ?', 'Systématiquement lors d\'une prise de poste', 'Quelques initiatives', 'Aucune initiative', 1),
(5, 'Les managers sont-ils aussi formateurs sur certains sujet pour l\'entreprise entière ?', 'Quasi systématiquement', 'Quelques fois', 'Non', 1),
(6, 'L\'entreprise favorise-t-elle l\'excellence technique ? (Principe 9 du Manifeste Agile)', 'Oui', 'Oui un peu', 'Pas du tout', 1),
(7, 'Déployez vous les pratiques du \"Faire Agile\", c\'est-à-dire une ou plusieurs des \"méthodes\" agiles ?', 'Déploiement systématique d\'une ou plusieurs méthodes', 'Quelques projets pilotes', 'NON, nous les projets sont tous en cycle en V / cascade', 2),
(8, 'Votre entreprise promeut-elle un \"état d\'esprit agile\" ?', 'Oui', 'Quelques valeurs agiles promues', 'Non', 2),
(9, 'Votre entreprise gère-t-elle humainement les compétences ?', 'Oui', 'Un peu', 'Non', 3),
(10, 'Valeur supérieure utilisable livrée plus tôt (Fonction principale utilisable dès les premières versions)', 'Principe du MVP respecté : Minimum Viable Product / la version d\'un produit qui permet d\'obtenir un maximum de retours client avec un minimum d\'effort', 'Prototype fonctionnel intermédiaire livré au client', 'Pas de phase de validation intermédiaire', 4),
(11, 'Réactivité face aux impératifs prépondérants', 'L\'équipe de conception s\'adapte en cas de modification en cours de conception', 'Modifications en cours de conception engendrant alors du retard', 'Pas de modification possible en cours de conception', 4),
(12, 'Mesure de la vélocité de l\'équipe (indicateur de suivi du travail d\'une équipe de conception)', 'Mesure de la vélocité', 'Suivi des tâches', 'Jamais', 4),
(13, 'Les installations techniques et de gestion sont modernes (TIC/ERP/CRM)', 'En cas de besoin, le système d\'information favorise la réactivité', 'Le système d\'information permet avec quelques difficultés d\'avoir de la réactivité', 'Le système d\'information freine toute tentative de réagir rapidement', 5),
(14, 'Les équipes sont en capacité d\'autonomiser une partie de leurs tâches', 'L\'entreprise équipe et forme ses équipes à la création de site web ou app via des outils no-code', 'On laisse la possibilité de créer quelques macros Excel/VBA', 'Jamais', 5),
(15, 'Les équipes s’inscrivent dans un cadre Agile Lean', 'Les concepts Agile/Lean sont inscrits dans l\'ADN de l\'entreprise : Satisfaction du client avec des livraisons au plu tôt et régulières, accepter les changements, lisser les activités, collaboration quotidienne avec les parties prenantes, proximité terrain, autonomie des équipes dans la résolution de problèmes, amélioration continue...', 'Plusieurs concepts Agile/Lean sont mis en œuvre dans l\'entreprise', 'Pas de démarche Agile/Lean initiée dans l\'entreprise', 5),
(16, 'Les mécanismes de livraison et de synchronisation sont matures', 'Concepts du juste à temps maîtrisés (production rythmée par la demande client, peu d\'en-cours)', 'Quelques concepts du juste à temps sont mis en œuvre pour tendre le flux', 'Pas de démarche de tension des flux', 5),
(17, 'Les innovations produit tiennent compte de l\'urgence climatique', 'Systématiquement', 'Des premières initiatives ont été lancées', 'Auxune réflexion sur cet axe', 6),
(18, 'Les processus internes sont remis en cause pour diminuer leur impact environnemental', 'Systématiquement', 'Des premières initiatives ont été lancées', 'Auxune réflexion sur cet axe', 6),
(19, 'Les parties prenantes sont sélectionnées en fonction de leur éthique vis-à-vis du développement durable', 'Systématiquement', 'Des premières initiatives ont été lancées', 'Auxune réflexion sur cet axe', 6),
(20, 'Veille stratégique', 'La veille stratégique de l\'entreprise permet d\'anticiper les disruptions nécessaires', 'La veille stratégique de l\'entreprise permet d\'anticiper les évolutions et les innovations', 'Pas de veille', 7),
(21, 'Votre entreprise dégage t-elle une part de CA  par des produits ou services en ligne', 'Oui environ 30%', 'Oui environ 20%', 'Moins de 10%', 8),
(22, 'La mise en place d’outils numériques a-t-elle permis d\'optimiser les coûts, les délais et la qualité ?', 'Oui pour tous les critères ', 'Oui mais pas pour tous les critères', 'Aucun', 8),
(23, 'Comment les outils sont-ils intégrés dans les process de l’entreprise ?', 'A part entière, il existe des procédures et formations aux outils, ces outils sont intituitifs et adaptés à l\'activité', 'En partie, les outils ne sont pas toujours adaptés à l\'activité et pas toujours rattachés à des procédures, sans entraver ses principales fonctions', 'Absence d\'outils ou de procédures, manque d\'utilité', 8),
(24, 'Comment partagez-vous les données numériques avec les parties prenantes (clients, fournisseurs,…) ?', 'En mode avancé : des plateformes dédiées (type extranet, applications) sont intégrées au mode de partage permanent ', 'En mode collaboratif : quelques aménagements (type sharepoint, drive) pour des sujets plutôt ponctuels', 'En mode novice : au mieux par mail ou via le site internet', 8),
(25, 'Mesurez-vous les impacts du numérique sur votre entreprise ?', 'Oui des outils de mesure sont en place', 'Oui et non on observe sans mesurer', 'Non ', 8),
(26, 'Quel est l’impact du numérique sur la démarche RSE de l’entreprise ?', 'Le numérique est un sujet totalement rattaché à la démarche RSE', 'C\'est un sujet observé de loin, on traite les questions d\'obligation légales sans aller plus loin', 'Absence de démarche RSE', 8),
(27, 'Existe-t-il des freins (stratégiques, financiers,…) à l’ investissement dans les outils numériques ?', 'Non des budgets sont alloués et l\'entreprise a bien compris cette nécessité dans sa stratégie', 'Oui l\'entreprise est plutôt frileuse, on ne dépense que le strict nécessaire pour que les outils fonctionnent sans recherche de performance', 'Oui la statégie de l\'entreprise n\'est pas orientée en faveur du numérique, elle n\'investit pas', 8),
(28, 'L’entreprise dispose-t-elle : d’un site internet, d’un compte LinkedIn, d’une page Facebook, d’un compte Twitter,... ?', 'Oui la présence de l\'entreprise sur les réseaux est visible, elle correspond au secteur d\'activité', 'Oui mais seulement sur le site internet = 1 point', 'Non le site/la page réseau sont inexistants ou inactifs', 9),
(29, 'Comment utilisez-vous le numérique dans la relation client ? (nouveau modèle de vente, nouveau modèle d’échanges avec les clients, communauté, story, chat,...)', 'Plusieurs modes d\'utilisation sont possibles pour échanger avec l\'externe, ils sont performants et adaptés avec l\'activité de l\'entreprise', 'Des accès dédiés pour les échanges entre le client et l\'entreprise sont existent, le suivi des contacts n\'est pas optimal', 'Absence de plateforme de contact', 9),
(30, 'L’entreprise dispose-t-elle d’un community manager ?', 'Oui', 'Non mais une personne se charge de l\'animation des réseaux sociaux parmi ses autres tâches', 'Non aucune personne n\'est dédiée ', 9),
(31, 'Certains de vos collaborateurs sont-ils actifs sur les réseaux sociaux au nom de l’entreprise ?', 'Oui avec des incitations de l\'entreprise pour le faire', 'Oui sans incitation', 'Non ou rarement', 9),
(32, 'Comment mesurez-vous et exploitez-vous les données issues du site de votre entreprise ?', 'Des indicateurs sont mis en place afin de mesurer l\'efficacité et l\'impact du site sur les réseaux, une recherche de performance est en place pour toucher toujours plus et mieux', 'Des indicateurs sont en place mais plutôt de façon passive, ils servent à mesurer ', 'Absence de suivi', 9),
(33, 'Avez-vous observé chez vos concurrents des pratiques innovantes ?', 'Oui elles servent comme base de reflexion et de développement pour notre propre entreprise. On peut être rivaliser !', 'Oui ils ont quelques belles idées, si seulement on pouvait faire aussi bien qu\'eux', 'Oui ils sont tellement performants et en avance que nous pourrions perdre des marchés', 9),
(34, 'Vos collaborateurs sont-ils équipés de nouveaux équipements numériques de travail (PC portable, tablette, smartphone,…) ? ', 'Les processus de travail s\'appuient sur des outils numériques quand ceux-ci sont possibles. L\'ensemble des fonctions de l\'entreprise sont équipées pour pouvoir réaliser le travail à distance quand celui-ci est possible', 'Les processus s\'appuient rarement sur la numérisation des données et les outils numériques. Le potentiel ne semble pas pleinement exploité. ', 'Les fonctions supports ne sont pas amenées à être équipé pour le travail à distance. L\'entreprise fonctionne majoritairement sur le mode papier.', 10),
(35, 'L’arrivée des outils digitaux a-t-elle eu un impact sur les pratiques et la culture de l’entreprise ?', 'Oui gain de temps, facilité, économies et fiabilité', 'Oui dans l\'ensemble toutefois nous rencontrons parfois des contraintes (pratiques, techniques,…)', 'Non au contraire, peu de monde y adhère', 10),
(36, 'Comment vous êtes-vous approprié et comment avez-vous accompagné ces évolutions?', 'Tout est en place pour faciliter la compréhension et l\'adhésion aux nouveaux outils/pratiques', ' La communication n\'est pas parfaite, les personnes qui peuvent se sentir en difficultés avec les nouvelles pratiques ne sont pas forcémment considérées. ', 'Absence de communication et d\'accompagnement', 10),
(37, 'Les nouvelles possibilités technologiques ont-elles fait évoluer le modèle d’organisation de l’entreprise et/ou votre management, vers plus de collaboration avec des acteurs internes ou externes ?', 'Oui on sort complétement du mode silot et on favorise le mode projet', 'Oui quelques évolutions s\'opèrent pour travailler en inter-service ou avec l\'externe, toutefois le potentiel n\'est pas pleinement exploité', 'L\'organisation est en silot, absence de projets transversaux et d\'interactions avec les autres sites', 10),
(38, 'Mobilisez-vous des outils de veille et mettez-vous en œuvre des modalités de curation et de partage de l’ information ?', 'Oui l\'entreprise est en capacité de mesurer sa performance et de réagir rapidement pour se mettre à jour', 'Il y a un peu de benchmark toutefois les décisions d\'évolutions sont un peu tardive (quand il n y a plus le choix)', 'Absence de veille', 10),
(39, 'Les fonctionnalités des outils sont-elles augmentées par la pratique de vos collaborateurs ?', 'Oui totalement les outils s\'adaptent au terrain quotidiennement', 'Oui mais les outils sont vieillissants, il y a des freins pour les faire évoluer', 'Absence de prise en compte des pratiques terrain', 10),
(40, 'Comment accompagnez-vous vos collaborateurs dans la transition numérique ?', 'L\'entreprise est pro-active par la promotion des innovations et des outils numériques. J\'adgère', 'L\'entreprise accompagne en faisant de son mieux pour faire adhérer les autres, il y a parfois quelques blocages. J\'aimerais parfois être moi-même accompagné', 'Absence d\'accompagnement', 10);

-- --------------------------------------------------------

--
-- Structure de la table `Reponse`
--

CREATE TABLE `Reponse` (
  `id` int(11) NOT NULL,
  `point` int(11) DEFAULT NULL,
  `commentaire` varchar(255) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Reponse`
--

INSERT INTO `Reponse` (`id`, `point`, `commentaire`, `question_id`) VALUES
(1, 1, 'coucou', 1),
(2, 2, 'coucou', 2),
(3, 1, 'coucou', 3),
(4, 0, 'coucou', 4),
(5, 1, 'coucou', 5),
(6, 0, 'coucou', 6),
(7, 1, 'coucou', 7),
(8, 2, 'coucou', 8),
(9, 1, 'coucou', 9),
(10, 1, 'coucou', 10),
(11, 1, 'coucou', 11),
(12, 2, 'coucou', 12),
(13, 0, 'coucou', 13),
(14, 0, 'coucou', 14),
(15, 1, 'coucou', 15),
(16, 2, 'coucou', 16),
(17, 1, 'coucou', 17),
(18, 0, 'coucou', 18),
(19, 2, 'coucou', 19),
(20, 1, 'coucou', 20),
(21, 1, 'coucou', 21),
(22, 2, 'coucou', 22),
(23, 2, 'coucou', 23),
(24, 0, 'coucou', 24),
(25, 1, 'coucou', 25),
(26, 2, 'coucou', 26),
(27, 0, 'coucou', 27),
(28, 2, 'coucou', 28),
(29, 1, 'coucou', 29),
(30, 2, 'coucou', 30),
(31, 1, 'coucou', 31),
(32, 1, 'coucou', 32),
(33, 2, 'coucou', 33),
(34, 0, 'coucou', 34),
(35, 2, 'coucou', 35),
(36, 1, 'coucou', 36),
(37, 2, 'coucou', 37),
(38, 0, 'coucou', 38),
(39, 1, 'coucou', 39),
(40, 2, 'coucou', 40);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Axe`
--
ALTER TABLE `Axe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grille_id` (`grille_id`);

--
-- Index pour la table `Categorie`
--
ALTER TABLE `Categorie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `axe_id` (`axe_id`);

--
-- Index pour la table `Entreprise`
--
ALTER TABLE `Entreprise`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Grille`
--
ALTER TABLE `Grille`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entreprise_id` (`entreprise_id`);

--
-- Index pour la table `Progression`
--
ALTER TABLE `Progression`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categorie_id` (`categorie_id`);

--
-- Index pour la table `Question`
--
ALTER TABLE `Question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categorie_id` (`categorie_id`);

--
-- Index pour la table `Reponse`
--
ALTER TABLE `Reponse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Axe`
--
ALTER TABLE `Axe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `Categorie`
--
ALTER TABLE `Categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `Entreprise`
--
ALTER TABLE `Entreprise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Grille`
--
ALTER TABLE `Grille`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Progression`
--
ALTER TABLE `Progression`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `Question`
--
ALTER TABLE `Question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `Reponse`
--
ALTER TABLE `Reponse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Axe`
--
ALTER TABLE `Axe`
  ADD CONSTRAINT `axe_ibfk_1` FOREIGN KEY (`grille_id`) REFERENCES `Grille` (`id`);

--
-- Contraintes pour la table `Categorie`
--
ALTER TABLE `Categorie`
  ADD CONSTRAINT `categorie_ibfk_1` FOREIGN KEY (`axe_id`) REFERENCES `Axe` (`id`);

--
-- Contraintes pour la table `Grille`
--
ALTER TABLE `Grille`
  ADD CONSTRAINT `grille_ibfk_1` FOREIGN KEY (`entreprise_id`) REFERENCES `Entreprise` (`id`);

--
-- Contraintes pour la table `Progression`
--
ALTER TABLE `Progression`
  ADD CONSTRAINT `progression_ibfk_1` FOREIGN KEY (`categorie_id`) REFERENCES `Categorie` (`id`);

--
-- Contraintes pour la table `Question`
--
ALTER TABLE `Question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`categorie_id`) REFERENCES `Categorie` (`id`);

--
-- Contraintes pour la table `Reponse`
--
ALTER TABLE `Reponse`
  ADD CONSTRAINT `reponse_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `Question` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
