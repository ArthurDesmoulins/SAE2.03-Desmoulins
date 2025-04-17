-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 17 avr. 2025 à 09:09
-- Version du serveur : 10.11.11-MariaDB-0+deb12u1
-- Version de PHP : 8.3.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `desmoulins9`
--

-- --------------------------------------------------------

--
-- Structure de la table `Category`
--

CREATE TABLE `Category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `Category`
--

INSERT INTO `Category` (`id`, `name`) VALUES
(1, 'Action'),
(2, 'Romance'),
(3, 'Drame'),
(4, 'Science-fiction'),
(5, 'Animation'),
(6, 'Thriller'),
(7, 'Horreur'),
(8, 'Aventure'),
(9, 'Fantaisie'),
(10, 'Documentaire/Historique');

-- --------------------------------------------------------

--
-- Structure de la table `Favorites`
--

CREATE TABLE `Favorites` (
  `id_profile` int(11) NOT NULL,
  `id_movie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Favorites`
--

INSERT INTO `Favorites` (`id_profile`, `id_movie`) VALUES
(10, 7);

-- --------------------------------------------------------

--
-- Structure de la table `Movie`
--

CREATE TABLE `Movie` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `director` varchar(255) DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `trailer` varchar(255) DEFAULT NULL,
  `min_age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `Movie`
--

INSERT INTO `Movie` (`id`, `name`, `year`, `length`, `description`, `director`, `id_category`, `image`, `trailer`, `min_age`) VALUES
(7, 'Interstellar', 2014, 169, 'Un groupe d\'explorateurs voyage à travers un trou de ver pour sauver l\'humanité.', 'Christopher Nolan', 4, 'interstellar.jpg', 'https://www.youtube.com/embed/VaOijhK3CRU?si=76Ke4uw4LYjuLuQ6', 12),
(12, 'La Liste de Schindler', 1993, 195, 'Un industriel allemand sauve des milliers de Juifs pendant l\'Holocauste.', 'Steven Spielberg', 3, 'schindler.webp', 'https://www.youtube.com/embed/ONWtyxzl-GE?si=xC3ASGGPy5Ib-aPn', 16),
(17, 'Your Name', 2016, 107, 'Deux adolescents échangent leurs corps de manière mystérieuse.', 'Makoto Shinkai', 5, 'your_name.jpg', 'https://www.youtube.com/embed/AROOK45LXXg?si=aUQyGk2VMCb_ToUL', 10),
(27, 'Le Bon, la Brute et le Truand', 1966, 161, 'Trois hommes se lancent à la recherche d\'un trésor caché.', 'Sergio Leone', 8, 'bon_brute_truand.jpg', 'https://www.youtube.com/embed/WA1hCZFOPqs?si=TwNZAoM4oj4KpGja', 12),
(49, 'La haine', 1995, 98, 'Le récit se déroule au lendemain d\'une nuit d\'émeutes opposant des jeunes à la police, dans la cité des Muguets à Chanteloup-les-Vignes, en région parisienne. Ces émeutes sont consécutives à la tentative d\'assassinat commise par un inspecteur du commissariat qui a provoqué la mise en coma d\'un jeune résident de la cité, Abdel Ichaha, lors d\'une garde à vue. Pendant les émeutes, un policier perd son revolver.', 'Mathieu Kassovitz', 3, 'la_haine.jpg', 'https://www.youtube.com/embed/y88-ZYB0R9I?si=6-1krna7L5oePHfc', 16),
(58, 'Memories of Murder', 2003, 132, 'En octobre 1986, deux femmes sont retrouvées violées et assassinées dans la périphérie d\'une petite ville sud-coréenne. Le détective local Park Doo-man, qui n\'a jamais travaillé sur une affaire aussi grave, est dépassé. Les preuves sont mal récoltées, les méthodes d\'enquête sont inefficaces et la technologie médico-légale est quasiment inexistante. Park prétend être capable de repérer des suspects par simple contact visuel. Il interroge un garçon handicapé mental, Baek Kwang-ho, qui a l\'habitude de suivre l\'une des deux victimes en ville. Le partenaire de Park, Cho, frappe Baek, le forçant à avouer.', 'Bong Joon-ho', 3, 'memories_of_murder.jpg', 'https://www.youtube.com/embed/5HsBTgxojj8?si=oMHGemiqT9Ntcsvi', 16),
(59, 'The Revenant', 2015, 156, 'Des trappeurs menés par le capitaine et négociant en fourrures Andrew Henry, subissent de lourdes pertes lors d\'une attaque menée par les Amérindiens dans une Amérique profondément sauvage. En effet, tandis que le trappeur Hugh Glass chasse un cerf dans les bois avec plusieurs personnes dont son fils métis Hawk, leur campement établi près d\'une rivière est brutalement attaqué par des Arikaras (des Amérindiens du Dakota du Nord) qui massacrent sans pitié et pillent le camp. Trente-trois hommes périssent tandis que Glass, Hawk, Henry, John Fitzgerald, Jim Bridger et quelques autres hommes parviennent à prendre la fuite en bateau.', 'Alejandro González Iñárritu', 1, 'the_revenant.jpg', 'https://www.youtube.com/embed/GMjAQ_-M4uA?si=aRsQCXW_QpcB3pQx', 16),
(63, 'Mystic River', 2003, 137, 'Boston, en 1975. Jimmy Markum, Sean Devine et Dave Boyle sont trois amis d\'enfance, mais un jour alors qu\'ils jouaient dans la rue, Dave est enlevé par deux étranges policiers, sous les yeux de ses deux amis impuissants.\r\nPendant un temps, Jimmy bascula dans la délinquance, tandis que Sean choisit la voie de la police. De son côté, Dave se renferma sur lui-même, enchaîna les petits boulots et vécut longtemps chez sa mère avant d’épouser Celeste.', 'Clint Eastwood', 6, 'mystic_river.jpg', 'https://www.youtube.com/embed/yniM_7MzOgo?si=N53YwWdgWwylODZm', 16),
(65, 'La Communauté de l\'anneau', 2001, 228, 'Le hobbit Bilbon reprend la narration soixante ans plus tard, en 2940 du Troisième Âge, sur la Terre du Milieu, dans la paisible région de la Comté, où vit le hobbit Frodon Sacquet. Comme tous les hobbits, Frodon est un bon vivant, amoureux de la terre bien cultivée et de la bonne chère. Orphelin alors qu\'il n\'était qu\'un enfant, il s\'est installé à Cul-de-Sac chez son oncle Bilbon, connu de toute la Comté pour les aventures extraordinaires qu\'il a vécues étant jeune et les trésors qu\'il en a tirés 60 ans plus tôt. Le jour de ses 111 ans, Bilbon donne une fête grandiose à laquelle est convié le puissant magicien Gandalf le Gris. C\'est en ce jour particulier que Bilbon décide de disparaitre (au sens littéral) devant ses congénères et de se retirer chez les Elfes pour y finir sa vie. Il laisse en héritage à Frodon son trou de Hobbit ainsi que son anneau (avec une grande réticence), qu\'il a autrefois trouvé dans la caverne d\'une créature nommée Gollum dans les Monts Brumeux, et qui a le pouvoir de rendre invisible quiconque le porte à son doigt.', 'Peter Jackson', 9, 'la_communaute_de_l\'anneau.jpg', 'https://www.youtube.com/embed/nalLU8i4zgs?si=jwJ9szFlk4IFmRVf', 10),
(66, 'The Fabelmans', 2022, 151, 'En 1952 dans le New Jersey, le jeune Samuel « Sammy » Fabelman se rend avec ses parents, Mitzi et Burt, au cinéma pour la première fois. Il assiste, subjugué, à la projection du film Sous le plus grand chapiteau du monde de Cecil B. DeMille, dont une scène impliquant un accident de train le marque particulièrement. La nuit suivante, Sammy demande à ses parents un train électrique en guise de cadeau pour Hanoucca. Il recrée alors la scène du film avec le train, qu\'il filme avec la caméra de son père pour la visualiser à plusieurs reprises, afin de se remettre de son choc. Sammy découvre alors la joie qu\'il éprouve à se tenir derrière la caméra, tournant de petites mises en scène avec ses sœurs.', 'Steven Spielberg', 10, 'the_fabelmans.jpg', 'https://www.youtube.com/embed/He4maFN1wGQ?si=FMTp1lLVfz2qhSCA', 10),
(67, 'Once Upon a Time… in Hollywood', 2019, 171, '1969, à Hollywood. Le mouvement hippie est à son apogée et manifeste massivement contre la guerre du Viêt Nam, toujours en cours. Richard Nixon est élu nouveau président des États-Unis, succédant à Lyndon B. Johnson, tandis que les émeutes de Stonewall débouchent sur le militantisme homosexuel.', 'Quentin Tarantino', 1, 'once_upon.jpg', 'https://www.youtube.com/embed/Y7Al_I91Asg?si=BncOHGWrOakluUTN', 14),
(68, 'Pulp Fiction', 1994, 164, 'Deux truands, Jules Winnfield (Samuel L. Jackson) et son ami Vincent Vega (John Travolta), qui revient d\'Amsterdam, ont pour mission de récupérer une mallette au contenu mystérieux et de la rapporter à Marsellus Wallace (Ving Rhames), leur patron. Avant de commencer leur affaire, ils discutent de tout et de rien, Vincent qui revient d’Amsterdam parle des différences entre la vie en Europe et aux États-Unis ainsi que du système métrique des hamburgers à Paris, Jules lui raconte une histoire dans laquelle Marsellus aurait jeté un dénommé Tony Rocky Horror de sa fenêtre pour avoir massé les pieds de sa femme Mia (Uma Thurman). Les deux compères se lancent alors dans un débat sur le massage des pieds des femmes et Vincent confie à Jules que Marsellus l\'a chargé de tenir compagnie à Mia pour une soirée.', '	Quentin Tarantino', 1, 'pulp_fiction.jpg', 'https://www.youtube.com/embed/tGpTpVyI_OQ?si=j432cXJ5MUKeDJKx', 16),
(69, 'American Sniper', 2014, 132, 'Chris Kyle est un champion de rodéo vivant au Texas. Élevé avec son frère cadet dans la foi chrétienne, il se voit inculquer par son père certains principes. Celui-ci lui distingue trois sortes d\'hommes : les loups, les moutons et les chiens de bergers, qui protègent les moutons contre les loups. Il veut que ses enfants soient des chiens de berger et leur apprend le maniement des armes et à chasser.', 'Clint Eastwood', 1, 'american_sniper.jpg', 'https://www.youtube.com/embed/v4ig1Hxdmj4?si=RBgg34zXvON2FBvL', 15),
(70, 'Le Parrain', 1972, 175, 'À la fin de l’été 1945, dans sa résidence de Long Island dans l’État de New York, Don Vito Corleone, surnommé « le Parrain », est le chef de la famille Corleone, une organisation criminelle appartenant à la mafia américaine. Entouré de toute sa famille et d\'invités, le Don organise chez lui le mariage de sa fille Constanzia (dite « Connie ») à Carlo Rizzi, un des bookmaker de la « famille » Corleone. Conformément à la tradition, aucun Sicilien ne peut refuser de rendre un service le jour du mariage de sa fille. Ainsi, Don Corleone, entouré de son fils aîné Santino (dit « Sonny ») et de son fils adoptif, l\'avocat et consigliere (conseiller) de la famille, Tom Hagen, reçoit tour à tour dans son bureau plusieurs personnes cherchant à obtenir ses faveurs.', 'Francis Ford Coppola', 1, 'le_parrain.jpg', 'https://www.youtube.com/embed/bmtuIhesQWA?si=-bZEu32qyxXJhlDn', 16),
(71, 'Kill Bill', 2003, 111, 'Dans la petite chapelle de Two Pines perdue au milieu du désert, à El Paso (Texas), alors que se déroule la répétition d\'une cérémonie de mariage, des assassins surgissent et tirent impitoyablement et sans raison apparente sur toutes les personnes présentes. La Mariée, qui est enceinte, survit à ses blessures mais sombre dans le coma. Toutefois, la Mariée n\'est pas une personne ordinaire. Autrefois tueuse à gages dans une organisation secrète, le Détachement International des Vipères Assassines, elle est une combattante hors pair. Sortant du coma quatre années plus tard, elle n\'a plus qu\'un seul but, se venger de ses anciens complices, dans lesquels elle a reconnu les assassins de Two Pines, et surtout, tuer Bill, leur chef, qui est également le père de l\'enfant qu\'elle portait et qu\'elle croit avoir perdu à la suite de l\'attaque dans la chapelle.', 'Quentin Tarantino', 1, 'kill_bill.jpg', 'https://www.youtube.com/embed/bmtuIhesQWA?si=-bZEu32qyxXJhlDn', 16),
(72, 'American History X', 1999, 119, 'La scène d\'ouverture en noir et blanc montre Derek, un skin head néo-nazi, tuer deux noirs qui ont tenté de forcer sa voiture, sous les yeux de son petit frère choqué et incrédule. Le film passe ensuite à la couleur et l\'histoire se déroule 3 ans plus tard ; nous retrouvons Danny, dix-sept ans, désormais partisan du suprémacisme blanc, assis à l\'extérieur du bureau du principal, où Murray, son professeur d\'histoire, explique au Docteur Sweeney, le principal, que Danny a rédigé une dissertation faisant l\'éloge du livre Mein Kampf d\'Adolf Hitler. Après leur discussion, Sweeney fait entrer Danny et l\'informe qu\'il sera désormais son professeur d\'histoire et nomme son cours « American History X » ; le premier devoir de Danny sera d\'écrire une rédaction sur l\'impact des décisions de son frère sur sa vie, sous peine d\'être renvoyé de l\'école secondaire de Venice Beach.', 'Tony Kaye', 3, 'american_history.jpg', 'https://www.youtube.com/embed/GlOT1vpy9oM?si=SuBqWmweNrO7dZ92', 16),
(73, 'The Grand Budapest Hotel', 2014, 99, 'Dans un cimetière de l\'ancienne nation de Zubrowka dans l\'Europe centrale, une jeune femme se rend sur la tombe d\'un écrivain renommé, connu simplement sous le nom d\'« Auteur », elle lit son livre le plus cher : Grand Budapest Hotel. Le livre raconte les vacances de l\'auteur en 1968 dans un hôtel autrefois grandiose et alors délabré. Il y rencontre le propriétaire, Zero Moustafa, qui, au cours d\'un dîner, lui raconte l\'histoire de sa fortune.', 'Wes Anderson', 8, 'budapest_hotel.jpg', 'https://www.youtube.com/embed/Lo1nz-scO4Q?si=MuJ4P1m1LXSkmF_d', 16),
(74, 'Ran', 1985, 162, 'Au XVIe siècle, dans un Japon ravagé par la guerre, le vieux daimyo Hidetora Ichimonji décide de céder le contrôle de son fief à ses trois fils, Taro, Jiro et Saburo, afin de finir ses jours heureux et en paix. Mais les dissensions entre les trois frères plongent rapidement leurs familles, leurs foyers et la région dans le chaos.', 'Akira Kurosawa', 3, 'ran.jpg', 'https://www.youtube.com/embed/kBVz49fRDqo?si=s4f46cN2ANPmypuH', 16),
(75, 'Million Dollar Baby', 2004, 132, 'Autrefois entraîneur de boxe réputé, Frankie (Clint Eastwood) dirige une petite salle de boxe régionale avec son meilleur ami, un ancien boxeur nommé Scrap (Morgan Freeman). Leur quotidien est bouleversé par l\'arrivée d\'une jeune boxeuse appelée Margaret « Maggie » Fitzgerald (Hilary Swank), déterminée mais maladroite. Maggie arrive tout droit du Missouri et vient de démissionner de son job de serveuse. Elle rejoint Los Angeles pour se mettre à la boxe.', 'Clint Eastwood', 3, 'million_dollar.jpg', 'https://www.youtube.com/embed/VqYVHLqnBVI?si=SFZwlopC2dQdtBt_', 16),
(76, 'Les Infiltrés', 2006, 150, 'À Boston, une lutte sans merci oppose la police à la mafia irlandaise dirigée par Frank Costello, parrain des quartiers sud. Ce dernier va racketter une épicerie et repère un enfant, Colin Sullivan. Il lui fait comprendre comment, selon lui, le monde marche.', 'Martin Scorsese', 6, 'les_infiltres.jpg', 'https://www.youtube.com/embed/iojhqm0JTW4?si=MDb2GJOT79dsfyNu', 16),
(77, 'No country for old men', 2007, 122, 'Texas, 1980. Anton Chigurh (Javier Bardem), tueur à gages psychopathe, est arrêté sur la route en possession d\'une bouteille à air comprimée par l\'adjoint du shérif Bell. Mais le tueur n\'hésite pas à tuer ce dernier pour s\'évader. Il tuera peu après un autre automobiliste pour lui prendre sa voiture, et jouera le lendemain à pile ou face avec un pompiste effrayé. Pendant ce temps, alors qu\'il chasse près de la frontière du Mexique, Llewelyn Moss (Josh Brolin) découvre par hasard les cadavres d\'une bande de trafiquants de drogue et une mallette contenant deux millions de dollars, dont il s\'empare. Rentré le soir chez lui, pris de remords à la demande d\'un trafiquant mourant d\'avoir de l\'eau, il décide de retourner sur la scène du crime. Mais il se retrouve poursuivi par des complices des trafiquants mexicains et prend la fuite, tandis que sa femme Carla Jean (Kelly Macdonald) se réfugie chez sa mère à Odessa.', 'Joel et Ethan Coen', 6, 'no_country.jpg', 'https://www.youtube.com/embed/HUWbmT6m7-g?si=QyvDmwJf6V4laqWP', 16),
(78, 'Manchester by the Sea', 2016, 135, 'Lee Chandler travaille comme homme à tout faire dans plusieurs immeubles de la banlieue de Boston. Il est souvent bourru et impoli avec les résidents chez qui il vient faire des réparations ce qui lui vaut une réprimande de la part de son chef. Un peu plus tard, il déclenche une bagarre dans un bar sous un prétexte futile. Il apprend que son frère Joe, un pêcheur qui habite à Manchester-by-the-Sea, a subi une crise cardiaque.', 'Kenneth Lonergan', 3, 'manchester.jpg', 'https://www.youtube.com/embed/5OwaFumyOOw?si=bxNF6tFLxXp6vftY', 17),
(79, 'La vie est belle ', 1997, 116, 'En 1939, dans l\'Italie fasciste, le jeune juif italien Guido Orefice arrive à Arezzo, en Toscane, pour travailler avec son oncle Eliseo dans un hôtel-restaurant. Il est comique et vif, et tombe amoureux de Dora, une jeune institutrice étouffée par le conformisme familial. Plus tard, Guido la revoit dans la ville où elle est enseigne s\'apprêtant à se fiancer à Rodolfo, un fonctionnaire local riche mais arrogant avec lequel il se heurte régulièrement. Guido met en place de nombreuses « coïncidences » pour montrer son intérêt pour Dora.', 'Roberto Benigni', 2, 'la_vie_est_belle.jpg', 'https://www.youtube.com/embed/8CTjcVr9Iao?si=IuG6x2XJU7VSscuH', 10),
(80, 'Les Évadés', 1994, 142, '1947. Andy Dufresne, un banquier américain, est jugé coupable du meurtre de son épouse et de l\'homme avec qui celle-ci le trompait. Pour ce double meurtre, et bien qu\'il ait clamé son innocence depuis le début, Dufresne est condamné à subir deux peines de prison à vie consécutives.', 'Frank Darabont', 3, 'les_evades.jpg', 'https://www.youtube.com/embed/PLl99DlL6b4?si=Pw8VSDabdAhaU3uB', 14),
(81, 'Le Pianiste', 2002, 144, 'Le film raconte l\'histoire du pianiste polonais juif Władysław Szpilman, dit aussi Wladek. L\'histoire se déroule à Varsovie en Pologne pendant la Seconde Guerre mondiale. W. Szpilman est alors le pianiste officiel de la Radio polonaise et une figure connue du milieu culturel polonais. Lorsque les nazis s\'emparent de la ville, ils suppriment progressivement les droits des Juifs, puis les parquent dans le ghetto créé pour les regrouper en vue de leur extermination.', 'Roman Polanski', 3, 'le_pianist.jpg', 'https://www.youtube.com/embed/QGMRmp6uYc8?si=y4fwdBJI8wEoJ7Kj', 15),
(82, 'Warrior', 2011, 140, 'Ancien marine hanté par un passé tragique, Tommy revient à Pittsburgh et demande à son père, un ex-alcoolique, et entraineur de le préparer pour un tournoi d\'arts martiaux mixtes qui lui permettrait de gagner une fortune. Son frère aîné, Brendan, est également ancien spécialiste de la discipline. Ce dernier, professeur de sciences physiques, décide, lui aussi, de s\'engager dans la compétition afin d\'éviter la saisie de sa maison. Même si les années ont passé, les rancœurs et les récriminations n\'ont rien perdu de leur virulence et Brendan et Tommy n\'ont plus grand-chose en commun.', 'Gavin O\'Connor', 1, 'warrior.jpg', 'https://www.youtube.com/embed/ifnHTCiT61g?si=EJ1a4vcv_jVnzoBw', 15),
(83, 'Lion', 2016, 118, 'En 1986, Saroo vit avec son frère Guddu, sa mère et sa petite sœur à Khandwa, en Inde. Guddu et Saroo volent du charbon dans des trains de marchandises pour l\'échanger contre du lait et de la nourriture. Une nuit Saroo harcèle son frère qui va travailler la nuit pour le laisser venir aussi. Guddu refuse au début, mais finit par céder, et ils arrivent à une gare voisine où Saroo est trop fatigué pour rester éveillé. Guddu place Saroo sur un banc et lui dit d\'attendre son retour. Saroo s\'endort rapidement et quand il se réveille, Guddu n\'est pas là.', 'Garth Davis', 8, 'lion.jpg', 'https://www.youtube.com/embed/skz6h3UVQ0U?si=oPnjDeDR426gYRkE', 9),
(84, 'Vol au-dessus d\'un nid de coucou', 1975, 133, 'En 1963, Randall P. McMurphy, un sociopathe de 38 ans condamné à une peine de travaux forcés pour diverses agressions et un viol sur mineur, simule l\'aliénation pour se faire interner et ainsi sortir de l\'établissement pénitentiaire où il était incarcéré. Le directeur de l\'asile n\'est pas dupe, mais il accepte tout de même qu\'on évalue sa santé mentale pour savoir si sa place est à l\'asile ou en prison.', 'Miloš Forman', 3, 'nid_de_coucou.jpg', 'https://www.youtube.com/embed/LQEYisXqdg8?si=iyKCDupiEzdQMQre', 15),
(85, 'Taxi Driver', 1976, 113, 'Travis Bickle, jeune homme du Midwest et ancien marine, est chauffeur de taxi de nuit à New York. Insomniaque et solitaire, il rencontre un jour Betsy, une assistante du sénateur Charles Palantine, candidat à la présidentielle. Après un premier rendez-vous pour un café, elle repousse ce chauffeur de taxi après qu\'il l\'a emmenée voir un film pornographique. Renvoyé à sa solitude et confronté à la violence et à la perversion de la nuit new-yorkaise, il achète des armes au marché noir et s\'entraîne à les manier.', 'Martin Scorsese', 6, 'taxi_driver.jpg', 'https://www.youtube.com/embed/T5IligQP7Fo?si=coxFwcZUaWH8D44P', 15),
(86, 'Demolition', 2015, 100, 'Davis Mitchell, un jeune investisseur, tente de comprendre le manque d\'émotions que suscite la mort de sa femme après un accident de la route. Dans sa quête de réponses, il rencontre Karen Moreno, la responsable du service client d\'une boite de distributeurs automatiques et devient étrangement fasciné par la destruction.', 'Jean-Marc Vallée', 3, 'demolition.jpg', 'https://www.youtube.com/embed/1J-oqoIyLco?si=H1NVafMFiH9z-f2C', 15),
(87, '500 Days of Summer', 2009, 95, 'Tom Hansen, un new-yorkais dans la vingtaine, est un jeune homme romantique, partageant auprès de ses amis Paul et McKenzie, et sa jeune sœur Rachel, son rêve de rencontrer la femme idéale. Selon lui, elle devrait partager les mêmes goûts, des films ou la pop britannique. Dans la société où il travaille comme rédacteur de cartes de vœux, il rencontre Summer Finn, la nouvelle assistante de son supérieur. ', 'Marc Webb', 2, '500_days.jpg', 'https://www.youtube.com/embed/PsD0NpFSADM?si=ySYKFqOj56mPSSML', 9),
(88, '2001, l\'Odyssée de l\'espace', 1968, 149, 'L\'intrigue principale du film traite de plusieurs rencontres entre les êtres humains et de mystérieux monolithes noirs, censés influencer l\'évolution humaine, et comprend un voyage vers la planète Jupiter puis « au-delà de l\'infini », à la suite d\'un signal radio émis par un monolithe découvert sur la Lune.', 'Stanley Kubrick', 4, '2001_odyssee.jpg', 'https://www.youtube.com/embed/oR_e9y-bka0?si=Ewq9dge1eCsFO53J', 11),
(89, 'Green Book', 2018, 130, 'L\'histoire se déroule aux États-Unis en 1962. Frank Vallelonga, surnommé « Tony la tchatche », un videur italo-américain de New York, cherche un emploi après la fermeture pour rénovation du Copacabana, la boîte de nuit où il travaillait. Il est invité à un entretien par le Dr Don Shirley, un pianiste d\'origine jamaïcaine qui cherche un chauffeur pour une tournée de huit semaines à travers le Midwest et le Sud profond. Don engage Tony grâce à ses références.', 'Peter Farrelly', 10, 'green_book.jpg', 'https://www.youtube.com/embed/QkZxoko_HC0?si=cp88727c0il00Rck', 9),
(90, 'Requiem for a Dream', 2000, 101, 'Harold Goldfarb, alias Harry, son meilleur ami Tyrone et sa petite amie Marianne (Marion dans la version originale) sont trois consommateurs d\'héroïne. Ils passent leurs journées à se droguer et s\'inventent un paradis artificiel, où ils se sentent invulnérables et heureux. Harry connaît avec Marianne l\'harmonie et le plaisir des sens.', 'Darren Aronofsky', 7, 'requiem.jpg', 'https://www.youtube.com/embed/lPCtg6ICop8?si=k9yTrfrjjVeqUcuc', 14),
(91, 'Se7en', 1995, 127, 'Deux policiers, William Somerset et David Mills, sont chargés d\'une enquête criminelle concernant un tueur en série psychopathe, lequel planifie méthodiquement ses meurtres en fonction des sept péchés capitaux qui sont : la gourmandise, l\'avarice, la paresse, la luxure, l\'orgueil, l\'envie et la colère.', 'David Fincher', 6, 'seven.jpg', 'https://www.youtube.com/embed/INWQQ_JDiws?si=SzXtkuxzXTGLdOTk', 13),
(92, 'Training Day', 2001, 122, 'Jake Hoyt est une jeune recrue idéaliste de la police de Los Angeles. Pour son premier jour, rêvant de passer inspecteur, il obtient une mise à l\'essai de 24 heures, un « training day », auprès du sergent chef Alonzo Harris, une star de la lutte antidrogue, très décoré et un professionnel de la guerre de rues à bord de sa Chevrolet Monte Carlo noire. Pour sa première interpellation, ils ont affaire à de jeunes étudiants ayant acheté du cannabis et du PCP. Alonzo leur saisit leurs drogues.', 'Antoine Fuqua', 6, 'training_day.jpg', 'https://www.youtube.com/embed/DXPJqRtkDP0?si=CUs25FoGas8PKgso', 14),
(93, 'Le Dernier Roi d\'Écosse', 2006, 125, 'Nicholas Garrigan (personnage fictif), un jeune médecin écossais tout juste diplômé, débarque en Ouganda en quête d\'aventures. Peu après son arrivée, alors qu\'il travaille dans un hôpital de brousse, il fait la connaissance d\'Idi Amin Dada qui vient de s\'emparer du pouvoir par un coup d\'État et qui lui propose de devenir son médecin personnel.', 'Kevin Macdonald', 10, 'last_king.jpg', 'https://www.youtube.com/embed/iV_QgKJFZP0?si=z5lhyScW91jCrdNO', 14),
(94, 'Dunkerque', 2017, 107, 'Peu après le début de la Seconde Guerre mondiale, en mai 1940, environ 400 000 soldats britanniques, canadiens, français et belges se retrouvent encerclés par les troupes allemandes dans la poche de Dunkerque. L\'opération Dynamo est mise en place pour évacuer le Corps expéditionnaire britannique (CEB) vers l\'Angleterre.', 'Christopher Nolan', 10, 'dunkerque.jpg', 'https://www.youtube.com/embed/chRUCIk3K94?si=qn8RuKTFBCOxv88E', 13),
(95, 'Inglourious Basterds', 2009, 159, 'Dans la France occupée, Shosanna Dreyfus, une jeune juive française, assiste à l’exécution de sa famille sous les ordres du colonel SS Hans Landa. Mais elle parvient à s’échapper et s’enfuit à Paris, où elle se construit une nouvelle identité, devenant propriétaire d’un cinéma de quartier.', 'Quentin Tarantino', 1, 'inglorious_basterds.jpg', 'https://www.youtube.com/embed/BiPUoLI9eGM?si=eVT2wroHWp5U_3vQ', 13),
(96, 'Les Huit Salopards', 2015, 167, 'Le film se déroule quelques années après la guerre de Sécession. Le cocher O.B. Jackson conduit dans sa diligence le chasseur de primes John Ruth et sa prisonnière, Daisy Domergue, jusqu\'au village de Red Rock dans le Wyoming. Ils rencontrent sur la route le major Marquis Warren, un ancien soldat de l\'Union et chasseur de primes, puis Chris Mannix, le nouveau shérif de Red Rock.', 'Quentin Tarantino', 1, 'huit_salopards.jpg', 'https://www.youtube.com/embed/JoLvEad4-aM?si=u1HBDpcJG0CxAsrN', 13),
(97, 'Eternal Sunshine of the Spotless Mind', 2004, 108, 'Un matin, Joel Barish, timide et routinier, décide, sans raison particulière, de ne pas aller au travail et de prendre le train pour Montauk. Là-bas, il rencontre Clementine Kruczynski, extravertie, excessive et délurée. Ils sont irrémédiablement attirés l\'un vers l\'autre et après une soirée sous les étoiles, sur un lac gelé, ils tombent amoureux.', 'Michel Gondry', 2, 'eternal_sunshine.jpg', 'https://www.youtube.com/embed/vVP-g0gSlb8?si=mVMH8g5hSeeWmD7T', 9),
(98, 'Arnaques, Crimes et Botanique', 1998, 107, 'Eddie, le fils du barman J. D., est un génie des cartes. Avec l\'aide de ses amis Soap, Bacon et Tom, il a réuni la somme de 100 000 £ comme droit d\'entrée à la table de poker du caïd Harry « la Hache ». Mais celui-ci s\'est renseigné sur Eddie et prépare avec son bras droit, Barry « le Baptiste », une tricherie. Ainsi, Eddie perd tout à la suite de la tricherie.', 'Guy Ritchie', 6, 'arnaques_crimes.jpg', 'https://www.youtube.com/embed/nzDDaaUo7BA?si=gGfM5-k5HbGiQqpz', 12),
(99, 'Drive', 2011, 95, 'Un jeune mécanicien taciturne (Ryan Gosling) travaille dans un petit garage de Los Angeles et effectue à l\'occasion des cascades pour des acteurs hollywoodiens. Mais de nuit, il sert aussi de conducteur (driver en anglais) à des membres du crime organisé.', 'Nicolas Winding Refn', 6, 'drive.jpg', 'https://www.youtube.com/embed/4Wz990aqSDA?si=11ZOh03ewC93USEO', 12),
(100, 'Beasts of No Nation', 2015, 136, 'Au Ghana, pays africain situé à l\'Est de la Côte d\'Ivoire, Agu est rattrapé par une guerre civile qu\'il ne comprend pas. Devenu orphelin, il est happé par la guerre, qui le transforme en enfant soldat sous les ordres d\'un charismatique et psychotique commandant d\'une armée rebelle.', 'Cary Joji Fukunaga', 10, 'beast_nation.jpg', 'https://www.youtube.com/embed/kC3S3df08sE?si=zNebiMkL0617oA1B', 12),
(101, 'Princesse Mononoké', 1997, 134, 'L\'histoire se déroule dans le Japon médiéval (ère Muromachi). Ashitaka, le prince de la tribu des Emishis, peuple indigène du nord-est de Honshū, est frappé d\'une malédiction après avoir tué Nago, un dieu sanglier devenu un démon : son bras est animé d\'une force surnaturelle, mais est rongé par l\'entité démoniaque. La chamane du village le dit condamné à mourir et lui conseille de quitter le village afin d\'aller chercher à l\'ouest la cause de la colère de la nature et l\'espoir de trouver la raison de sa malédiction.', 'Hayao Miyazaki', 5, 'mononoke.jpg', 'https://www.youtube.com/embed/DgJS-CqLHwU?si=O_bcWQLR5vgtUy6A', 8),
(102, 'Le Voyage de Chihiro', 2001, 124, 'Chihiro Ogino (荻野 千尋, Ogino Chihiro), dix ans, boude à l’arrière de la voiture de ses parents[1] ; ces derniers ont décidé de déménager à la campagne, et la petite fille regrette son ancienne école. En cherchant à rejoindre leur nouvelle maison, ils se perdent au bout d’une route tortueuse et arrivent devant un tunnel. Le traversant, malgré la réticence de Chihiro effrayée, ils arrivent dans ce qu’ils pensent être un parc à thèmes abandonné.', 'Hayao Miyazaki', 5, 'chihiro.jpg', 'https://www.youtube.com/embed/5-cro68n7CE?si=39X9NSUxaq_bDr0-', 8),
(103, 'Porco Rosso', 1992, 93, 'Le film s\'ouvre sur le texte suivant : « Ce film conte une histoire du porc vaillant surnommé « le Porc rouge », qui se bat contre les pirates de ciel, pour son honneur, pour sa Madone d\'adoration et pour ses biens. La scène se passe en les Mers Méditerranées à l\'époque où l\'hydravion gouverne les eaux de mer. »', 'Hayao Miyazaki', 5, 'porco_rosso.jpg', 'https://www.youtube.com/embed/3LRyNwYg1f8?si=qg2Mv_I50I3tBjQf', 8),
(104, 'Les Deux Tours', 2002, 235, 'Après être entrés en Emyn Muil, Frodon Sacquet et Sam Gamegie sont perdus, mais sont suivis par la créature Gollum. Ce dernier, qui essaye de leur voler l\'Anneau par la force, s\'en prend à eux une nuit. Vaincu, il promet aux Hobbits de les guider jusqu\'au Mordor. Après avoir traversé l\'Emyn Muil et les marais des Morts, ils arrivent à la Morannon, la porte noire du Mordor.', 'Peter Jackson', 9, 'les_deux_tours.jpg', 'https://www.youtube.com/embed/wqMsK0KyZi8?si=yh8VTDopy3CmV2Pz', 11),
(105, 'Le Retour du roi', 2003, 263, 'La première scène du film montre les Hobbits Sméagol et Déagol qui pêchent sur le fleuve, quand Déagol, qui a fait une prise, est entrainé dans l\'eau par le poisson. Sous l\'eau, Déagol est attiré par l\'Anneau unique qui gît au fond, le ramasse et revient à la surface. Sméagol le rejoint, voit l\'Anneau que son ami a récupéré et lui demande de le lui donner. Mais devant le refus de Déagol, les deux amis se battent et Sméagol étrangle mortellement son ami.', 'Peter Jackson', 9, 'le_retour_du_roi.jpg', 'https://www.youtube.com/embed/KYJCe_PLVaE?si=zis47PbbzBDp0Gm8', 11);

-- --------------------------------------------------------

--
-- Structure de la table `Profiles`
--

CREATE TABLE `Profiles` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Profiles`
--

INSERT INTO `Profiles` (`id`, `name`, `image`, `age`) VALUES
(9, 'Manu', 'photo2.jpg', '10'),
(10, 'Madame', 'photo1.jpg', '15'),
(11, 'Huzeyfe le Goat', 'photo3.jpg', '1450'),
(26, 'La Val king of Goat', 'photo4.jpg', '18');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Favorites`
--
ALTER TABLE `Favorites`
  ADD PRIMARY KEY (`id_profile`,`id_movie`),
  ADD KEY `id_movie` (`id_movie`);

--
-- Index pour la table `Movie`
--
ALTER TABLE `Movie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_category` (`id_category`);

--
-- Index pour la table `Profiles`
--
ALTER TABLE `Profiles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Category`
--
ALTER TABLE `Category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `Movie`
--
ALTER TABLE `Movie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT pour la table `Profiles`
--
ALTER TABLE `Profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Favorites`
--
ALTER TABLE `Favorites`
  ADD CONSTRAINT `Favorites_ibfk_1` FOREIGN KEY (`id_profile`) REFERENCES `Profiles` (`id`),
  ADD CONSTRAINT `Favorites_ibfk_2` FOREIGN KEY (`id_movie`) REFERENCES `Movie` (`id`);

--
-- Contraintes pour la table `Movie`
--
ALTER TABLE `Movie`
  ADD CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `Category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
