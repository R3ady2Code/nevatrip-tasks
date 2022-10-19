-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 19 2022 г., 16:05
-- Версия сервера: 5.7.39
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `1`
--

-- --------------------------------------------------------

--
-- Структура таблицы `barcodes`
--

CREATE TABLE `barcodes` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `barcode` int(11) NOT NULL,
  `check_barcode` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `barcodes`
--

INSERT INTO `barcodes` (`id`, `order_id`, `barcode`, `check_barcode`) VALUES
(1, 1, 111111, 0),
(2, 1, 222222, 1),
(3, 1, 333333, 0),
(4, 1, 444444, 0),
(5, 1, 555555, 1),
(6, 1, 666666, 0),
(7, 1, 777777, 0),
(8, 2, 111111, 1),
(9, 2, 222222, 1),
(10, 3, 111111, 0),
(11, 3, 222222, 0),
(12, 3, 333333, 1),
(13, 3, 444444, 1),
(14, 3, 555555, 0),
(15, 3, 666666, 0),
(16, 3, 777777, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `event_date` datetime NOT NULL,
  `ticket_adult_price` int(11) NOT NULL,
  `ticket_adult_quantity` int(11) NOT NULL,
  `ticket_kid_price` int(11) NOT NULL,
  `ticket_kid_quantity` int(11) NOT NULL,
  `ticket_preferential_price` int(11) NOT NULL,
  `ticket_preferential_quantity` int(11) NOT NULL,
  `ticket_group_price` int(11) NOT NULL,
  `ticket_group_quantity` int(11) NOT NULL,
  `barcode` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `equal_price` int(11) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `event_id`, `event_date`, `ticket_adult_price`, `ticket_adult_quantity`, `ticket_kid_price`, `ticket_kid_quantity`, `ticket_preferential_price`, `ticket_preferential_quantity`, `ticket_group_price`, `ticket_group_quantity`, `barcode`, `user_id`, `equal_price`, `created`) VALUES
(1, 3, '2021-08-21 13:00:00', 700, 1, 450, 0, 400, 2, 500, 4, 111111, 451, 2700, '2022-10-19 04:32:13'),
(2, 6, '2022-10-19 04:32:13', 1000, 0, 800, 2, 700, 0, 750, 0, 222222, 364, 1600, '2022-10-19 04:32:13'),
(3, 3, '2021-08-21 13:00:00', 700, 4, 450, 3, 400, 0, 500, 0, 333333, 15, 4150, '2022-10-19 04:38:25');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `barcodes`
--
ALTER TABLE `barcodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `barcode` (`barcode`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `barcodes`
--
ALTER TABLE `barcodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `barcodes`
--
ALTER TABLE `barcodes`
  ADD CONSTRAINT `barcodes_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
