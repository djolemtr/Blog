--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `authorities`
--

CREATE TABLE `authorities` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `authority` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authorities`
--

INSERT INTO `authorities` (`id`, `username`, `authority`) VALUES
(39, 'maja', 'ROLE_user'),
(40, 'nenad', 'ROLE_user'),
(51, 'milos', 'ROLE_user'),
(53, 'admin', 'ROLE_admin');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `priority`, `description`) VALUES
(2, 'Uncategorized', 1, 'do not change'),
(3, 'Technology', 2, NULL),
(4, 'Science', 5, 'space, climate change, earth etc.'),
(5, 'Music', 6, NULL),
(6, 'Apps', 1, NULL),
(7, 'Mobile', 4, NULL),
(8, 'PC', 3, NULL),
(9, 'Apple', 7, 'apple products related');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `content` text DEFAULT NULL,
  `id_post` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `name` varchar(15) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `content`, `id_post`, `date`, `enabled`, `name`, `email`) VALUES
(20, 'Test 2', 26, '2023-10-25', 1, 'Brad', 'brad@email.com'),
(21, 'Test 1', 26, '2023-10-25', 1, 'John', 'john@mail.com'),
(22, 'Test', 29, '2023-10-27', 1, 'Aca', 'aca@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `isSeen` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(300) DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  `id_author` varchar(45) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `important` tinyint(1) DEFAULT NULL,
  `comments` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `formattedDate` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `image`, `id_category`, `id_author`, `description`, `views`, `enabled`, `important`, `comments`, `content`, `date`, `formattedDate`) VALUES
(16, 'The Nostalgic, Messy Fun of Olivia Rodrigo\'s Guts', 'https://media.pitchfork.com/photos/650c52c79937f59a00c2ccb1/2:1/w_2560%2Cc_limit/pitchfork-review-template_Wide.png', 5, 'maja', 'In this episode of the Pitchfork Review podcast, our critics discuss how the pop-rock star\'s new album captures the spectacular drama of being a girl in the world.', 7, 1, 1, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem donec massa sapien faucibus et. Facilisis gravida neque convallis a cras semper. Sed blandit libero volutpat sed cras ornare arcu. Faucibus ornare suspendisse sed nisi lacus sed. Lacus vel facilisis volutpat est velit egestas. Sit amet nulla facilisi morbi tempus iaculis urna. Fermentum posuere urna nec tincidunt praesent semper. Integer quis auctor elit sed. Ridiculus mus mauris vitae ultricies leo. Nibh mauris cursus mattis molestie a iaculis at. Odio ut sem nulla pharetra diam. Tellus integer feugiat scelerisque varius morbi enim nunc. Pretium fusce id velit ut tortor. Id volutpat lacus laoreet non curabitur gravida.\r\n\r\nSit amet risus nullam eget felis eget. Ac tortor vitae purus faucibus ornare suspendisse sed nisi. Turpis tincidunt id aliquet risus feugiat. Dignissim cras tincidunt lobortis feugiat vivamus at augue eget arcu. Dolor purus non enim praesent elementum facilisis leo vel. Leo a diam sollicitudin tempor. Amet mauris commodo quis imperdiet massa tincidunt. Convallis tellus id interdum velit laoreet id. In nisl nisi scelerisque eu. Quis auctor elit sed vulputate mi sit. Vitae ultricies leo integer malesuada nunc vel risus commodo. Amet nisl suscipit adipiscing bibendum est ultricies integer. Suspendisse interdum consectetur libero id faucibus nisl. Sapien pellentesque habitant morbi tristique senectus et. Neque volutpat ac tincidunt vitae semper. Suscipit adipiscing bibendum est ultricies integer quis. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Elementum nibh tellus molestie nunc non blandit massa enim nec. Sit amet commodo nulla facilisi nullam vehicula ipsum a arcu.', '2023-09-23', '23 September | 2023'),
(21, 'Why New York and other cities still arent prepared for floods', 'https://duet-cdn.vox-cdn.com/thumbor/0x0:8122x5415/750x500/filters:focal(4061x2708:4062x2709):format(webp)/cdn.vox-cdn.com/uploads/chorus_asset/file/24963119/1697752981.jpg', 2, 'maja', 'New York declared a state of emergency as heavy rain led to flash floods in the city and other parts of the Northeast Friday. The Verge spoke with an expert about why cities shouldn\'t be caught off guard but often are with floods. ', 17, 1, 1, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem donec massa sapien faucibus et. Facilisis gravida neque convallis a cras semper. Sed blandit libero volutpat sed cras ornare arcu. Faucibus ornare suspendisse sed nisi lacus sed. Lacus vel facilisis volutpat est velit egestas. Sit amet nulla facilisi morbi tempus iaculis urna. Fermentum posuere urna nec tincidunt praesent semper. Integer quis auctor elit sed. Ridiculus mus mauris vitae ultricies leo. Nibh mauris cursus mattis molestie a iaculis at. Odio ut sem nulla pharetra diam. Tellus integer feugiat scelerisque varius morbi enim nunc. Pretium fusce id velit ut tortor. Id volutpat lacus laoreet non curabitur gravida.\r\n\r\nSit amet risus nullam eget felis eget. Ac tortor vitae purus faucibus ornare suspendisse sed nisi. Turpis tincidunt id aliquet risus feugiat. Dignissim cras tincidunt lobortis feugiat vivamus at augue eget arcu. Dolor purus non enim praesent elementum facilisis leo vel. Leo a diam sollicitudin tempor. Amet mauris commodo quis imperdiet massa tincidunt. Convallis tellus id interdum velit laoreet id. In nisl nisi scelerisque eu. Quis auctor elit sed vulputate mi sit. Vitae ultricies leo integer malesuada nunc vel risus commodo. Amet nisl suscipit adipiscing bibendum est ultricies integer. Suspendisse interdum consectetur libero id faucibus nisl. Sapien pellentesque habitant morbi tristique senectus et. Neque volutpat ac tincidunt vitae semper. Suscipit adipiscing bibendum est ultricies integer quis. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Elementum nibh tellus molestie nunc non blandit massa enim nec. Sit amet commodo nulla facilisi nullam vehicula ipsum a arcu.', '2023-09-30', '30 September | 2023'),
(25, 'Collapse of the West Antarctic ice sheet is \'unavoidable,\' study finds', 'https://cdn.mos.cms.futurecdn.net/inrLHMp9FcYtvaXr9tub9b-970-80.jpg.webp', 4, 'nenad', 'British Antarctic Survey researchers have found that the rate at which ice is melting and contributing to sea level rise will accelerate in the next century, regardless of actions to limit greenhouse gas emissions.', 19, 1, 1, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem donec massa sapien faucibus et. Facilisis gravida neque convallis a cras semper. Sed blandit libero volutpat sed cras ornare arcu. Faucibus ornare suspendisse sed nisi lacus sed. Lacus vel facilisis volutpat est velit egestas. Sit amet nulla facilisi morbi tempus iaculis urna. Fermentum posuere urna nec tincidunt praesent semper. Integer quis auctor elit sed. Ridiculus mus mauris vitae ultricies leo. Nibh mauris cursus mattis molestie a iaculis at. Odio ut sem nulla pharetra diam. Tellus integer feugiat scelerisque varius morbi enim nunc. Pretium fusce id velit ut tortor. Id volutpat lacus laoreet non curabitur gravida.\r\n\r\nSit amet risus nullam eget felis eget. Ac tortor vitae purus faucibus ornare suspendisse sed nisi. Turpis tincidunt id aliquet risus feugiat. Dignissim cras tincidunt lobortis feugiat vivamus at augue eget arcu. Dolor purus non enim praesent elementum facilisis leo vel. Leo a diam sollicitudin tempor. Amet mauris commodo quis imperdiet massa tincidunt. Convallis tellus id interdum velit laoreet id. In nisl nisi scelerisque eu. Quis auctor elit sed vulputate mi sit. Vitae ultricies leo integer malesuada nunc vel risus commodo. Amet nisl suscipit adipiscing bibendum est ultricies integer. Suspendisse interdum consectetur libero id faucibus nisl. Sapien pellentesque habitant morbi tristique senectus et. Neque volutpat ac tincidunt vitae semper. Suscipit adipiscing bibendum est ultricies integer quis. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Elementum nibh tellus molestie nunc non blandit massa enim nec. Sit amet commodo nulla facilisi nullam vehicula ipsum a arcu.', '2023-10-25', '25 October | 2023'),
(26, 'Amazon River Drought Reveals 2,000-Year-Old Human Faces Sculpted In Stone', 'https://c.ndtvimg.com/2023-10/7kj1s018_ancient-stone-carvings-on-a-rocky-point-of-the-amazon-river_625x300_25_October_23.jpg?im=FaceCrop,algorithm=dnn,width=1200,height=738', 4, 'nenad', 'Human faces sculpted into stone up to 2,000 years ago have appeared on a rocky outcropping along the Amazon River. ', 21, 1, 1, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem donec massa sapien faucibus et. Facilisis gravida neque convallis a cras semper. Sed blandit libero volutpat sed cras ornare arcu. Faucibus ornare suspendisse sed nisi lacus sed. Lacus vel facilisis volutpat est velit egestas. Sit amet nulla facilisi morbi tempus iaculis urna. Fermentum posuere urna nec tincidunt praesent semper. Integer quis auctor elit sed. Ridiculus mus mauris vitae ultricies leo. Nibh mauris cursus mattis molestie a iaculis at. Odio ut sem nulla pharetra diam. Tellus integer feugiat scelerisque varius morbi enim nunc. Pretium fusce id velit ut tortor. Id volutpat lacus laoreet non curabitur gravida.\r\n\r\nSit amet risus nullam eget felis eget. Ac tortor vitae purus faucibus ornare suspendisse sed nisi. Turpis tincidunt id aliquet risus feugiat. Dignissim cras tincidunt lobortis feugiat vivamus at augue eget arcu. Dolor purus non enim praesent elementum facilisis leo vel. Leo a diam sollicitudin tempor. Amet mauris commodo quis imperdiet massa tincidunt. Convallis tellus id interdum velit laoreet id. In nisl nisi scelerisque eu. Quis auctor elit sed vulputate mi sit. Vitae ultricies leo integer malesuada nunc vel risus commodo. Amet nisl suscipit adipiscing bibendum est ultricies integer. Suspendisse interdum consectetur libero id faucibus nisl. Sapien pellentesque habitant morbi tristique senectus et. Neque volutpat ac tincidunt vitae semper. Suscipit adipiscing bibendum est ultricies integer quis. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Elementum nibh tellus molestie nunc non blandit massa enim nec. Sit amet commodo nulla facilisi nullam vehicula ipsum a arcu.', '2023-10-25', '25 October | 2023'),
(27, 'Microsoft now demands to know why you just won\'t use Edge when you inevitably download Chrome using it', 'https://cdn.mos.cms.futurecdn.net/ApQAUiWMkV6GFvhjRVNU3X-970-80.jpg.webp', 6, 'milos', 'Microsoft is making some interesting (and potentially controversial) moves to try and encourage users to its browser, Edge, instead of its arch-rival Google Chrome. If you want to download the installer for Google Chrome using Edge (which is the only web browser pre-installed in Windows 10 and Windows 11), Microsoft now apparently demands to know why in a poll. ', 10, 1, 1, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem donec massa sapien faucibus et. Facilisis gravida neque convallis a cras semper. Sed blandit libero volutpat sed cras ornare arcu. Faucibus ornare suspendisse sed nisi lacus sed. Lacus vel facilisis volutpat est velit egestas. Sit amet nulla facilisi morbi tempus iaculis urna. Fermentum posuere urna nec tincidunt praesent semper. Integer quis auctor elit sed. Ridiculus mus mauris vitae ultricies leo. Nibh mauris cursus mattis molestie a iaculis at. Odio ut sem nulla pharetra diam. Tellus integer feugiat scelerisque varius morbi enim nunc. Pretium fusce id velit ut tortor. Id volutpat lacus laoreet non curabitur gravida.\r\n\r\nSit amet risus nullam eget felis eget. Ac tortor vitae purus faucibus ornare suspendisse sed nisi. Turpis tincidunt id aliquet risus feugiat. Dignissim cras tincidunt lobortis feugiat vivamus at augue eget arcu. Dolor purus non enim praesent elementum facilisis leo vel. Leo a diam sollicitudin tempor. Amet mauris commodo quis imperdiet massa tincidunt. Convallis tellus id interdum velit laoreet id. In nisl nisi scelerisque eu. Quis auctor elit sed vulputate mi sit. Vitae ultricies leo integer malesuada nunc vel risus commodo. Amet nisl suscipit adipiscing bibendum est ultricies integer. Suspendisse interdum consectetur libero id faucibus nisl. Sapien pellentesque habitant morbi tristique senectus et. Neque volutpat ac tincidunt vitae semper. Suscipit adipiscing bibendum est ultricies integer quis. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Elementum nibh tellus molestie nunc non blandit massa enim nec. Sit amet commodo nulla facilisi nullam vehicula ipsum a arcu.', '2023-10-25', '25 October | 2023'),
(28, 'Qualcomm turns to Wi-Fi to take wireless earbuds and headphones to the next level', 'https://duet-cdn.vox-cdn.com/thumbor/0x0:1491x952/750x500/filters:focal(746x476:747x477):format(webp)/cdn.vox-cdn.com/uploads/chorus_asset/file/25028079/snapdragon.jpg', 3, 'milos', 'Qualcomms S7 Pro chip will keep your earbuds playing music across Wi-Fi networks even if you leave your phone behind. The first earbuds, headphones, and speakers to include it will launch early next year.', 5, 1, 1, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem donec massa sapien faucibus et. Facilisis gravida neque convallis a cras semper. Sed blandit libero volutpat sed cras ornare arcu. Faucibus ornare suspendisse sed nisi lacus sed. Lacus vel facilisis volutpat est velit egestas. Sit amet nulla facilisi morbi tempus iaculis urna. Fermentum posuere urna nec tincidunt praesent semper. Integer quis auctor elit sed. Ridiculus mus mauris vitae ultricies leo. Nibh mauris cursus mattis molestie a iaculis at. Odio ut sem nulla pharetra diam. Tellus integer feugiat scelerisque varius morbi enim nunc. Pretium fusce id velit ut tortor. Id volutpat lacus laoreet non curabitur gravida.\r\n\r\nSit amet risus nullam eget felis eget. Ac tortor vitae purus faucibus ornare suspendisse sed nisi. Turpis tincidunt id aliquet risus feugiat. Dignissim cras tincidunt lobortis feugiat vivamus at augue eget arcu. Dolor purus non enim praesent elementum facilisis leo vel. Leo a diam sollicitudin tempor. Amet mauris commodo quis imperdiet massa tincidunt. Convallis tellus id interdum velit laoreet id. In nisl nisi scelerisque eu. Quis auctor elit sed vulputate mi sit. Vitae ultricies leo integer malesuada nunc vel risus commodo. Amet nisl suscipit adipiscing bibendum est ultricies integer. Suspendisse interdum consectetur libero id faucibus nisl. Sapien pellentesque habitant morbi tristique senectus et. Neque volutpat ac tincidunt vitae semper. Suscipit adipiscing bibendum est ultricies integer quis. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Elementum nibh tellus molestie nunc non blandit massa enim nec. Sit amet commodo nulla facilisi nullam vehicula ipsum a arcu.', '2023-10-25', '25 October | 2023'),
(29, 'In a first, bird flu reaches Antarctica, threatening to wipe out tons of penguins and other birds', 'https://mediaproxy.salon.com/width/1200/https://media.salon.com/2023/10/brown_skua_gentoo_penguin_antarctica_1365519336.jpg', 2, 'maja', 'Experts warn that if the virus reaches certain rare bird populations, \"they are in threat of extinction\"', 22, 1, 1, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem donec massa sapien faucibus et. Facilisis gravida neque convallis a cras semper. Sed blandit libero volutpat sed cras ornare arcu. Faucibus ornare suspendisse sed nisi lacus sed. Lacus vel facilisis volutpat est velit egestas. Sit amet nulla facilisi morbi tempus iaculis urna. Fermentum posuere urna nec tincidunt praesent semper. Integer quis auctor elit sed. Ridiculus mus mauris vitae ultricies leo. Nibh mauris cursus mattis molestie a iaculis at. Odio ut sem nulla pharetra diam. Tellus integer feugiat scelerisque varius morbi enim nunc. Pretium fusce id velit ut tortor. Id volutpat lacus laoreet non curabitur gravida.\r\n\r\nSit amet risus nullam eget felis eget. Ac tortor vitae purus faucibus ornare suspendisse sed nisi. Turpis tincidunt id aliquet risus feugiat. Dignissim cras tincidunt lobortis feugiat vivamus at augue eget arcu. Dolor purus non enim praesent elementum facilisis leo vel. Leo a diam sollicitudin tempor. Amet mauris commodo quis imperdiet massa tincidunt. Convallis tellus id interdum velit laoreet id. In nisl nisi scelerisque eu. Quis auctor elit sed vulputate mi sit. Vitae ultricies leo integer malesuada nunc vel risus commodo. Amet nisl suscipit adipiscing bibendum est ultricies integer. Suspendisse interdum consectetur libero id faucibus nisl. Sapien pellentesque habitant morbi tristique senectus et. Neque volutpat ac tincidunt vitae semper. Suscipit adipiscing bibendum est ultricies integer quis. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Elementum nibh tellus molestie nunc non blandit massa enim nec. Sit amet commodo nulla facilisi nullam vehicula ipsum a arcu.', '2023-10-25', '25 October | 2023');

-- --------------------------------------------------------

--
-- Table structure for table `post_tag`
--

CREATE TABLE `post_tag` (
  `id_post` int(11) NOT NULL,
  `id_tag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post_tag`
--

INSERT INTO `post_tag` (`id_post`, `id_tag`) VALUES
(21, 5),
(27, 2),
(27, 3),
(27, 4),
(29, 5),
(29, 6);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `authority` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`authority`) VALUES
('ROLE_admin'),
('ROLE_user');

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `id` int(11) NOT NULL,
  `order` int(11) DEFAULT NULL,
  `image` varchar(300) DEFAULT NULL,
  `title` varchar(300) DEFAULT NULL,
  `button_name` varchar(45) DEFAULT NULL,
  `button_url` varchar(300) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `order`, `image`, `title`, `button_name`, `button_url`, `enabled`) VALUES
(9, 2, 'img/featured-pic-3.jpeg', 'Slide 2', 'browse', 'author/marijana', 1),
(10, 3, 'img/featured-pic-1.jpeg', 'Slide 3', 'discover', '', 1),
(11, 1, 'img/featured-pic-2.jpeg', 'Slide 1', 'read', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`) VALUES
(1, 'tiktok'),
(2, 'windows'),
(3, 'android'),
(4, 'app'),
(5, 'life'),
(6, 'animals');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(45) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `image` varchar(300) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `password` varchar(68) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `name`, `surname`, `image`, `phone`, `password`, `enabled`, `email`) VALUES
('admin', 'Admin', 'Admin', 'img/avatar-1.jpg', '061290100', '{bcrypt}$2a$10$0XfcI5bRHVXrilbuLSibneWKcltU.8LlVF0JiF3RbO/QoOzYTNysa', 1, 'admin@email.com'),
('maja', 'Marijana', 'Mitrovic', 'img/avatar-3.jpg', '0623650010', '{bcrypt}$2a$10$lZKLiVufm.4PWyom97QYoeK34worhgpYG1/7sPiWSo2ZgLkp3sI9a', 1, 'maja@email'),
('milos', 'Milos', 'Milosevic', 'img/avatar-5.jpg', '0625246879', '{bcrypt}$2a$10$leC/fjP9SaW9NUDds.dGXelz.M9oE6UWrH5v/LM.g7j6yjhND8rQO', 1, 'milos@email.com'),
('nenad', 'Nenad', 'Ilic', 'img/avatar-2.jpg\r\n', '0652135478', '{bcrypt}$2a$10$JzGtCMGcif8SCmpPdyJPIOOlmqOygsyIWNEmMVnL1gPrjZFCSJ1e2', 1, 'nenad@email.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authorities`
--
ALTER TABLE `authorities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `authority_idx` (`authority`),
  ADD KEY `username_idx` (`username`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_post_idx` (`id_post`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_idx` (`id_category`),
  ADD KEY `id_author_idx` (`id_author`);

--
-- Indexes for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`id_post`,`id_tag`),
  ADD KEY `id_tag` (`id_tag`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`authority`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authorities`
--
ALTER TABLE `authorities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authorities`
--
ALTER TABLE `authorities`
  ADD CONSTRAINT `authority` FOREIGN KEY (`authority`) REFERENCES `roles` (`authority`),
  ADD CONSTRAINT `username` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `id_post` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `id_author` FOREIGN KEY (`id_author`) REFERENCES `users` (`username`),
  ADD CONSTRAINT `id_category` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`);

--
-- Constraints for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD CONSTRAINT `post_tag_ibfk_1` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `post_tag_ibfk_2` FOREIGN KEY (`id_tag`) REFERENCES `tags` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
