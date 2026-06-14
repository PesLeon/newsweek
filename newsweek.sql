-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2026 at 02:41 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newsweek`
--

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `id` int(11) NOT NULL,
  `ime` varchar(32) DEFAULT NULL,
  `prezime` varchar(32) DEFAULT NULL,
  `korisnicko_ime` varchar(32) DEFAULT NULL,
  `lozinka` varchar(255) DEFAULT NULL,
  `razina` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`id`, `ime`, `prezime`, `korisnicko_ime`, `lozinka`, `razina`) VALUES
(1, 'Admin', 'Pesic', 'Admin', '$2y$10$8jbu1zobYH5seNogNZbA/eqakndgswjwVkR2FU/I9Yxq.f.j/k/ES', 1),
(2, 'leon', 'pesic', 'Leon', '$2y$10$eEK0slFUmcPRYwOygkV2GuA7nYUgDumnfosroxvVoqTERNsadJLL2', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vijesti`
--

CREATE TABLE `vijesti` (
  `id` int(11) NOT NULL,
  `datum` varchar(32) NOT NULL,
  `naslov` varchar(255) NOT NULL,
  `sazetak` text NOT NULL,
  `tekst` text NOT NULL,
  `slika` varchar(255) NOT NULL,
  `kategorija` varchar(255) NOT NULL,
  `arhiva` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vijesti`
--

INSERT INTO `vijesti` (`id`, `datum`, `naslov`, `sazetak`, `tekst`, `slika`, `kategorija`, `arhiva`) VALUES
(1, '14.06.2026.', 'Potres kod Siska', 'Potres kod Petrinje 2020., prozvan i Petrinjski potres i Potres na Banovini, magnitude 6,4 MW pogodio je 29. prosinca 2020. godine u 12:19 sati Sisačko-moslavačku županiju s epicentrom 3 km jugozapadno od grada Petrinje. ', 'Potres kod Petrinje 2020., prozvan i Petrinjski potres i Potres na Banovini, magnitude 6,4 MW pogodio je 29. prosinca 2020. godine u 12:19 sati Sisačko-moslavačku županiju s epicentrom 3 km jugozapadno od grada Petrinje. Maksimalni intenzitet osjećaja procijenjen je na VIII. (jako štetno) do IX. (razorno) stupanj na europskoj makroseizmičkoj ljestvici. Ovom su događaju prethodila tri velika potresa, od kojih najjači magnitude 5,2 MW. Nakon ovoga, uslijedila je serija nekoliko stotina potresa, od kojih najjači magnitude 5,0 po Richterovoj ljestvici.[5] Poginulo je sedmero osoba, od toga petero u Majskim Poljanama, a preostali u Žažini i Petrinji.\r\n\r\nPotres se dogodio u doba pandemije koronavirusa u Hrvatskoj. Uz ljudske žrtve, nanio je značajne materijalne štete u pogođenim područjima, ponajviše na području Banovine.\r\n\r\nPotres se, osim u cijeloj Hrvatskoj, osjetio i u dijelovima Austrije, Bosne i Hercegovine, Crne Gore, Češke, Italije, Mađarske, Njemačke, Rumunjske, Slovačke, Slovenije i Srbije.[1] Epicentar potresa bio je u Strašniku.[6] Dubina potresa iznosila je 10 km.\r\nEpicentar potresa nalazio se u brdovitom području južno od aluvijalne ravni na potezu od rijeka Kupe do Save, sa Zrinskom gorom i ostatkom Dinarskih Alpa na jugu.\r\n\r\nSeizmičko područje Pokuplja slijedi dolinu rijeke Kupe od Karlovca do Siska. Ovo je područje tijekom povijesti pogodilo nekoliko potresa, od kojih je najpoznatiji veliki potres iz 1909. godine, čiji je epicentar bio u blizini Pokupskog, s naknadnim potresima koji su se nastavili tijekom 1910. godine. Imao je maksimalni intenzitet od VIII na MCS ljestvici. Ta je seizmičnost povezana s reaktivacijom normalnih rasjeda na sjeverozapad-jugoistoku, koji čine jugozapadnu granicu Panonske nizine.[7][8]\r\n\r\nGodine 1969. u sustavu rasjeda koji se proteže od Jastrebarskog preko ovoga područja dogodio se potres s epicentrom u Banjoj Luci magnitude 6,6 po Richterovoj ljestvici.\r\n\r\nGodine 1880. potres od 6,3 po Richterovoj ljestvici pogodio je područje sjeveroistočno od Zagreba. Posljednji potres na teritoriju Hrvatske jačine 6,0 po Richterovoj ljestvici bio je u Stonu 1996. godine. Godine 1962. potresi od 5,9 i 6,2 po Richterovoj ljestvici pogodili su makarsko područje. Godine 1942. potres magnitude 6,2 pogodio je Imotski; poginulo je najmanje 20 osoba. U ožujku 2020. grad Zagreb pogodio je potres s magnitudom 5,5 po Richterovoj ljestvici.[9] Najjači potres ikad zabilježen u Hrvatskoj bio je potres magnitude 6,7 s epicentrom između Sinja i Trilja 1898. godine, a područje sjeverno od Sinja pogodio je 1990. i potres magnitude 5,6 s trajanjem od gotovo jedne minute.[10] Svi navedeni potresi dogodili su se na drugim rasjedima, neovisnim od rasjeda petrinjskog potresa.', 'hobbit.jpg', 'World', 0),
(2, '14.06.2026.', 'Trumps new statemant may shock you', 'President Trump recently announced a potential peace deal with Iran, stating that the country \"no longer wants a nuclear weapon\" and that an agreement could be signed by Sunday, June 15, 2026.  He claims this settlement will lead to the Strait of Hormuz opening shortly and follows earlier assertions that the U.S. has a deal ensuring Iran will never possess nuclear weapons.', 'President Trump recently announced a potential peace deal with Iran, stating that the country \"no longer wants a nuclear weapon\" and that an agreement could be signed by Sunday, June 15, 2026.  He claims this settlement will lead to the Strait of Hormuz opening shortly and follows earlier assertions that the U.S. has a deal ensuring Iran will never possess nuclear weapons.\r\nIn September 2002, the All People\'s Coalition held \"Bush Did It!\" rallies in locations in California, which accused the Bush Administration of destroying the World Trade Center towers in a controlled demolition. In June 2005, the conspiracy site WantToKnow[5] launched a page titled \"9/11 Inside Job?\" On March 30th, 2006, the news site SFGate[3] published an article titled \"An Inside Job?\", which reported on theologian David Ray Griffin\'s speculation that the United States government orchestrated the September 11th attacks. On April 19th, 2007, YouTuber WizardofOunces uploaded a video titled \"9/11 Inside Job – The Most Damning Evidence Yet,\" featuring a presentation by American physicist Steven Jones claiming the attacks were actually a controlled thermite explosion (shown below, left). On August 1st, YouTuber Stelios James-Foster uploaded a video titled \"911 inside job proof,\" which criticized many of the claims within the 9/11 Commission Report (shown below, right). Within eight years, the videos gained over one million views each.', 'gospodar_p_1.jpg', 'U.S.', 1),
(3, '14.06.2026.', 'Florida man once again', 'Over $161,000 in damages were done to the Venetian Bay Golf Club in New Smyrna Beach as footage shows a pick up driver doing donuts in the second hole putting green around 3:30 a.m., Oct. 20. Now, the golf course is hoping the grass won\'t go dormant as winter kicks in, potentially pushing back the restoration to April 2016, FOX 35\'s Marie Edinger reported.', 'Over $161,000 in damages were done to the Venetian Bay Golf Club in New Smyrna Beach as footage shows a pick up driver doing donuts in the second hole putting green around 3:30 a.m., Oct. 20. Now, the golf course is hoping the grass won\'t go dormant as winter kicks in, potentially pushing back the restoration to April 2016, FOX 35\'s Marie Edinger reported.\r\nNEW SMYRNA BEACH, Fla. - There are rules in the game of golf: keep up with the pace of play, try to keep the ball in the fairway, and be kind to the course.\r\n\r\nThose rules were seemingly thrown out the window over the weekend after someone apparently went on a damaging joyride on the second hole green at The Club at Venetian Bay in New Smyrna Beach.\r\n\r\nWhat we know:\r\nNew Smyrna Beach Police responded to the golf club on Sunday morning after employees found one of the greens significantly damaged.\r\n\r\nAn employee noticed the damage around 6:30 a.m. and then contacted one of their supervisors, who then contacted police. Employees believe someone drove onto the course and did several \"donuts,\" creating deep tire tracks and sending dirt flying.\r\nThe employee estimated some 7,000 square feet of turf was damaged. The Club estimated the cost of the repair to be more than $150,000, plus loss of revenue while the hole is repaired.\r\n\r\nPolice said someone in the area reported seeing a pickup truck performing donuts on the course around 3:30 a.m., but was unable to provide a description because the vehicle was so far away.', 'gospoda_p_2.jpg', 'U.S.', 0),
(4, '14.06.2026.', 'Australia is on fire', 'As Australia edged into spring in 2019, former fire brigade chief Greg Mullins warned the country was disastrously primed to burn.', 'Over and over, he begged to be heard. In letters, phone calls, press conferences and countless interviews, he painted an apocalyptic picture of the summer ahead.\r\n\r\nBut his pleas fell on deaf ears, and his premonitions would come true.\r\n\r\nOver the coming months, Mr Mullins watched on as 24 million hectares was torched - an area the size of the UK. Almost 2,500 homes burned down, and 480 people died in the flames and smoke.\r\n\r\nNow a worrying combination of conditions has Mr Mullins sounding the alarm again.\r\n\r\nAuthorities have stressed this summer will not reach the same scale. But years of rain have caused an explosion in plant growth, which is drying out after Australia\'s warmest winter on record, and an El Nino-affected summer promises more oppressively hot and dry conditions.\r\n\r\nJust days into spring, parts of the country are experiencing catastrophic-level weather warnings.\r\n\r\n\"Bushfires will be back in the headlines,\" Mr Mullins tells the BBC.\r\n\r\n\"I\'m nervous.\"\r\n\r\nA firefighter\'s \'nightmare\'\r\nOut in the Southern Highlands of New South Wales (NSW), it\'s not hard to see why.\r\n\r\nWalking through the thick scrub of Nattai National Park, the occasional blackened tree trunk peeks out from behind a wall of leaves. Only by craning your neck can you see that the canopy is still threadbare. The area was incinerated four years ago.\r\n\r\n\"If I hadn\'t seen it with my own eyes, there\'s no way I would believe that had burned as hard as it did,\" local firefighter Andrew Hain says.\r\n\r\nIn 2019 it resembled \"the surface of the Moon with sticks coming out of it\", he adds.\r\n\r\n\"You think nothing will ever grow in there again... [but] I could now go in there 30 metres and you won\'t see me any more.\"', 'gospodar_p_3.jpg', 'World', 0),
(5, '14.06.2026.', 'New virus from China hits the EU', 'COVID-19 is a disease caused by the SARS-CoV-2 coronavirus. There are a range of signs and symptoms, but hte most common symptoms reported for currently-circulating variants are fever, chills, and sore throat.\r\nMost people make a full recovery without needing treatment. People with severe disease or at risk of developing severe disease should seek medical care as soon as possible.', 'COVID-19 is caused by the SARS-CoV-2 virus, which spreads through the air in infectious respiratory particles from an infected person. Transmission is more likely in close contact or shared indoor spaces. The virus can also spread by touching contaminated surfaces and then the eyes, nose or mouth. \r\n\r\nBecause of increasing immunity from past infections and/or vaccination, most people recover without treatment. About 6% develop post COVID-19 condition (PCC, or long COVID), however, which can cause lasting symptoms such as memory issues, fatigue or breathing difficulties. PCC an affect daily life and requires individualized care.\r\n\r\nOlder adults, people with underlying health conditions, and unvaccinated individuals are at higher risk of severe illness. Conditions that increase risk include diabetes, health or lung disease, obesity and weakened immune systems.\r\n\r\nHealth and care workers face higher exposure risk due to their work environment.\r\n\r\nVaccination remains a key preventive measure against severe disease. COVID-19 vaccines continue to provide strong protection against severe illness and death.\r\nIn rare situations, children can develop a severe inflammatory syndrome a few weeks after infection and may require medical attention and hospitalization. \r\n\r\nSome people who have had COVID-19, whether they needed hospitalization or not, continue to experience symptoms long after the infectious period has ended. These long-term effects are called post COVID-19 condition (PCC, or long COVID). The most common symptoms include fatigue, aches and pains in muscles or joints, breathlessness, headaches, and difficulty in thinking or concentrating. Post COVID-19 condition can affect a person’s ability to perform daily activities such as work or household tasks.  ', 'kruna_ponoci.jpg', 'World', 0),
(6, '14.06.2026.', 'test numero Dosuno', 'SARS-CoV-2, the virus causing COVID-19, spreads through the air via infectious respiratory particles released when an infected person breathes, talks, coughs, or sneezes. People are more likely to catch the virus when they are close to the infected person, or when they are sharing a closed space with them. The virus can also enter the body when someone touches contaminated surfaces like doorknobs or handles and then touches the eyes, nose or mouth.', 'SARS-CoV-2, the virus causing COVID-19, spreads through the air via infectious respiratory particles released when an infected person breathes, talks, coughs, or sneezes. People are more likely to catch the virus when they are close to the infected person, or when they are sharing a closed space with them. The virus can also enter the body when someone touches contaminated surfaces like doorknobs or handles and then touches the eyes, nose or mouth.\r\nSARS-CoV-2, the virus causing COVID-19, spreads through the air via infectious respiratory particles released when an infected person breathes, talks, coughs, or sneezes. People are more likely to catch the virus when they are close to the infected person, or when they are sharing a closed space with them. The virus can also enter the body when someone touches contaminated surfaces like doorknobs or handles and then touches the eyes, nose or mouth.\r\nSARS-CoV-2, the virus causing COVID-19, spreads through the air via infectious respiratory particles released when an infected person breathes, talks, coughs, or sneezes. People are more likely to catch the virus when they are close to the infected person, or when they are sharing a closed space with them. The virus can also enter the body when someone touches contaminated surfaces like doorknobs or handles and then touches the eyes, nose or mouth.\r\nSARS-CoV-2, the virus causing COVID-19, spreads through the air via infectious respiratory particles released when an infected person breathes, talks, coughs, or sneezes. People are more likely to catch the virus when they are close to the infected person, or when they are sharing a closed space with them. The virus can also enter the body when someone touches contaminated surfaces like doorknobs or handles and then touches the eyes, nose or mouth.', 'prijestolje_od_stakla.jpg', 'U.S.', 0),
(7, '14.06.2026.', 'test numero unoDos dos', 'SARS-CoV-2 circulates throughout the year, causing outbreaks worldwide without an established seasonal pattern.', 'SARS-CoV-2 circulates throughout the year, causing outbreaks worldwide without an established seasonal pattern.\r\nSARS-CoV-2 circulates throughout the year, causing outbreaks worldwide without an established seasonal pattern.\r\nSARS-CoV-2 circulates throughout the year, causing outbreaks worldwide without an established seasonal pattern.\r\nSARS-CoV-2 circulates throughout the year, causing outbreaks worldwide without an established seasonal pattern.\r\nSARS-CoV-2 circulates throughout the year, causing outbreaks worldwide without an established seasonal pattern.\r\nSARS-CoV-2 circulates throughout the year, causing outbreaks worldwide without an established seasonal pattern.\r\nSARS-CoV-2 circulates throughout the year, causing outbreaks worldwide without an established seasonal pattern.\r\nSARS-CoV-2 circulates throughout the year, causing outbreaks worldwide without an established seasonal pattern.', 'nasljednica_vatre.jpg', 'U.S.', 0),
(8, '14.06.2026.', 'test bez slike', 'naslov \"danas\" \'sutra\'', 'naslov \"danas\" \'sutra\'\r\nnaslov \"danas\" \'sutra\'\r\nnaslov \"danas\" \'sutra\'\r\n', '', 'World', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `korisnicko_ime` (`korisnicko_ime`);

--
-- Indexes for table `vijesti`
--
ALTER TABLE `vijesti`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vijesti`
--
ALTER TABLE `vijesti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
