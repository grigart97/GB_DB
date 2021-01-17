DROP DATABASE IF EXISTS petin;
CREATE DATABASE petin;
USE petin;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, -- Помню, что есть SERIAL, но хочу запомнить
    firstname VARCHAR(30) NOT NULL,
    lastname VARCHAR(30) NOT NULL,
    email VARCHAR(40) NOT NULL UNIQUE,
    phone BIGINT UNSIGNED UNIQUE,
    pass_hash VARCHAR(100) NOT NULL
);

INSERT INTO users VALUES ('1','Furman','Nader','xo\'reilly@yahoo.com',9628462836,'c27fe270e1280f02ce98a186f5bef49eb9ba9706'),
                        ('2','Angelina','Koelpin','dkuvalis@yahoo.com',9547284617,'044e83cbac3ddfa656bf4f766a4321c85715724e'),
                        ('3','Rashad','Hills','sanford.kunze@gmail.com',9746738462,'ed73905485368309fef9ceaf09493813aa862ccc'),
                        ('4','Jameson','Doyle','christiansen.otto@yahoo.com',9462817327,'82e958967abbe3fd4870df22be00b4426a0d5a87'),
                        ('5','Nicolette','Jacobson','hettie97@yahoo.com',9023458617,'6f90887d1932eac1b87127fc1f3b54b99340c66b'),
                        ('6','Mason','Gleason','liana72@yahoo.com',9730128484,'ca37d43cfea487cfe97efb54666beed262923d34'),
                        ('7','Armand','Stehr','dicki.kameron@yahoo.com',9057892637,'f524bf52c6cce0452f8dc0c3cf5391f91c888690'),
                        ('8','Clifford','Wolf','sdeckow@hotmail.com',9047233784,'90720fb9c98b8aa77d2a5bb0678280e6dac3a3f9'),
                        ('9','Aryanna','Heller','herminia14@gmail.com',9057827183,'8a0bf96d55460316468306ba710dee32e2257733'),
                        ('10','Quinn','Reichert','mortimer58@yahoo.com',9578297482,'13c2b3fb59ac16a960cc382cf7658f1c85238d86'),
                        ('11','Kimberly','Wehner','mervin.hermann@hotmail.com',9057297219,'7d06c7201106b9f5dae04d19a39fb3f37173580b'),
                        ('12','Brenda','Greenholt','xwilderman@yahoo.com',9082871821,'22f66729a520997b03a76e29b303f0bad4fc52c9'),
                        ('13','Alexzander','Rice','sabryna.kautzer@gmail.com',909783812,'fa73ee6c79022d12277f8fe158547ba6d9838345'),
                        ('14','Chad','Fay','abagail.conroy@hotmail.com',9727894646,'c9928bcc729034a6c9ef495d344e741319d43006');

DROP TABLE IF EXISTS media;
CREATE TABLE media (
    id SERIAL PRIMARY KEY,
    media_type ENUM('PDF', 'Photo'),
    filename VARCHAR(255),
    SIZE INT,
    created_at DATETIME DEFAULT NOW()
);

INSERT INTO `media` VALUES ('1','Photo','application/vnd.wt.stf','7346','2020-12-11 11:59:47'),
                        ('2','Photo','image/vnd.dxf','89383','2020-12-25 01:35:06'),
                        ('3','Photo','text/cache-manifest','7242','2020-12-24 22:41:30'),
                        ('4','Photo','video/jpeg','12046','2020-12-25 21:20:47'),
                        ('5','Photo','image/x-portable-pixmap','926551','2020-12-19 12:54:19'),
                        ('6','Photo','application/vnd.oasis.opendocument.graphics-template','1','2020-12-17 00:24:08'),
                        ('7','Photo','application/x-director','899838','2020-12-01 14:03:37'),
                        ('8','Photo','video/vnd.dece.video','364828','2020-12-07 03:09:11'),
                        ('9','Photo','application/vnd.ms-excel','9725','2020-12-15 20:41:29'),
                        ('10','Photo','image/vnd.ms-photo','9228','2020-12-22 02:48:22'),
                        ('11','Photo','application/reginfo+xml','5871033','2020-12-01 17:04:30'),
                        ('12','Photo','application/x-msaccess','71','2020-12-24 17:57:47'),
                        ('13','Photo','text/css','307532','2020-12-12 15:14:24'),
                        ('14','Photo','application/vnd.sus-calendar','6','2020-12-24 13:08:51'),
                        ('15','Photo','application/vnd.wap.wmlc','36','2020-12-11 11:36:20'),
                        ('16','PDF','application/vnd.ms-artgalry','72','2020-12-06 16:00:41'),
                        ('17','PDF','audio/mpeg','3816','2020-11-30 23:58:51'),
                        ('18','PDF','application/x-java-jnlp-file','4601','2020-12-10 08:06:46'),
                        ('19','PDF','application/java-archive','470565','2020-12-19 18:11:13'),
                        ('20','PDF','application/pkix-pkipath','46045857','2020-12-10 09:35:36'),
                        ('21','PDF','application/java-vm','310142606','2020-12-13 20:51:35'),
                        ('22','PDF','application/x-mscardfile','513132','2020-12-21 20:00:57'),
                        ('23','PDF','application/x-tgif','641815362','2020-12-11 07:49:08'),
                        ('24','PDF','video/vnd.dece.video','192','2020-12-28 10:09:46'),
                        ('25','PDF','application/x-install-instructions','80','2020-12-03 07:26:03'),
                        ('26','PDF','application/vnd.ecowin.chart','61','2020-12-29 02:31:05'),
                        ('27','PDF','application/vnd.svd','3471639','2020-12-23 18:29:23'),
                        ('28','PDF','application/xenc+xml','48241738','2020-12-02 03:10:07'),
                        ('29','PDF','application/lost+xml','46536','2020-12-20 16:40:48'),
                        ('30','PDF','application/vnd.route66.link66+xml','232313796','2020-12-08 02:14:27'),
                        ('31','PDF','application/vnd.shana.informed.formtemplate','381128557','2020-12-05 20:03:39'),
                        ('32','Photo','image/x-tga','924103764','2020-12-07 12:51:18'),
                        ('33','Photo','application/vnd.syncml.dm+wbxml','3791477','2020-12-29 20:31:38'),
                        ('34','Photo','application/vnd.sun.xml.writer.template','70966','2020-11-30 14:40:52'),
                        ('35','Photo','application/vnd.adobe.air-application-installer-package+zip','959575252','2020-12-03 16:05:55');

DROP TABLE IF EXISTS users_profiles;
CREATE TABLE users_profiles (
    user_id BIGINT UNSIGNED NOT NULL UNIQUE,
    birthday_at DATE,
    gender ENUM('male', 'female'),
    created_at DATETIME DEFAULT NOW(),
    hometown VARCHAR(50),
    address VARCHAR(255),
    photo_id BIGINT UNSIGNED NOT NULL,
    CONSTRAINT FOREIGN KEY fk_user_id (user_id) REFERENCES users(id),
    CONSTRAINT FOREIGN KEY fk_photo_id (photo_id) REFERENCES media(id)
);

INSERT INTO `users_profiles` VALUES ('1','2017-03-22','female','2020-12-27 14:24:34','Collierburgh','33852 Virginie Causeway Suite 869','1'),
('2','2008-02-23','male','2020-12-10 17:20:07','South Kevon','24885 Queen Drive','2'),
('3','1994-05-16','male','2020-12-29 20:19:41','Noelland','3131 Wilton Spurs','3'),
('4','1994-08-18','female','2020-12-17 17:55:20','Beatriceberg','0528 Alessia Square','4'),
('5','2020-07-18','male','2020-12-15 12:08:27','Jazmynehaven','9126 Tromp Highway Apt. 859','5'),
('6','2016-02-04','female','2020-12-19 13:49:53','West Margot','60481 Hackett Dale Suite 353','6'),
('7','1999-04-05','male','2020-12-26 16:23:56','New Vanessa','08564 Waelchi Tunnel','7'),
('8','2010-07-29','male','2020-12-18 10:53:22','North Abdullah','69628 Hoeger Fork Suite 308','8'),
('9','2003-10-17','female','2020-12-25 07:36:32','East Eden','23345 Libby Cove Suite 773','9'),
('10','1991-12-18','female','2020-12-18 10:26:36','Denesikside','83166 Von Mountains','10'),
('11','2012-03-28','female','2020-12-09 04:06:36','South Haylee','534 Verla Orchard Suite 058','11'),
('12','2017-09-04','male','2020-12-23 05:47:35','Vernonside','281 Freeman Brooks Apt. 775','12'),
('13','1998-09-06','female','2020-12-15 14:48:57','West Imanimouth','815 Orin Forges Apt. 661','13'),
('14','1998-04-05','male','2020-12-18 23:08:41','Watsicastad','17031 Heller Coves Suite 446','14');

DROP TABLE IF EXISTS pet_types;
CREATE TABLE pet_types (
    id SERIAL PRIMARY KEY,
    type VARCHAR(30) NOT NULL UNIQUE
);

INSERT pet_types (type) VALUES ('dogs'), ('cats'), ('hamsters'), ('birds'), ('rabbits'),
                               ('fishes'), ('guinea pigs'), ('rats & mices'), ('reptiles');

DROP TABLE IF EXISTS breeds;
CREATE TABLE breeds (
    id SERIAL PRIMARY KEY,
    pet_type_id BIGINT UNSIGNED NOT NULL,
    breed VARCHAR(55),
    photo_id BIGINT UNSIGNED NOT NULL, -- типовое фото породы
    CONSTRAINT FOREIGN KEY fk_pet_type_id (pet_type_id) REFERENCES pet_types(id)
);

INSERT breeds (id, pet_type_id, breed, photo_id) VALUES ('1','1','ut','1'),
                                                        ('2','2','occaecati','2'),
                                                        ('3','3','est','3'),
                                                        ('4','4','quae','4'),
                                                        ('5','5','suscipit','5'),
                                                        ('6','6','quisquam','6'),
                                                        ('7','7','est','7'),
                                                        ('8','8','est','8'),
                                                        ('9','9','tenetur','9'),
                                                        ('10','1','eius','10'),
                                                        ('11','1','nisi','11'),
                                                        ('12','2','consequatur','12'),
                                                        ('13','3','dolor','13'),
                                                        ('14','4','dolores','14'),
                                                        ('15','5','quo','15'),
                                                        ('16','6','perspiciatis','16'),
                                                        ('17','7','amet','17'),
                                                        ('18','8','eum','18'),
                                                        ('19','9','cumque','19'),
                                                        ('20','4','ut','20'),
                                                        ('21','1','veniam','21'),
                                                        ('22','2','sunt','22'),
                                                        ('23','3','exercitationem','23'),
                                                        ('24','4','ipsum','24'),
                                                        ('25','5','laborum','25'),
                                                        ('26','6','quis','26'),
                                                        ('27','7','dolorem','27'),
                                                        ('28','8','ut','28'),
                                                        ('29','9','cum','29'),
                                                        ('30','7','voluptates','30');

DROP TABLE IF EXISTS pets_for_sale;
CREATE TABLE pets_for_sale(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    owner_id BIGINT UNSIGNED NOT NULL,
    pet_type_id BIGINT UNSIGNED NOT NULL,
    breed_id BIGINT UNSIGNED NOT NULL,
    birthday_at DATE NOT NULL,
    vaccinated BIT DEFAULT 0,
    price INT UNSIGNED,
    male_quantity TINYINT UNSIGNED,
    female_quantity TINYINT UNSIGNED,
    total_quantity TINYINT AS (male_quantity + female_quantity) STORED, -- общее количество
    FOREIGN KEY fk_owner_id (owner_id) REFERENCES users(id)
);

INSERT pets_for_sale (id, owner_id, pet_type_id, breed_id, birthday_at, vaccinated, price, male_quantity, female_quantity) VALUES
                                    ('1', '1','1','1','2020-04-04',0,10000,'1','5'),
                                    ('2', '2','2','2','2020-09-11',0,5000,'2','2'),
                                    ('3', '3','3','3','2020-04-05',1,2000,'4','4'),
                                    ('4', '4','4','4','2020-05-08',0,1700,'2','5'),
                                    ('5', '5','5','5','2020-04-25',0,10000,'3','5'),
                                    ('6', '5','6','6','2020-06-27',1,50000,'4','3'),
                                    ('7', '3','7','7','2020-02-19',0,25000,'3','3'),
                                    ('8', '6','8','8','2020-12-15',0,3500,'1','5'),
                                    ('9', '8','9','9','2020-07-07',1,17000,'0','5'),
                                    ('10', '13','7','10','2020-03-25',0,23000,'5','2'),
                                    ('11', '14','1','11','2020-12-27',1,40000,'2','4'),
                                    ('12', '12','2','12','2020-10-05',0,72000,'3','3'),
                                    ('13', '10','6','13','2020-10-31',1,19000,'7','0'),
                                    ('14', '11','4','14','2020-12-24',1,350,'1','4');

DROP TABLE IF EXISTS pets_for_sale_media;
CREATE TABLE pets_for_sale_media (
    sale_id BIGINT UNSIGNED NOT NULL,
    media_id BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (sale_id, media_id),
    CONSTRAINT FOREIGN KEY fk_sale_id(sale_id) REFERENCES pets_for_sale(id),
    CONSTRAINT FOREIGN KEY fk_media_id(media_id) REFERENCES media(id)
);

INSERT INTO pets_for_sale_media VALUES ('1','1'),
('2','2'),
('3','3'),
('4','4'),
('5','5'),
('6','6'),
('7','7'),
('8','8'),
('9','9'),
('10','10'),
('11','11'),
('12','12'),
('12','31'),
('12','32'),
('13','33'),
('14','14'),
('13','29'),
('14','30');

DROP TABLE IF EXISTS pets_for_mating;
CREATE TABLE pets_for_mating(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    owner_id BIGINT UNSIGNED NOT NULL,
    pet_type_id BIGINT UNSIGNED NOT NULL,
    breed_id BIGINT UNSIGNED NOT NULL,
    nickname VARCHAR(50) NOT NULL,
    gender ENUM('male', 'female'),
    vaccinated BIT DEFAULT 0,
    birthday_at DATE NOT NULL,
    CONSTRAINT FOREIGN KEY fk_owner_id (owner_id) REFERENCES users(id)
);

INSERT pets_for_mating VALUES (1, 1, 2, 2, 'Pes', 'male', 1,'2020-01-05'),
                              (2, 3, 1, 3, 'Muz', 'male', 0, '2018-11-23'),
                              (3, 2, 3, 1, 'liza', 'female', 1, '2019-10-26'),
                              (4, 4, 6, 5, 'luka', 'male', 1, '2018-12-14'),
                              (5, 5, 1, 2, 'Zaza', 'female', 1, '2019-08-15'),
                              (6, 9, 9, 2, 'Zara', 'female', 1, '2020-02-19'),
                              (7, 8, 8, 1, 'Pall', 'male', 1, '2019-05-18'),
                              (8, 5, 7, 3, 'Zhuk', 'female', 0, '2019-03-03'),
                              (9, 13, 1, 1, 'Ulana', 'female', 1, '2018-12-12'),
                              (10, 8, 3, 2, 'Kek', 'male', 1, '2017-11-19'),
                              (11, 12, 9, 3, 'Lol', 'female', 0, '2018-04-26'),
                              (12, 11, 6, 2, 'Zummer', 'male', 1, '2019-03-23'),
                              (13, 1, 5,2, 'Tucker', 'male', 0,'2019-12-25');

DROP TABLE IF EXISTS pets_for_mating_media;
CREATE TABLE pets_for_mating_media (
    pet_id BIGINT UNSIGNED NOT NULL,
    media_id BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (pet_id, media_id),
    CONSTRAINT FOREIGN KEY fk_pet_fm_id(pet_id) REFERENCES pets_for_mating(id),
    CONSTRAINT FOREIGN KEY fk_media_id(media_id) REFERENCES media(id)
);

INSERT INTO pets_for_sale_media VALUES ('1','15'),
('2','16'),
('3','17'),
('4','18'),
('5','19'),
('6','20'),
('7','21'),
('8','22'),
('9','23'),
('10','24'),
('11','25'),
('12','26'),
('13','27');

DROP TABLE IF EXISTS messages;
CREATE TABLE messages(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    from_user_id BIGINT UNSIGNED NOT NULL,
    to_user_id BIGINT UNSIGNED NOT NULL,
    body VARCHAR(280),
    created_at DATETIME DEFAULT NOW(),
    CONSTRAINT FOREIGN KEY fk_to_u_id(to_user_id) REFERENCES users(id),
    CONSTRAINT FOREIGN KEY fk_from_u_id(from_user_id) REFERENCES users(id)
);

INSERT INTO messages VALUES
('1','1','2','Voluptatem ut quaerat quia. Pariatur esse amet ratione qui quia. In necessitatibus reprehenderit et. Nam accusantium aut qui quae nesciunt non.','1995-08-28 22:44:29'),
('2','2','1','Sint dolores et debitis est ducimus. Aut et quia beatae minus. Ipsa rerum totam modi sunt sed. Voluptas atque eum et odio ea molestias ipsam architecto.',now()),
('3','3','1','Sed mollitia quo sequi nisi est tenetur at rerum. Sed quibusdam illo ea facilis nemo sequi. Et tempora repudiandae saepe quo.','1993-09-14 19:45:58'),
('4','1','3','Quod dicta omnis placeat id et officiis et. Beatae enim aut aliquid neque occaecati odit. Facere eum distinctio assumenda omnis est delectus magnam.','1985-11-25 16:56:25'),
('5','1','5','Voluptas omnis enim quia porro debitis facilis eaque ut. Id inventore non corrupti doloremque consequuntur. Molestiae molestiae deleniti exercitationem sunt qui ea accusamus deserunt.','1999-09-19 04:35:46'),
('6','1','6','Rerum labore culpa et laboriosam eum totam. Quidem pariatur sit alias. Atque doloribus ratione eum rem dolor vitae saepe.','1973-11-09 08:12:04'),
('7','1','7','Perspiciatis temporibus doloribus debitis. Et inventore labore eos modi. Quo temporibus corporis minus. Accusamus aspernatur nihil nobis placeat molestiae et commodi eaque.','1998-04-09 00:00:26'),
('8','8','8','Suscipit dolore voluptas et sit vero et sint. Rem ut ratione voluptatum assumenda nesciunt ea. Quas qui qui atque ut. Similique et praesentium non voluptate iure. Eum aperiam officia quia dolorem.','2005-08-20 18:40:27'),
('9','9','9','Et quia libero aut vitae minus. Rerum a blanditiis debitis sit nam. Veniam quasi aut autem ratione dolorem. Sunt quo similique dolorem odit totam sint sed.','2013-03-19 04:10:10'),
('10','10','10','Praesentium molestias quia aut odio. Est quis eius ut animi optio molestiae. Amet tempore sequi blanditiis in est.','1976-05-22 14:38:15'),
('11','11','11','Molestiae laudantium quibusdam porro est alias placeat assumenda. Ut consequatur rerum officiis exercitationem eveniet. Qui eum maxime sed in.','1996-04-27 00:23:37'),
('12','12','12','Quo asperiores et id veritatis placeat. Aperiam ut sit exercitationem iste vel nisi fugit quia. Suscipit labore error ducimus quaerat distinctio quae quasi.','1989-05-13 22:39:47'),
('13','13','1','Earum sunt quia sed harum modi accusamus. Quia dolor laboriosam asperiores aliquam quia. Sint id quasi et cumque qui minima ut quo. Autem sed laudantium officiis sit sit.','1997-09-30 00:06:14'),
('14','4','1','Aut enim sint voluptas saepe. Ut tenetur quos rem earum sint inventore fugiat. Eaque recusandae similique earum laborum.','1977-10-15 23:26:40'),
('15','4','1','Nisi rerum officiis officiis aut ad voluptates autem. Dolor nesciunt eum qui eos dignissimos culpa iste. Atque qui vitae quos odit inventore eum. Quam et voluptas quia amet.','1977-10-13 19:40:32'),
('16','4','1','Consequatur ut et repellat non voluptatem nihil veritatis. Vel deleniti omnis et consequuntur. Et doloribus reprehenderit sed earum quas velit labore.','1998-05-24 10:09:36'),
('17','2','1','Iste deserunt in et et. Corrupti rerum a veritatis harum. Ratione consequatur est ut deserunt dolores.','1993-01-30 15:51:38'),
('18','14','1','Dicta non inventore autem incidunt accusamus amet distinctio. Aut laborum nam ab maxime. Maxime minima blanditiis et neque. Et laboriosam qui at deserunt magnam.','1996-05-19 14:18:39'),
('19','12','1','Amet ad dolorum distinctio excepturi possimus quia. Adipisci veniam porro ipsum ipsum tempora est blanditiis. Magni ut quia eius qui.','1998-08-12 04:42:34'),
('20','5','2','Porro aperiam voluptate quo eos nobis. Qui blanditiis cum id eos. Est sit reprehenderit consequatur eum corporis. Molestias quia quo sit architecto aut.','2013-11-01 05:14:05'),
('21','12','2','Architecto sunt asperiores modi. A commodi non qui.','2007-10-22 01:34:17'),
('22','8','1','Minus praesentium ipsum iusto ipsum et a nobis. Aut distinctio enim dolor suscipit et. Quia culpa molestiae architecto quod. Error nulla qui et harum sapiente maxime qui sed.','1986-07-17 11:23:56'),
('23','8','1','Explicabo nostrum eius cum molestiae. Et deserunt aut consectetur molestiae. Illo veritatis sed ab.','2002-06-22 15:10:59'),
('24','8','1','Excepturi consequatur ducimus voluptatum. Est sed perferendis ducimus officia et. Qui nemo sapiente harum rerum.','2007-09-14 22:06:16'),
('25','8','1','Non deserunt quis non illum. In vel exercitationem dolore reiciendis non animi sequi cumque. Officia et repellat in aut voluptas. Dignissimos sed voluptatem minima eligendi. Magnam porro omnis mollitia aspernatur error quia.','2006-06-16 19:28:59'),
('26','8','1','Minus tenetur molestiae laudantium est voluptatem tempora. Sed ab veniam porro similique cumque. Accusamus illo est et tempora excepturi odit.','1977-11-04 08:02:22'),
('27','8','1','At ratione quae facere minima exercitationem vel ipsum ipsam. Qui eligendi repellat ut unde quos hic sit. Itaque expedita voluptatem id numquam. Provident culpa expedita alias optio ipsum id. Voluptatum quae quidem nihil aut nemo voluptatibus.','1975-06-25 22:37:18'),
('28','8','1','Nam dignissimos nobis qui qui voluptate. Dolor voluptas praesentium quis tenetur deleniti dolorem incidunt. Cupiditate qui nam excepturi.','2007-03-22 10:13:05'),
('29','8','1','Molestias ratione tenetur sint. Vel rerum voluptas vel vitae et aut non autem. Distinctio sunt in dignissimos esse eligendi praesentium. Ut totam autem vel sapiente architecto et.','2003-01-11 19:37:45'),
('30','8','1','Perferendis in eius architecto debitis exercitationem. Optio deleniti ad dolor sapiente soluta. Quisquam deserunt autem amet magni quasi quo dolores. Expedita ea omnis omnis sint.','2010-04-13 15:06:20');

DROP TABLE IF EXISTS mating_requests;
CREATE TABLE mating_requests (
	initiator_user_id BIGINT UNSIGNED NOT NULL,
	initiator_pet_id BIGINT UNSIGNED NOT NULL,
    target_user_id BIGINT UNSIGNED NOT NULL,
    target_pet_id BIGINT UNSIGNED NOT NULL,
    `status` ENUM('requested', 'approved', 'declined'),
	requested_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (initiator_pet_id, target_pet_id),
    FOREIGN KEY (initiator_user_id) REFERENCES users(id),
    FOREIGN KEY (initiator_pet_id) REFERENCES pets_for_mating(id),
    FOREIGN KEY (target_pet_id) REFERENCES pets_for_mating(id),
    FOREIGN KEY (target_user_id) REFERENCES users(id),
    CHECK (initiator_user_id <> target_user_id),
    CHECK (initiator_pet_id <> target_pet_id)
);

INSERT INTO mating_requests VALUES ('1', 2, '10',3, 'approved', '2020-12-10 07:33:23', '2020-12-18 01:56:05'),
                                    ('1',4, '2',5, 'requested', '2020-12-10 07:33:23', '2020-12-10 07:33:23'),
                                    ('1',5, '3',1, 'approved', '2020-12-07 01:53:07', '2020-12-14 16:17:12'),
                                    ('4',2, '1',5, 'approved', '2020-12-08 15:57:26', '2020-12-14 23:54:58'),
                                    ('5',6, '2',1, 'declined', '2020-12-03 18:22:00', '2020-12-10 11:29:04'),
                                    ('6',3, '3',8, 'declined', '2020-12-06 17:07:59', '2020-12-09 08:03:23'),
                                    ('7',8, '1',7, 'requested', '2020-11-26 06:20:23', '2020-11-26 06:20:23'),
                                    ('8',3, '6',10, 'declined', '2020-11-30 01:50:03', '2020-12-03 07:39:50'),
                                    ('9',8, '7',2, 'requested', '2020-11-27 22:52:09', '2020-11-27 22:52:09'),
                                    ('10',10, '11',11, 'declined', '2020-12-08 00:32:15', '2020-12-12 21:08:16'),
                                    ('11',7, '14',11, 'approved', '2020-12-02 10:55:41', '2020-12-03 05:04:27'),
                                    ('12',6, '11',2, 'declined', '2020-11-25 20:11:02', '2020-11-29 12:51:09');

-- выборка по количеству пользователей в каждом городе
SELECT COUNT(user_id), hometown FROM users_profiles GROUP BY hometown;

-- выборка по количеству животных на продажу у каждого пользователя и количество вакцинированных из них
SELECT COUNT(id) pet_entity, owner_id, SUM(vaccinated) vaccinated_entity FROM pets_for_sale GROUP BY owner_id;

-- выборка по количеству видов животных на продажу и на вязку
SELECT
       type,
       (select COUNT(id) FROM pets_for_sale WHERE pet_type_id=pt.id) as for_sale,
       (select COUNT(id) FROM pets_for_mating WHERE pet_type_id=pt.id) as for_mating
FROM pet_types as pt;

-- выборка по полной информации на всех пользователей, отсортированная по созданию профилей
SELECT u.id,
       CONCAT(u.firstname, u.lastname) name,
       up.gender,
       u.email,
       u.phone,
       up.hometown,
       up.address,
       up.created_at
FROM users as u
JOIN users_profiles as up ON u.id = up.user_id
ORDER BY up.created_at;

-- Представление всех пар на вязку
CREATE OR REPLACE VIEW v_mating AS
    select *
    from pets_for_mating pfm
    join mating_requests mr on pfm.id = mr.initiator_pet_id where mr.status = 'approved'
        union
    select *
    from pets_for_mating pfm
    join mating_requests mr on pfm.id = mr.target_pet_id where mr.status = 'approved';

SELECT * FROM v_mating;

-- Представление для определения количества собак разных пород на продажу
CREATE OR REPLACE VIEW dog_breeds AS
select b.breed,
       COUNT(breed_id)
from pets_for_sale pfs
join breeds b on b.id = pfs.breed_id
join pet_types pt on b.pet_type_id = pt.id
WHERE pt.type = 'dogs'
GROUP BY pfs.breed_id;

-- Процедура для поиска случайных 15 животных для вязки (того же вида, той же породы)
DROP PROCEDURE IF EXISTS pr_mating_offers;
DELIMITER //
CREATE PROCEDURE pr_mating_offers (for_pet_id BIGINT UNSIGNED)
BEGIN
    select pfm2.id
    from pets_for_mating pfm1
    join pets_for_mating pfm2 ON pfm1.pet_type_id=pfm2.pet_type_id AND pfm1.breed_id = pfm2.breed_id
    where pfm1.id = for_pet_id AND pfm2.id != for_pet_id
      AND pfm2.gender != (select gender from pets_for_mating where id = for_pet_id)
    ORDER BY RAND()
    LIMIT 15;
END//
DELIMITER ;

Call pr_mating_offers(2);

-- процедура для добавления нового пользователя
DROP PROCEDURE IF EXISTS pr_user_add;
DELIMITER //
CREATE PROCEDURE pr_user_add(f_name VARCHAR(30), l_name VARCHAR(30), e_mail VARCHAR(40), phone_num BIGINT UNSIGNED,
p_hash VARCHAR(100), birthday DATE, gen ENUM('male', 'female'), town VARCHAR(50), adr VARCHAR(255),
photo_name VARCHAR(255), size INT, OUT tran_result VARCHAR(111))
BEGIN
    DECLARE rb BIT DEFAULT 0;
    DECLARE er_code VARCHAR(10);
    DECLARE er_string VARCHAR(100);
    DECLARE id_for_photo BIGINT UNSIGNED;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    begin
        SET rb = 1;
        GET STACKED DIAGNOSTICS CONDITION 1
            er_code = RETURNED_SQLSTATE, er_string = MESSAGE_TEXT;
        SET tran_result = concat(er_code, ' ', er_string);
    end;

        START TRANSACTION;
        insert into media (media_type, filename, SIZE, created_at) values ('photo', photo_name, size, NOW());
        SET id_for_photo = last_insert_id();
        insert into users (firstname, lastname, email, phone, pass_hash)
        values (f_name, l_name, e_mail, phone_num, p_hash);
        insert into users_profiles (user_id, birthday_at, gender, created_at, hometown, address, photo_id)
        values (last_insert_id(), birthday, gen, now(), town, adr, id_for_photo);

        IF rb THEN
            ROLLBACK;
            SELECT tran_result;
        ELSE
            SELECT 'all ok';
            COMMIT;
        END IF;
END//

-- процедура для удаления карточек животных вместе с удалением карточек их владельца
DROP PROCEDURE IF EXISTS proc_del_pets;

DELIMITER //

CREATE PROCEDURE proc_del_pets(id_for_del BIGINT UNSIGNED)
begin
    DELETE FROM users WHERE id = id_for_del;
    DELETE FROM pets_for_sale WHERE owner_id = id_for_del;
    DELETE FROM pets_for_mating WHERE owner_id = id_for_del;
end //

-- Триггер для проверки даты рождения животных на продажу
DROP TRIGGER IF EXISTS check_pets_birthday_bu;

DELIMITER //

CREATE TRIGGER check_pets_birthday_bu BEFORE UPDATE ON pets_for_sale
FOR EACH ROW
BEGIN
    IF NEW.birthday_at >= CURDATE() THEN
        SET NEW.birthday_at = CURDATE();
    END IF;
END//

-- Триггер для проверки клички питомца
DROP TRIGGER IF EXISTS check_pets_name;

DELIMITER //

CREATE TRIGGER check_pets_name BEFORE INSERT ON pets_for_mating
FOR EACH ROW
BEGIN
    IF NEW.nickname = 'DICK' OR NEW.nickname = 'PENIS' OR NEW.nickname = 'VAGINA' THEN -- ну и перечисление всех нецензурных слов
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insert Canceled. Incorrect name of your pet. Please change it';
    END IF;
end //
