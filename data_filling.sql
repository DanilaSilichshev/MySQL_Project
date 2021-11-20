INSERT INTO `users` VALUES
  (DEFAULT,"Amir", "Freeman","at.pretium@google.ca","a8b1ed0aa6d3a39f691ccc23e14170c5",6724611978),
  (DEFAULT,"Hadassah", "Ryan","vulputate@protonmail.edu","b8f5e7b8a7d64fa3cc888b9d872e97",13586863515),
  (DEFAULT,"Duncan", "Reilly","arcu.vel@outlook.edu","ebf9884eb7ba1cc542b53e967e9c6c99",5065124424),
  (DEFAULT,"Noah", "Garner","mi.aliquam.gravida@aol.net","2e0b694d4a8a926b725c5a6a2f2fb07780",18222495546),
  (DEFAULT,"Hasad", "Walsh","neque.vitae.semper@hotmail.com","b7ad3322315dcfe27a156e2fc0b8719877c4ffa7",2645661412),
  (DEFAULT,"Patricia", "Vega","natoque.penatibus@protonmail.ca", "1d10f826dc72613a81aa5f84ddcaf13da230a58b44a0f8ec5a063ea0",18439288824),
  (DEFAULT,"Ferdinand", "Reilly","vivamus.sit.amet@hotmail.net","1eaf9b656aad6e1d2746e99b3e35e91711e6827261c1",15226621105),
  (DEFAULT,"Melanie", "Pratt","mauris.nulla@icloud.org","60a2dd303770be5a657261395bf1beb9991086",12725387427),
  (DEFAULT,"Sylvia", "Gross","mi@google.com","e94912d1ea3585ac0ab858be3608d690556b92d3a40881692da",16627973878),
  (DEFAULT,"Hilda", "Moran","eleifend@icloud.com","3f281953518467891821626be1e3be8bf884fee",19714753222);
  
INSERT INTO `photos` (`body`, `filename`,`size`,`created_at`,`updated_at`) VALUES
  ("Кухня","photo1.jpg",558,"01-12-21 00:24:12","01-01-22  00:24:12"),
  ("Фото профиля 1","photo2.jpg",777,"01-09-21 00:24:12","01-05-22  00:24:12"),
  ("Гостиная", "photo3.jpg",525,"01-04-21 00:24:12","01-10-21  00:24:12"),
  ("Двор","photo4.jpg",385,"01-03-20 00:24:12","01-04-22  00:24:12"),
  ("Фото профиля 2","photo5.jpg",256,"07-01-21 00:24:12","05-10-22  00:24:12"),
  ("Кухня","photo6.jpg",875,"01-08-21 00:24:12","01-10-22  00:24:12"),
  ("Зал","photo7.jpg",286,"01-01-21 00:24:12","01-01-21  00:24:12"),
  ("Фото профиля 3","photo8.jpg",852,"05-12-21 00:24:12","06-12-21  00:24:12"),
  ("Фото профиля 4","photo9.jpg",476,"06-12-21 00:24:12","01-01-22  00:24:12"),
  ("Фото профиля 5","photo10.jpg",775,"02-12-21 00:24:12","01-01-22  00:24:12"),
  ("Спальня","photo11.jpg",99,"15-12-21 00:24:12","01-01-22  00:24:12"),
  ("Ванная","photo12.jpg",477,"21-12-21 00:24:12","01-01-22  00:24:12"),
  ("Фото профиля 6","photo13.jpg",821,"17-12-21 00:24:12","01-01-22  00:24:12"),
  ("Ванная","photo14.jpg",475,"27-12-21 00:24:12","01-01-22  00:24:12"),
  ("Фото профиля 7","photo15.jpg",741,"31-12-21 00:24:12","01-01-22  00:24:12"),
  ("Фото профиля 8","photo16.jpg",742,"26-09-21 00:24:12","01-01-22  00:24:12"),
  ("Кухня","photo17.jpg",858,"25-06-21 00:24:12","01-01-22  00:24:12"),
  ("Фото профиля 9","photo18.jpg",741,"15-12-21 00:24:12","01-01-22  00:24:12"),
  ("Фото профиля 10","photo19.jpg",477,"14-02-21 00:24:12","14-02-21  00:28:12"),
  ("Гостиная","photo20.jpg",254,"01-12-21 00:24:12","01-01-22  00:24:12");
  
INSERT INTO `languages` (`title`) VALUES 
  ("english"),("español"),("русский"),("français"),("polski"),("norsk"),("suomi");
  
INSERT INTO `currency` (`title`,`abbreviation`,`sign`) VALUES 
  ("доллар США","USD","$"), ("болгарский лев","BGN","Лв."), ("датская крона","DKK","Kr."), ("евро","EUR","€"),   
  ("китайский юань","CNY","¥"), ("польский злотый","PLN","zł"), ("российский рубль","RUB","₽");
  
INSERT INTO `payment_methods` (`user_id`,`card_number`,`expiry_date`,`cvv`,`index`)
VALUES
  (9,368745167274637,"12-12-23",732,11303),
  (7,368745167264637,"01-05-25",131,385616),
  (6,6498497231457257,"08-05-24",779,74853),
  (1,345147592137430,"02-07-24",531,755517),
  (2,6494345686317225,"06-03-24",320,4114),
  (4,4844747734475771,"02-06-25",884,14308),
  (3,4026589447886294,"10-06-23",540,375976),
  (10,302789651442978,"12-03-23",472,70373),
  (5,214931723298378,"07-01-23",375,34894),
  (8,6446439732787363,"03-03-24",819,613712);

INSERT INTO `profiles`  VALUES
(1,"Amir","Добро пожаловать, дорогие гости!","m","1991-03-12",2,"Russia","Kazan",4,7,"2001-05-22 00:21:10"),
  (2,"Hadassah","Добро пожаловать, дорогие гости!","m","1993-09-27",5,"Poland","Warsaw",5,6,"2005-10-22 00:18:12"),
  (3,"Duncan","Добро пожаловать, дорогие гости!","m","1992-01-14",8,"Denmark","Randers",7,3,"2006-12-21 00:04:12"),
  (4,"Noah","Добро пожаловать, дорогие гости!","m","1991-06-05",9,"China","Shanghai",6,5,"2001-01-22 00:17:12"),
  (5,"Hasad","Добро пожаловать, дорогие гости!","m","1994-02-08",10,"USA","Washington",9,1,"2001-01-22 00:15:12"),
  (6,"Patricia","Добро пожаловать, дорогие гости!","f","1993-05-17",13,"China","Shanghai",3,5,"2001-01-22 00:24:07"),
  (7,"Ferdinand","Добро пожаловать, дорогие гости!","m","1993-07-21",15,"Spain","Barcelona",2,4,"2001-01-22 00:22:33"),
  (8,"Melanie","Добро пожаловать, дорогие гости!","f","1992-11-07",16,"USA","New-York",10,1,"2001-01-22 00:00:01"),
  (9,"Sylvia","Добро пожаловать, дорогие гости!","f","1996-03-24",18,"Latvia","Riga",1,4,"2001-01-22 00:14:12"),
  (10,"Hilda","Добро пожаловать, дорогие гости!","f","1995-10-15",19,"Bulgaria","Sofia",8,2,"2014-02-21 00:18:18");
  
INSERT INTO `users_languages` VALUES 
  (9,2),
  (7,7),
  (3,5),
  (1,3),
  (3,3),
  (4,7),
  (10,4),
  (10,2),
  (6,1),
  (4,6);
  
  INSERT INTO `housing_types` (`title`) VALUES 
  ("Luxe"), ("Замки"), ("Купольные дома"), ("Дома на деревьях"),
  ("Острова"), ("На пляже"), ("Фермы"), ("Нестандартные варианты"), 
  ("Автономное жильё"), ("Превосходные бассейны");

INSERT INTO `housing` VALUES 
(DEFAULT,7,2,"Vivi un sogno nella camera Deluxe","Spain","Barcelona","c.Velazquez, 155","Hola","Oasi romantica, con mobili antichi e soffitto di 
mattoni e pietre, questa camera è composta da un letto matrimoniale e un bagno privato. Inoltre, in questa stanza è possibile aggiungere un
 letto extra o una culla",172,2,1,1,1,"15:00:00","18:00:00","No smoking"),
 (DEFAULT,1,1,"Роскошное жилье","Russia","Kazan","ул. 2-я Вольная","Приветсвую Вас в нашем городе!","Каждый дюйм этого здания привлекателен, 
 от акцентов из камня медного цвета до сланцево-серой плитки и декора из натурального дерева.",354,10,5,10,5,"16:00:00","17:00:00","Pets allowed"),
 (DEFAULT,2,9,"Rotative micro cabin","Poland","Warsaw","pl. Bankowy 3/5 00-950","Welcome!","This is a hybrid type of lodgement (somewhere between a tent and a 
 bungalow) which has one bed for two people, one table, stools, storage containers, one lamp and one electric plug.",40,2,1,1,1,"14:00:00","18:00:00","No parties and events"),
 (DEFAULT,3,5,"The Arctic Hideaway - Lower tall pod -1 single bed","Denmark","Randers","The Arctic Hideaway","Hello, my guest!","Head north 
 in Norway and experience our tiny-hotel on a remote island. The Arctic Hideaway is an architecturally playful and stunning collection of 
 ten individual buildings, where fours are sleeping cabins.",126,1,1,1,1,"15:00:00","16:00:00","No parties and events"),
 (DEFAULT,4,3,"罗亣圣","China","Shanghai","Yunnan","Welcome!","丽江古城北行十余公里，玉龙雪山南麓有一个叫做“巫鲁肯”的村子，意为雪山脚下的村子，这里便是玉湖村了，
 玉湖是明代以前由木氏家族组织人挖的一个人工湖。木氏在湖畔筑避暑夏宫、玉龙书院、建养鹿场。玉湖村最早的居民即是为纳西王护宫养鹿的人。因此又叫“窜阔罗”。
 纳西民歌中也常提到玉湖和雪山鹿场。玉湖中，雪水清澈，水草摇曳，蓝天白云衬托着高大的玉龙雪峰倒映在湖中，大自然仿佛都沉淀在湖底。这“玉湖倒影”便是著名的“玉龙十二景”之一。",
 122,2,1,1,1,"12:00:00","15:00:00","Pets allowed"),
 (DEFAULT,5,8,"Sleeping in a suitcase - a unique work of art","USA","Washington","Washington park","Hello, my dear guest!","You can sleep in our suitcase 
 - a unique work art.Have a romantic night in our suitcase with electric bed and Minibar. Just you and the nature.",86,2,1,1,2,"14:00:00","17:00:00","No smoking"),
 (DEFAULT,6,4,"Cabane Drommen - L'Arbre à Cabane","China","Shanghai","Grand Est","Hi!","Avec 4 niveaux: le salon, puis le toilette, puis la 
 chambre. Enfin, vous pourrez diner sur la terrasse perché.",88,2,1,1,0,"15:00:00","19:00:00","Pets allowed"),
 (DEFAULT,8,10,"Acropolis view penthouse w/ private plunge pool","USA","New-York","New-York Pool Park","Welcome!","Flooded with natural light 
 and featuring 2 balconies",238,6,2,3,2,"13:00:00","18:00:00","No smoking"),
 (DEFAULT,9,6,"Family House","Latvia","Riga","Riga beach","Hello!","Fall in love with our guest house which is just steps away from the beach.
Wake up each morning to inspiring sunrises and drift to sleep with the tranquil sounds of the nature.",103,2,1,3,2,"11:00:00","17:00:00","Pets allowed"),
 (DEFAULT,10,7,"Trulli della rondine","Bulgaria","Sofia","Sofia outskirts","Hello!","Villa Trullo Rondini is a 4 bedroom villa split between 2 buildings, 
 located on the outskirts of the charming town of San Michele Salentino. Part of the property has an authentic Puglian trullo design, giving
 the interiors wonderful character with traditional touches.",252,8,4,4,3,"15:00:00","18:00:00","No parties and events");
 
 INSERT INTO `housing_photos` (`housing_id`, `photo_id`, `category`) VALUES
 (1,1,"Кухня"), (2,3,"Гостиная"), (3,4,"Двор"), (4,6,"Кухня"), (5,7,"Зал"), 
 (6,11,"Спальня"), (7,12,"Ванная"), (8,14,"Ванная"), (9,17,"Кухня"), (10,20,"Гостиная");
 
 INSERT INTO `characteristics_list` (`title`) VALUES
 ("Ванная"),  ("Спальня и прачечная"),  ("Развлечения"),
 ("Семья"),  ("Отопление и охлаждение"),  ("Безопасность жилья"),
 ("Интернет и рабочее место"),  ("Кухня и столовая"),  ("Особенности местоположения"),  ("Парковка и объекты");
   
INSERT INTO `living_comfort_types` (`title`, `characteristics_list_id`) VALUES
("Фен",1), ("Горячая вода",1), ("Стиральная машина",2), ("Предметы первой необходимости: Полотенца, простыни, мыло и туалетная бумага",2), 
("Телевизор",3), ("Складная/дорожная кроватка",4), ("Кондиционер",5),
("Wi-Fi",7), ("Всё необходимое для приготовления еды: Кастрюли, сковородки, масло, соль и перец",8), ("Кофеварка",8);
   
INSERT INTO `living_comfort` VALUES
(1,1), (2,8), (3,4), (4,5), (5,3), (6,1), (7,2), (8,3), (9,9), (10,6);

INSERT INTO `orders` VALUES 
(DEFAULT,1,3,2,"2021-11-12","2021-11-16",4,688,688,"Отменён",0),
(DEFAULT,2,4,10,"2021-11-12","2021-11-19",7,2478,2395.55,"Оплачен полностью",2395.55),
(DEFAULT,3,5,1,"2021-11-21","2021-12-01",2,80,77,"Оплачен полностью",77),
(DEFAULT,4,6,1,"2021-12-20","2021-12-25",5,630,630,"Забронирован",0),
(DEFAULT,5,7,1,"2021-12-17","2021-12-19",2,244,244,"Оплачен частично",122),
(DEFAULT,6,8,2,"2021-11-04","2021-11-08",4,344,344,"Оплачен полностью",344),
(DEFAULT,7,9,2,"2021-10-18","2021-10-24",6,528,528,"Отменён",0),
(DEFAULT,8,10,5,"2021-12-09","2021-12-16",7,1666,1666,"Оплачен полностью",1666),
(DEFAULT,9,1,2,"2021-12-04","2021-12-05",1,103,103,"Оплачен частично",51.5),
(DEFAULT,10,2,7,"2022-02-01","2022-02-03",2,504,504,"Забронирован",0);
 
SET FOREIGN_KEY_CHECKS=0;
INSERT INTO `messages` (`from_user_id`, `to_user_id`, `body`, `created_at`) VALUES  
(1,3,"Добрый день!","2020-11-13 15:31:10"), (5,4,"Hello!", "2022-11-13 15:06:20"), (7,8,"Hi","2021-01-07 16:16:27"), 
(3,2,"Понятно","2021-02-07 16:16:27"), (10,2,"Thank you!","2021-03-07 16:16:27"),
(5,2,"Hello!","2021-07-07 16:16:27"), (1,3,"Почему Вы не ответили?","2021-12-07 16:16:27"), 
(7,10,"Да","2021-08-07 16:16:27"), (8,9,"Bye","2021-09-07 16:16:27"), (5,6,"Во сколько?","2021-10-07 16:16:27");

INSERT INTO `wish_lists` (`user_id`, `housing_id`, `created_at`) VALUES  
(3,1,"2020-11-13 15:31:10"), (4,2,"2022-11-13 15:06:20"), (7,8,"2021-01-07 16:16:27"), 
(3,2,"2021-02-07 16:16:27"), (10,2,"2021-03-07 16:16:27"),
(5,2,"2021-07-07 16:16:27"), (1,3,"2021-12-07 16:16:27"), 
(6,4,"2021-08-07 16:16:27"), (8,9,"2021-09-07 16:16:27"), (5,8,"2021-10-07 16:16:27");

INSERT INTO `reviews` VALUES 
(DEFAULT,4,2,"Posto incantevole inserito in un giardino ricercato e meraviglioso, immerso un ambiente naturalistico unico !",5,
"2021-11-19 00:25:10"),
(DEFAULT,5,3,"A great space to stay in! ",4,"2022-04-19 00:25:10"),
(DEFAULT,7,5,"It’s a truli wonderful place.",4,"2022-03-09 00:25:10"),
(DEFAULT,8,6,"This is an incredibly unique and beautiful space",5,"2022-05-17 00:25:10"),
(DEFAULT,10,8,"Withont comments",3,"2022-04-15 00:25:10"),
(DEFAULT,1,9,"It’s awesome!",5,"2022-08-16 00:25:10");

INSERT INTO `bonuses` VALUES 
(DEFAULT,2,TRUE,82.45,"2021-08-15 12:20:10","2021-08-15 12:20:10"),
(DEFAULT,3,TRUE,3,"2021-05-24 04:25:10","2021-12-03 16:00:10"),
(DEFAULT,5,FALSE,15.70,"2021-07-09 00:39:10","2021-09-18 00:25:10");
