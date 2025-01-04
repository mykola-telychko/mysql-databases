CREATE TABLE `author` (`id` int(11), `author` text);
CREATE TABLE `authors` ( `id` int(11) NOT NULL, `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `book` (
`id` int(11)
,`title` varchar(255)
,`description` text
,`body` text
,`price` float
,`image` varchar(255)
,`genre` varchar(255));
CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `body` text NOT NULL,
  `price` float NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `books_authors` (`book_id` int(11) NOT NULL,`author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `books_genres` (`book_id` int(11) NOT NULL,`genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `book_cat` (
`id` int(11),`title` varchar(255),`description` text
,`body` text,`price` float,`image` varchar(255),`id_cat` int(11));
CREATE TABLE `genres` (`id` int(11) NOT NULL, `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `wishes` text NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `date` date NOT NULL,
  `session_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `search` (`id` int(11),`title` varchar(255),`author` text);
CREATE TABLE `users` (
  `id` int(3) NOT NULL,
  `login` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `author`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `author`  AS  select `books_authors`.`book_id` AS `id`,group_concat(`authors`.`name` separator ',') AS `author` from (`authors` join `books_authors`) where (`authors`.`id` = `books_authors`.`author_id`) group by `books_authors`.`book_id` ;
DROP TABLE IF EXISTS `book`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `book`  AS  select `books`.`id` AS `id`,`books`.`title` AS `title`,`books`.`description` AS `description`,`books`.`body` AS `body`,`books`.`price` AS `price`,`books`.`image` AS `image`,`genres`.`name` AS `genre` from ((`books` join `books_genres`) join `genres`) where ((`books`.`id` = `books_genres`.`book_id`) and (`books_genres`.`genre_id` = `genres`.`id`)) ;
DROP TABLE IF EXISTS `book_cat`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `book_cat`  AS  select `books`.`id` AS `id`,`books`.`title` AS `title`,`books`.`description` AS `description`,`books`.`body` AS `body`,`books`.`price` AS `price`,`books`.`image` AS `image`,`books_genres`.`genre_id` AS `id_cat` from (`books` join `books_genres` on((`books`.`id` = `books_genres`.`book_id`))) ;
DROP TABLE IF EXISTS `search`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `search`  AS  select `book_cat`.`id` AS `id`,`book_cat`.`title` AS `title`,`author`.`author` AS `author` from (`book_cat` join `author` on((`book_cat`.`id` = `author`.`id`))) ;
ALTER TABLE `authors` ADD PRIMARY KEY (`id`); ALTER TABLE `books` ADD PRIMARY KEY (`id`);
ALTER TABLE `books_authors` ADD KEY `book_id` (`book_id`), ADD KEY `author_id` (`author_id`);
ALTER TABLE `books_genres` ADD KEY `book_id` (`book_id`), ADD KEY `genre_id` (`genre_id`);
ALTER TABLE `genres` ADD PRIMARY KEY (`id`); ALTER TABLE `orders` ADD PRIMARY KEY (`id`);
ALTER TABLE `authors` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;
ALTER TABLE `books` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;
ALTER TABLE `orders` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `books_authors`
  ADD CONSTRAINT `books_authors_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `books_authors_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `books_genres`
  ADD CONSTRAINT `books_genres_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `books_genres_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`);
COMMIT;

