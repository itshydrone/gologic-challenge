-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2021 at 03:59 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gologic`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `bookingid` int(11) NOT NULL,
  `roomid` int(11) NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `guestcount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`bookingid`, `roomid`, `startdate`, `enddate`, `email`, `guestcount`) VALUES
(1, 4, '2021-12-13', '2021-12-16', 'my@gmail.com', 2);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `imageid` int(11) NOT NULL,
  `roomid` int(11) NOT NULL,
  `imageurl` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`imageid`, `roomid`, `imageurl`) VALUES
(3, 3, 'https://content.r9cdn.net/rimg/himg/42/33/ee/ice-191473538-68059138_3XL-293587.jpg'),
(4, 3, 'https://content.r9cdn.net/rimg/himg/42/33/ee/ice-191473538-63610436_3XL-670531.jpg'),
(5, 3, 'https://content.r9cdn.net/rimg/himg/52/2e/ff/revato-4574-12063116-802720.jpg'),
(6, 4, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1d/2b/70/3d/exterior.jpg?w=1000&h=-1&s=1'),
(7, 4, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1d/2b/70/50/pool.jpg?w=1000&h=-1&s=1'),
(8, 4, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1d/2b/70/4f/exterior.jpg?w=1000&h=-1&s=1'),
(9, 5, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0b/71/47/1d/north-sydney-harbourview.jpg?w=1000&h=-1&s=1'),
(10, 5, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0b/71/47/92/hotel-reception.jpg?w=1000&h=-1&s=1'),
(11, 5, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0b/71/47/1c/harbour-view.jpg?w=1000&h=-1&s=1'),
(12, 6, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/f7/28/a7/exterior.jpg?w=1000&h=-1&s=1'),
(13, 6, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/f7/28/ea/guest-room.jpg?w=1000&h=-1&s=1'),
(14, 6, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/f7/28/e7/guest-room.jpg?w=1000&h=-1&s=1'),
(15, 7, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/21/68/aa/a4/qt-sydney-lobby.jpg?w=1000&h=-1&s=1'),
(16, 7, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/21/5e/ed/bb/spaq-treatment-room.jpg?w=1000&h=-1&s=1'),
(17, 7, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/21/5e/ed/b3/parlour-cucina.jpg?w=1000&h=-1&s=1'),
(18, 8, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/af/cb/52/four-seasons-full-harbour.jpg?w=1200&h=-1&s=1'),
(19, 8, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/a8/79/c9/lobby.jpg?w=1200&h=-1&s=1'),
(20, 8, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/af/cb/9d/premier-partial-harbour.jpg?w=1200&h=-1&s=1'),
(21, 9, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/21/5e/74/58/sir-stamford-at-circular.jpg?w=1100&h=-1&s=1'),
(22, 9, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0e/20/08/fd/quay-lounge--v14711961.jpg?w=1200&h=-1&s=1'),
(23, 9, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0e/20/08/01/the-dining-room--v14711890.jpg?w=1200&h=-1&s=1'),
(24, 10, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/19/c8/b1/65/the-fullerton-hotel-sydney.jpg?w=1200&h=-1&s=1'),
(25, 10, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/75/10/1e/heritage-deluxe-twin.jpg?w=1200&h=-1&s=1'),
(26, 10, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/75/0f/dc/the-fullerton-hotel-sydney.jpg?w=1200&h=-1&s=1'),
(27, 11, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/f3/3e/36/exterior-view.jpg?w=1100&h=-1&s=1'),
(28, 11, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/43/d5/e1/pullman-quay-grand-sydney.jpg?w=1200&h=-1&s=1'),
(29, 11, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/43/d5/e0/pullman-quay-grand-sydney.jpg?w=1200&h=-1&s=1'),
(30, 12, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/df/19/d2/the-conservatory-bar.jpg?w=1200&h=-1&s=1'),
(31, 12, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1d/03/e0/d6/hyde-park-room.jpg?w=1200&h=-1&s=1'),
(32, 12, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1d/03/e0/d3/grand-ballroom-guest.jpg?w=1200&h=-1&s=1'),
(33, 13, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0f/5a/95/df/rydges-sydney-central.jpg?w=1200&h=-1&s=1'),
(34, 13, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/12/10/6d/79/breakfast-restaurant.jpg?w=1200&h=-1&s=1'),
(35, 13, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/06/04/2f/ab/rydges-sydney-central.jpg?w=1200&h=-1&s=1'),
(36, 14, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/21/43/c1/81/exterior.jpg?w=1200&h=-1&s=1'),
(37, 14, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/07/3c/e1/d6/pool--v5174906.jpg?w=1200&h=-1&s=1'),
(38, 14, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/07/3c/e1/e4/pool--v5175268.jpg?w=1200&h=-1&s=1');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `roomid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `capacity` int(11) NOT NULL,
  `price` double NOT NULL,
  `description` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`roomid`, `name`, `address`, `capacity`, `price`, `description`) VALUES
(3, 'Radisson Blu Hotel Sydney', '27 O\'Connell Street, Sydney, NSW 2000, Australia', 2, 337, 'Located in Sydney Central Business District, this luxury hotel is within a 10-minute walk of Pitt Street Mall and Circular Quay. The Domain and Royal Botanic Gardens are also within 15 minutes. Wynyard Station is 5 minutes by foot and Martin Place Station is 5 minutes.'),
(4, 'Park Hyatt Sydney', '7 Hickson Road The Rocks, Sydney, New South Wales 2000 Australia', 4, 1240, 'Seated majestically on one of the world’s most beautiful harbors, Park Hyatt Sydney perfectly personifies contemporary harbourside luxury with its coveted location between the iconic Sydney Opera House and Harbour Bridge. Reminiscent of an exclusive harbourside residence, Park Hyatt Sydney offers intimate surrounds with architecture, art and design that reflect the Australian landscape. Highlights include 155 spacious guestrooms and suites with contemporary interiors and floor-to-ceiling glass doors that open to private balconies; 24-hour butler service; and a day spa with rooftop pool and sundeck.'),
(5, 'View Sydney', '17 Blue St, North Sydney, New South Wales 2060 Australia', 1, 146, 'View Sydney is minutes away from Sydney CBD, separated by the famous Sydney Harbour Bridge and offers magnificent views of the harbour and city skyline. The Hotel is within easy access to the City, Taronga Zoo, Luna Park, Darling Harbour, Circular Quay, the Rocks Village & Mary MacKillop Place and is right next door to North Sydney Train Station.'),
(6, 'Hyatt Regency Sydney', '161 Sussex Street, Sydney, New South Wales 2000 Australia', 5, 289, 'Everything you need to travel the way you like. Located adjacent to Darling Harbour, our hotel is a haven of relaxation for the business or leisure traveler. Hyatt Regency Sydney boasts 888 guestrooms, three dining experiences, and 3,700 square metres of flexible meeting and event space. We invite you to enjoy an unparalleled Australian getaway. Hyatt Regency Sydney has the facilities to cater for all your needs including complimentary Wi-Fi, tour services, laundry services, 24-hour room service, 24-hour front desk, limousine service, car rentals, valet parking (for a fee) and babysitting services - We can help you with all of that! Plus our guests have complimentary access to a 24-hour fitness centre. Hungry? Enjoy a relaxed dining experience with harbour side views at Sailmaker.'),
(7, 'QT Sydney', '49 Market Street, Sydney, New South Wales 2000 Australia', 2, 325, 'Layers of time make QT Sydney a one of a kind experience. Reinvention. Exploration, the wild geography of a colourful life. The hotel is a moment. Right place, right time, a twinkle in the Emerald City. Part art deco masterpiece, part heritage theatre. Rustic Italian dines with New York socialite, and in-house pampering awaits spa-crossed lovers. One night only, every night. A dramatic flourish on Market St., a corner-of-the-eye promise. Blink and you’ll miss it. Seize the chance, and come find your new niche in the city. For a contemporary dining experience draped in unique local heritage, head to Gowings Bar & Grill. Enjoy truly unique creations, always with the perfect wine for the dish. Let Parlour Cucina charm you with a welcome as warm as the espresso. Simple, fresh produce passionately prepared and served with classic generosity.'),
(8, 'Four Seasons Hotel Sydney', '199 George Street, Sydney, New South Wales 2000 Australia', 4, 302, 'Stunningly situated overlooking Sydney Harbour in the historic Rocks district, a short walk from the shopping and business centres, Four Seasons Hotel Sydney is vibrant and elegant, with dramatic harbourfront views and a luxurious day spa featuring exclusive skincare and aromatherapy treatments.'),
(9, 'Sir Stamford at Circular Quay Hotel Sydney', '93 Macquarie Street, Sydney, New South Wales 2000 Australia', 2, 331, 'Sir Stamford at Circular Quay offers 105 generously sized, well appointed hotel guest rooms, including 15 hotel suites, the majority of deluxe rooms and suites feature French doors opening onto Juliet Balconies, which overlook the Sydney Harbour, Circular Quay, Sydney Conservatorium of Music or the Royal Botanic Gardens. Significant fine art collection featuring 18th Century Louis XV and Georgian antique furniture, Staffordshire ceramics, French marble urns, Persian rugs and hundreds of hand cut chandeliers. The hotel itself partly resides in a stunning 1897 historic Health Department Building. Open fireplaces in winter and the pleasure of a roof top swimming pool in the summer.'),
(10, 'The Fullerton Hotel Sydney', '1 Martin Place, Sydney, New South Wales 2000 Australia', 4, 3, 'Steeped in character and elegance, The Fullerton Hotel Sydney is a luxury five-star hotel located in the heart of Sydney’s financial and fashion district, and housed in the historic former General Post Office building. Feel the pulse of the city and enjoy the proximity to iconic landmarks such as Darling Harbour, the Royal Botanic Garden, Barangaroo, the Sydney Opera House and the Museum of Contemporary Art, as well as theatres and noteworthy restaurants. Please note, conditions of entry currently apply to all who enter the hotel premises.'),
(11, 'Pullman Quay Grand Sydney Harbour', '61 Macquarie Street East Circular Quay, Sydney, New South Wales 2000 Australia', 4, 449, 'Located right in the heart of Sydney, the Pullman Quay Grand Sydney Harbour is a 5-Star apartment hotel located at the edge of East Circular Quay boasting stunning views of the iconic Harbour Bridge or the beautiful Royal Botanic Gardens.'),
(12, 'Sheraton Grand Sydney Hyde Park', '161 Elizabeth Street, Sydney, New South Wales 2000 Australia', 4, 399, 'Enjoy a warm welcome at the five-star Sheraton Grand Sydney Hyde Park (formerly Sheraton on the Park). Located directly opposite Hyde Park, the tree-lined oasis in the heart of Sydney, our hotel is a great destination to connect with friends, family, and colleagues. From the moment you walk through our grand entrance, you will enjoy all that our Sydney hotel has to offer.'),
(13, 'Rydges Sydney Central', '28 Albion St, Surry Hills, New South Wales 2010 Australia', 5, 211, 'Our Surry Hills hotel, located adjacent to Sydney’s bustling City is just minutes from exciting attractions including Darling Harbour, China Town, Australian Museum Sydney and the Royal Botanic Gardens as well as shopping and dining on Oxford and Crown Street. Guests enjoy staying in one of 309 recently renovated spacious rooms that afford them the desirable conveniences that make vacations in our Surry Hills accommodation more enjoyable. Guest rooms offer ensuite bathrooms, FREE WI-FI and a sound night’s sleep on comfortable beds.'),
(14, 'Novotel Sydney Central', '169-179 Thomas St, Sydney, New South Wales 2000 Australia', 2, 229, 'Novotel Sydney Central, located in the heart of the vibrant Sydney,is perfect for both corporate and leisure travellers. We are situated close to many famous Sydney attractions including Darling Harbour, Capitol Theatre, Sydney Entertainment Centre, and an array of shopping and entertainment venues.To ensure your stay is comfortable and enjoyable, guests can take advantage of our range of our hotel services and recreation facilities including the Field House Restaurant & Bar located in the hotel lobby, a rooftop swimming pool and 24hr reception and room service.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`bookingid`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`imageid`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`roomid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `bookingid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `imageid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `roomid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
