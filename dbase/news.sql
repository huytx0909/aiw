-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2019 at 10:24 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `news`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(20) NOT NULL,
  `category_name` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category_name`) VALUES
(1, 'global'),
(2, 'local');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(20) NOT NULL,
  `name` mediumtext,
  `comment_content` mediumtext NOT NULL,
  `id_news` int(20) NOT NULL,
  `time_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `name`, `comment_content`, `id_news`, `time_created`) VALUES
(1, 'jame', 'ipsom', 2, '2019-11-07 11:47:41'),
(4, 'meo', 'moew okewmÆ¡meo', 3, '2019-11-11 02:38:48'),
(5, 'huy tran ', 'oke oke ', 3, '2019-11-13 08:28:01'),
(6, 'Huytx', 'Meow meowa asdfasdf', 24, '2019-11-13 08:29:19'),
(7, 'Huy Tran', 'Message is clear and precise', 28, '2019-11-13 09:19:49');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(20) NOT NULL,
  `id_category` int(20) DEFAULT NULL,
  `title` mediumtext NOT NULL,
  `short_intro` longtext,
  `author` varchar(50) NOT NULL,
  `content` longtext NOT NULL,
  `date_created` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `id_category`, `title`, `short_intro`, `author`, `content`, `date_created`) VALUES
(2, 1, 'Ut volutpat tellus quis leo venenatis vulputate.', 'sto dignissim at. Nullam mollis arcu eget erat vestibulum, at volutpat ipsum iaculis. Suspendisse ac est sit amet felis sodales ultrice', 'Pope Argen', 'Curabitur orci ipsum, dapibus sed quam sit amet, interdum luctus risus. Nulla quis commodo neque. In hac habitasse platea dictumst. Praesent fermentum tempor erat. Fusce varius varius libero ac tincidunt. In hac habitasse platea dictumst. Nullam et aliquet libero. Nulla imperdiet massa vitae erat semper, consequat vehicula quam congue. Proin aliquam erat non risus pulvinar, in ornare diam accumsan. Suspendisse tincidunt tortor nec purus pellentesque, a ultrices lectus aliquet. Phasellus felis est, maximus et ultricies ut, fringilla non orci. Praesent orci est, suscipit nec massa sit amet, tempus auctor sem. Phasellus dignissim dui arcu, vel ornare purus elementum ac.\r\n\r\nIn malesuada massa ipsum, et bibendum erat lacinia sed. Cras elementum orci fermentum purus ullamcorper, a condimentum est tincidunt. Vivamus lorem sapien, sollicitudin eget eleifend id, auctor eu nisl. Aliquam bibendum quis massa eu sodales. Maecenas viverra nec nibh bibendum varius. Vivamus et pretium nulla. Phasellus faucibus suscipit mauris, non faucibus lorem sagittis nec. Nullam efficitur enim sollicitudin vulputate accumsan. Aenean sit amet nunc elit. Nunc feugiat dictum leo. Etiam blandit malesuada dui eu hendrerit. Maecenas ut vehicula mauris, non scelerisque dolor. Nam fermentum tincidunt nisi eu semper. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.', '2019-10-24'),
(3, 1, 'Rachel Smith breaks down while discussing border crisis', 'Phasellus congue finibus egestas. Praesent congue in odio eget vestibulum.', 'Pepper Linix', 'In malesuada massa ipsum, et bibendum erat lacinia sed. Cras elementum orci fermentum purus ullamcorper, a condimentum est tincidunt. Vivamus lorem sapien, sollicitudin eget eleifend id, auctor eu nisl. Aliquam bibendum quis massa eu sodales. Maecenas viverra nec nibh bibendum varius. Vivamus et pretium nulla. Phasellus faucibus suscipit mauris, non faucibus lorem sagittis nec. Nullam efficitur enim sollicitudin vulputate accumsan. Aenean sit amet nunc elit. Nunc feugiat dictum leo. Etiam blandit malesuada dui eu hendrerit. Maecenas ut vehicula mauris, non scelerisque dolor. Nam fermentum tincidunt nisi eu semper. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.\r\n\r\nPhasellus nec interdum diam. In placerat sem sit amet turpis posuere congue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Vivamus id ante vitae felis convallis fermentum. Morbi tempor ante ut volutpat accumsan. Vivamus eget justo egestas, aliquam ligula in, imperdiet est. Cras at magna pulvinar felis convallis porta. Sed placerat est sed massa lobortis, id eleifend turpis pharetra. Integer sed fringilla orci. Quisque eros eros, tempor a nisi ac, luctus mattis nunc. Pellentesque imperdiet purus vitae libero accumsan semper. Quisque id mauris a neque pulvinar posuere vitae sit amet nisi. Aenean a malesuada nibh. Suspendisse placerat iaculis sagittis.', '2019-11-11'),
(21, 1, 'Morbi malesuada laoreet nisi a finibus.', 'Phasellus non lorem ipsum. Phasellus congue finibus egestas. Praesent congue in odio eget vestibulum', 'Will Cogodne', 'Phasellus nec interdum diam. In placerat sem sit amet turpis posuere congue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Vivamus id ante vitae felis convallis fermentum. Morbi tempor ante ut volutpat accumsan. Vivamus eget justo egestas, aliquam ligula in, imperdiet est. Cras at magna pulvinar felis convallis porta. Sed placerat est sed massa lobortis, id eleifend turpis pharetra. Integer sed fringilla orci. Quisque eros eros, tempor a nisi ac, luctus mattis nunc. Pellentesque imperdiet purus vitae libero accumsan semper. Quisque id mauris a neque pulvinar posuere vitae sit amet nisi. Aenean a malesuada nibh. Suspendisse placerat iaculis sagittis.\r\n\r\nAenean vitae fermentum ex. Etiam tempus eros turpis, eget egestas nisl interdum sit amet. Nunc ut odio vitae justo porta iaculis. Sed justo eros, vulputate eget orci vel, auctor faucibus ante. Etiam tortor dolor, egestas sit amet ultricies quis, bibendum ac nulla. Mauris cursus tellus vitae augue ornare tempus. Nulla facilisi. Aliquam erat volutpat. Integer pretium enim bibendum sem volutpat pharetra. Pellentesque eleifend lorem turpis, nec ornare mi molestie vitae. Ut accumsan sem lectus, vitae vehicula augue tristique vitae.', '2019-10-24'),
(22, 1, 'Sed ultrices consequat sem, non tincidunt mi posuere non', 'non tincidunt mi posuere non. Vivamus sit amet nibh ut ipsum scelerisque varius a ac magna', 'Bocampe', 'Aenean vitae fermentum ex. Etiam tempus eros turpis, eget egestas nisl interdum sit amet. Nunc ut odio vitae justo porta iaculis. Sed justo eros, vulputate eget orci vel, auctor faucibus ante. Etiam tortor dolor, egestas sit amet ultricies quis, bibendum ac nulla. Mauris cursus tellus vitae augue ornare tempus. Nulla facilisi. Aliquam erat volutpat. Integer pretium enim bibendum sem volutpat pharetra. Pellentesque eleifend lorem turpis, nec ornare mi molestie vitae. Ut accumsan sem lectus, vitae vehicula augue tristique vitae.\r\n\r\nUt metus quam, venenatis viverra felis quis, sodales auctor purus. Suspendisse potenti. Etiam ante lectus, pellentesque vel consectetur vitae, cursus vitae quam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Praesent scelerisque augue ligula, ac lacinia mauris ornare in. Sed blandit vestibulum nibh, vel tempus ipsum molestie at. Proin laoreet massa semper augue bibendum, quis sagittis nibh suscipit. Ut tempus ipsum et turpis aliquet placerat. Maecenas diam leo, ultricies at eros vitae, commodo suscipit diam. Aenean rhoncus, leo nec euismod tempor, quam sapien scelerisque nibh, ac varius mi libero ac ex. Fusce in porta turpis. In mattis elit vel felis aliquam consectetur. Donec nisl magna, tempus quis risus accumsan, vestibulum tincidunt quam. Nam non rhoncus ante, ut mattis augue.', '2019-11-13'),
(23, 2, 'Donec egestas odio sit amet vehicula euismod', 'Donec egestas odio sit amet vehicula euismod\r\n\r\n\r\n\r\n\r\n', 'Evellyn NewWark', 'Donec egestas odio sit amet vehicula euismod. Sed ultrices consequat sem, non tincidunt mi posuere non. Vivamus sit amet nibh ut ipsum scelerisque varius a ac magna. Phasellus consectetur pretium orci, lobortis ultricies orci fermentum vel. Donec eu accumsan ex. Cras eu dapibus nisi, a dapibus risus. Ut volutpat tellus quis leo venenatis vulputate.\r\n\r\nMaecenas nec velit gravida, pellentesque tellus a, imperdiet libero. Mauris dictum sollicitudin ante, eget porttitor ipsum semper vehicula. Vestibulum a ex sit amet elit volutpat rhoncus. Donec leo leo, scelerisque viverra nisl vitae, iaculis laoreet lorem. Nulla blandit arcu in metus finibus vehicula ut quis orci. Nullam efficitur neque a augue sollicitudin, vel faucibus risus efficitur. In hac habitasse platea dictumst. Mauris ac metus urna. Duis pharetra ac magna et mollis. Aenean semper gravida dolor, sit amet porta neque lacinia id. In a massa vitae justo mattis sollicitudin nec vel ex. Donec a efficitur mi. Duis vestibulum metus nisl, ut auctor nisi mollis et. Maecenas aliquet sapien at orci pellentesque feugiat. Maecenas vel enim luctus, placerat mi at, molestie nisi.', '2019-11-04'),
(24, 2, 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet', 'There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...', 'John Campell', 'Donec convallis, lectus ornare tempor maximus, augue ante volutpat metus, non laoreet magna quam quis velit. Integer eleifend euismod ante, in pretium mi consequat vel. Proin consequat ipsum lacus, quis scelerisque justo dignissim at. Nullam mollis arcu eget erat vestibulum, at volutpat ipsum iaculis. Suspendisse ac est sit amet felis sodales ultrices. Morbi iaculis enim in nisi egestas, et faucibus felis blandit. Aliquam pretium, tortor ut aliquet bibendum, sem risus dignissim justo, luctus mollis dolor ex sit amet nunc. Praesent ut nisl ac elit rhoncus luctus.  Maecenas eu molestie neque. Morbi malesuada laoreet nisi a finibus. Phasellus non lorem ipsum. Phasellus congue finibus egestas. Praesent congue in odio eget vestibulum. Fusce eget lorem lorem. Aliquam sit amet orci auctor, suscipit tellus eget, rutrum sapien. Duis tortor augue, aliquet et elit at, congue luctus felis. Nulla viverra quis nisi sed blandit. Etiam eu orci dui. Quisque in molestie ligula. In interdum ut nibh nec pulvinar.', '2019-11-13'),
(26, 1, 'pellentesque tellus a, imperdiet libero', 'lobortis ultricies orci fermentum vel. Donec eu accumsan ex. Cras eu dapibus nisi, a dapibus risus. Ut volutpat tellus', 'jame', 'Fusce pulvinar dui sem, a egestas nisi ullamcorper faucibus. Donec quis elit blandit, feugiat turpis sit amet, maximus tortor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Phasellus mollis pretium ante id viverra. Quisque eu lorem placerat, suscipit lorem sed, rhoncus lacus. Maecenas sed sapien ac justo sollicitudin sodales. Nulla vulputate sem id neque tristique volutpat. Curabitur ac velit a augue bibendum luctus. Aliquam eleifend est odio, at tempus libero fringilla eu. Quisque finibus leo tellus, nec hendrerit lorem efficitur feugiat. Ut blandit aliquet ligula, eu porttitor libero commodo a. In pretium lobortis metus, nec commodo enim. Nulla nec erat nisi. Vestibulum eu libero pretium, accumsan lorem ac, varius elit. Donec id dapibus dui, sed pretium velit. Aliquam nibh ante, aliquet eget elementum consectetur, euismod et enim.\r\n\r\nProin efficitur ex in porta convallis. Curabitur ac elit tincidunt, efficitur metus id, condimentum sapien. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec iaculis arcu sit amet ligula tincidunt dapibus. In hac habitasse platea dictumst. Donec faucibus, metus nec pulvinar efficitur, lectus massa congue tellus, rhoncus maximus turpis urna eget dui. Aenean aliquam luctus elit eget bibendum. Proin ultricies mattis ex a ornare. Praesent faucibus nulla eget erat ullamcorper, eu luctus diam tincidunt. Quisque eget rutrum lectus.', '2019-12-15'),
(27, 2, 'Donec leo leo, scelerisque viverra nisl vitae, iaculis laoreet lorem', 'Phasellus congue finibus egestas. Praesent congue in odio eget vestibulum.', 'Mike Young', 'Nulla facilisi. Sed commodo dolor nec nibh imperdiet, non consectetur arcu mattis. Morbi bibendum lorem ac finibus bibendum. Nulla metus eros, fermentum sed tincidunt non, dapibus nec lectus. Donec scelerisque eget nulla et rhoncus. Aliquam varius eu est a euismod. In at viverra nunc. In hac habitasse platea dictumst. Sed cursus libero ac erat convallis, fringilla semper dolor efficitur.\r\n\r\nNunc non elit sed ex sagittis rutrum. Aenean placerat hendrerit turpis, vel ornare orci dictum ac. Ut sit amet libero fermentum, sodales elit at, malesuada enim. Fusce ultrices, nulla eu interdum mattis, mauris lectus lobortis felis, non placerat leo nunc id felis. Phasellus consectetur nulla ante, sed aliquam quam porta nec. Maecenas consectetur quam eget tortor blandit pharetra varius at ipsum. Maecenas a fringilla sapien, ut rutrum erat. Suspendisse et ante a metus maximus rhoncus non tincidunt velit. Mauris vitae libero lobortis, iaculis odio at, feugiat enim. Nunc tincidunt finibus varius.', '2019-12-15'),
(28, 1, 'Nullam efficitur neque a augue sollicitudin,', 'is dictum sollicitudin ante, eget porttitor ipsum semper vehicula. Vestibulum a ex sit amet elit volutpat rhoncus. Donec leo leo, scelerisqu', 'Ted Mosby', 'Proin efficitur ex in porta convallis. Curabitur ac elit tincidunt, efficitur metus id, condimentum sapien. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec iaculis arcu sit amet ligula tincidunt dapibus. In hac habitasse platea dictumst. Donec faucibus, metus nec pulvinar efficitur, lectus massa congue tellus, rhoncus maximus turpis urna eget dui. Aenean aliquam luctus elit eget bibendum. Proin ultricies mattis ex a ornare. Praesent faucibus nulla eget erat ullamcorper, eu luctus diam tincidunt. Quisque eget rutrum lectus.Nulla facilisi. Sed commodo dolor nec nibh imperdiet, non consectetur arcu mattis. Morbi bibendum lorem ac finibus bibendum. Nulla metus eros, fermentum sed tincidunt non, dapibus nec lectus. Donec scelerisque eget nulla et rhoncus. Aliquam varius eu est a euismod. In at viverra nunc. In hac habitasse. Sed cursus libero ac erat convallis, fringilla semper dolor efficitur.', '2019-11-13'),
(29, 1, 'Nullam sit amet elit quis risus rhoncus sagittis.', 'sto dignissim at. Nullam mollis arcu eget erat vestibulum, at volutpat ipsum iaculis. Suspendisse ac est sit amet felis sodales ultrice', 'Robin Kayle', 'Nunc non elit sed ex sagittis rutrum. Aenean placerat hendrerit turpis, vel ornare orci dictum ac. Ut sit amet libero fermentum, sodales elit at, malesuada enim. Fusce ultrices, nulla eu interdum mattis, mauris lectus lobortis felis, non placerat leo nunc id felis. Phasellus consectetur nulla ante, sed aliquam quam porta nec. Maecenas consectetur quam eget tortor blandit pharetra varius at ipsum. Maecenas a fringilla sapien, ut rutrum erat. Suspendisse et ante a metus maximus rhoncus non tincidunt velit. Mauris vitae libero lobortis, iaculis odio at, feugiat enim. Nunc tincidunt finibus varius.\r\n\r\nAenean risus arcu, placerat at ex ac, fermentum porta leo. Sed imperdiet leo id nisi egestas sollicitudin. Quisque id leo in justo efficitur sodales. Ut id blandit mi. Aliquam sollicitudin laoreet neque eget tincidunt. Donec quis viverra nulla, eu semper diam. Mauris tristique tempus lectus, sed sollicitudin tortor. Duis fringilla dui ex, sed rutrum neque hendrerit at. Nullam pharetra commodo efficitur.', '2019-11-08'),
(30, 2, 'Aenean semper gravida dolor, sit amet porta neque lacinia id', 'culis laoreet lorem. Nulla blandit arcu in metus finibus vehicula ut quis orci. Nullam efficitur neque a augue sollicitudin, vel faucibus risus', 'Tristana', 'Nulla facilisi. Sed commodo dolor nec nibh imperdiet, non consectetur arcu mattis. Morbi bibendum lorem ac finibus bibendum. Nulla metus eros, fermentum sed tincidunt non, dapibus nec lectus. Donec scelerisque eget nulla et rhoncus. Aliquam varius eu est a euismod. In at viverra nunc. In hac habitasse platea dictumst. Sed cursus libero ac erat convallis, fringilla semper dolor efficitur.\r\n\r\nNunc non elit sed ex sagittis rutrum. Aenean placerat hendrerit turpis, vel ornare orci dictum ac. Ut sit amet libero fermentum, sodales elit at, malesuada enim. Fusce ultrices, nulla eu interdum mattis, mauris lectus lobortis felis, non placerat leo nunc id felis. Phasellus consectetur nulla ante, sed aliquam quam porta nec. Maecenas consectetur quam eget tortor blandit pharetra varius at ipsum. Maecenas a fringilla sapien, ut rutrum erat. Suspendisse et ante a metus maximus rhoncus non tincidunt velit. Mauris vitae libero lobortis, iaculis odio at, feugiat enim. Nunc tincidunt finibus varius.', '2019-11-11'),
(31, 1, 'lobortis ultricies orci fermentum vel. Donec eu accumsan ex. Cras eu dapibus nisi, a dapibus risus', 'sit amet porta neque lacinia id. In a massa vitae justo mattis sollicitudin nec vel ex. Donec a efficitur mi. Duis vestibulum metus nisl, ', 'Phillpe August', 'Proin efficitur ex in porta convallis. Curabitur ac elit tincidunt, efficitur metus id, condimentum sapien. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec iaculis arcu sit amet ligula tincidunt dapibus. In hac habitasse platea dictumst. Donec faucibus, metus nec pulvinar efficitur, lectus massa congue tellus, rhoncus maximus turpis urna eget dui. Aenean aliquam luctus elit eget bibendum. Proin ultricies mattis ex a ornare. Praesent faucibus nulla eget erat ullamcorper, eu luctus diam tincidunt. Quisque eget rutrum lectus.\r\n\r\nNulla facilisi. Sed commodo dolor nec nibh imperdiet, non consectetur arcu mattis. Morbi bibendum lorem ac finibus bibendum. Nulla metus eros, fermentum sed tincidunt non, dapibus nec lectus. Donec scelerisque eget nulla et rhoncus. Aliquam varius eu est a euismod. In at viverra nunc. In hac habitasse platea dictumst. Sed cursus libero ac erat convallis, fringilla semper dolor efficitur.\r\n\r\nNunc non elit sed ex sagittis rutrum. Aenean placerat hendrerit turpis, vel ornare orci dictum ac. Ut sit amet libero fermentum, sodales elit at, malesuada enim. Fusce ultrices, nulla eu interdum mattis, mauris lectus lobortis felis, non placerat leo nunc id felis. Phasellus consectetur nulla ante, sed aliquam quam porta nec. Maecenas consectetur quam eget tortor blandit pharetra varius at ipsum. Maecenas a fringilla sapien, ut rutrum erat. Suspendisse et ante a metus maximus rhoncus non tincidunt velit. Mauris vitae libero lobortis, iaculis odio at, feugiat enim. Nunc tincidunt finibus varius.', '2019-11-11'),
(32, 2, 'n hac habitasse platea dictumst', 'dictum. In hac habitasse platea dictumst. Etiam porta mi ex, ut bibendum nisl vestibulum nec. Integer at maximus q', 'Lily Aldrin', 'Vivamus eu pharetra diam, facilisis feugiat nulla. Maecenas aliquam, lectus vitae ornare molestie, ante tellus rutrum risus, eu vehicula justo ligula eu justo. Quisque cursus, mauris in facilisis bibendum, turpis libero interdum est, non commodo dui orci id quam. Vivamus ut pretium elit. Nulla facilisi. Sed in iaculis nibh, id blandit orci. Aenean condimentum luctus nibh, sed varius mauris. Nullam aliquam porta lorem, vitae sollicitudin ex dignissim sit amet. Aliquam non mauris eu urna lobortis ullamcorper.\n\nNunc semper libero at orci varius, ac tincidunt turpis dictum. In hac habitasse platea dictumst. Etiam porta mi ex, ut bibendum nisl vestibulum nec. Integer at maximus quam. Aliquam vestibulum nisi gravida odio luctus interdum. Quisque condimentum tincidunt tristique. Fusce vehicula erat nec est tristique suscipit. Cras sollicitudin lorem non ex ultricies posuere. Aliquam erat volutpat. Praesent auctor tincidunt velit, at tempor purus. Sed et ante porta, cursus magna at, varius lectus. Integer nec blandit arcu. Integer porta sem in justo molestie facilisis. Duis vitae metus vitae est facilisis iaculis eget a ligula. Donec quam leo, malesuada vitae aliquet id, finibus vel eros.', '2019-11-13'),
(33, 2, 'Nunc semper libero at orci varius', 'auris in facilisis bibendum, turpis libero interdum est, non commodo dui orci id quam. Vivamus ut pretium elit. Nulla facilisi. Sed in iaculis', 'Quisque', 'Nunc semper libero at orci varius, ac tincidunt turpis dictum. In hac habitasse platea dictumst. Etiam porta mi ex, ut bibendum nisl vestibulum nec. Integer at maximus quam. Aliquam vestibulum nisi gravida odio luctus interdum. Quisque condimentum tincidunt tristique. Fusce vehicula erat nec est tristique suscipit. Cras sollicitudin lorem non ex ultricies posuere. Aliquam erat volutpat. Praesent auctor tincidunt velit, at tempor purus. Sed et ante porta, cursus magna at, varius lectus. Integer nec blandit arcu. Integer porta sem in justo molestie facilisis. Duis vitae metus vitae est facilisis iaculis eget a ligula. Donec quam leo, malesuada vitae aliquet id, finibus vel eros.\r\n\r\nDonec tincidunt id magna quis dictum. Quisque id feugiat eros. Fusce blandit congue felis, non consequat leo suscipit vel. Maecenas euismod urna non est elementum, sed tristique augue rutrum. Fusce finibus interdum scelerisque. Nullam congue purus et magna tincidunt cursus. Fusce fermentum viverra viverra. Praesent velit leo, iaculis non velit non, porta pharetra turpis. Vestibulum imperdiet tellus magna, sit amet porttitor augue iaculis at.', '2019-11-13'),
(34, 1, 'Integer vel sapien quis nibh luctus consectetur', 'urna luctus. Integer vitae tempus mauris, in lobortis ligula. Cras orci odio, pellentesque id bibendum eget, interdum posuere metus. Etiam pharetra lu', 'Fusce Leo', 'Quisque faucibus non massa non placerat. Integer vel sapien quis nibh luctus consectetur sed ac metus. Duis ex justo, lacinia id erat at, luctus venenatis risus. Nullam vestibulum eros sit amet orci rutrum, eu luctus sapien dapibus. Aliquam ultricies maximus nibh eu ornare. Morbi quis lorem orci. In aliquam quam id ultricies dignissim. Praesent arcu est, sodales sed dui ut, gravida interdum mi. Ut lacinia mauris sit amet nibh efficitur, a auctor urna luctus. Integer vitae tempus mauris, in lobortis ligula. Cras orci odio, pellentesque id bibendum eget, interdum posuere metus. Etiam pharetra luctus sodales. Cras consectetur erat dignissim lacus finibus venenatis. Donec rhoncus sapien id massa ornare fermentum. Maecenas sit amet fringilla elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\r\n\r\nVivamus eu pharetra diam, facilisis feugiat nulla. Maecenas aliquam, lectus vitae ornare molestie, ante tellus rutrum risus, eu vehicula justo ligula eu justo. Quisque cursus, mauris in facilisis bibendum, turpis libero interdum est, non commodo dui orci id quam. Vivamus ut pretium elit. Nulla facilisi. Sed in iaculis nibh, id blandit orci. Aenean condimentum luctus nibh, sed varius mauris. Nullam aliquam porta lorem, vitae sollicitudin ex dignissim sit amet. Aliquam non mauris eu urna lobortis ullamcorper.', '2019-11-13'),
(35, 1, 'Maecenas aliquam, lectus vitae ornare molestie', 'Etiam porta mi ex, ut bibendum nisl vestibulum nec. Integer at maximus quam. Aliquam vestibulum nisi gravida odio luctus interdum', 'Oriana Grande', 'n quis nibh luctus consectetur sed ac metus. Duis ex justo, lacinia id erat at, luctus venenatis risus. Nullam vestibulum eros sit amet orci rutrum, eu luctus sapien dapibus. Aliquam ultricies maximus nibh eu ornare. Morbi quis lorem orci. In aliquam quam id ultricies dignissim. Praesent arcu est, sodales sed dui ut, gravida interdum mi. Ut lacinia mauris sit amet nibh efficitur, a auctor urna luctus. Integer vitae tempus mauris, in lobortis ligula. Cras orci odio, pellentesque id bibendum eget, interdum posuere metus. Etiam pharetra luctus sodales. Cras consectetur erat dignissim lacus finibus venenatis. Donec rhoncus sapien id massa ornare fermentum. Maecenas sit amet fringilla elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\r\n\r\nVivamus eu pharetra diam, facilisis feugiat nulla. Maecenas aliquam, lectus vitae ornare molestie, ante tellus rutrum risus, eu vehicula justo ligula eu justo. Quisque cursus, mauris in facilisis bibendum, turpis libero interdum est, non commodo dui o', '2019-11-12'),
(36, 2, 'Nam pharetra laoreet purus', 'Nam aliquet placerat tortor nec hendrerit. Nulla sit amet placerat arcu.', 'Darius Pogne', 'Quisque faucibus non massa non placerat. Integer vel sapien quis nibh luctus consectetur sed ac metus. Duis ex justo, lacinia id erat at, luctus venenatis risus. Nullam vestibulum eros sit amet orci rutrum, eu luctus sapien dapibus. Aliquam ultricies maximus nibh eu ornare. Morbi quis lorem orci. In aliquam quam id ultricies dignissim. Praesent arcu est, sodales sed dui ut, gravida interdum mi. Ut lacinia mauris sit amet nibh efficitur, a auctor urna luctus. Integer vitae tempus mauris, in lobortis ligula. Cras orci odio, pellentesque id bibendum eget, interdum posuere metus. Etiam pharetra luctus sodales. Cras consectetur erat dignissim lacus finibus venenatis. Donec rhoncus sapien id massa ornare fermentum. Maecenas sit amet fringilla elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc semper libero at orci varius, ac tincidunt turpis dictum. In hac habitasse platea dictumst. Etiam porta mi ex, ut bibendum nisl vestibulum nec. Integer at maximus quam. Aliquam vestibulum nisi gravida odio luctus interdum. Quisque condimentum tincidunt tristique. Fusce vehicula erat nec est tristique suscipit. Cras sollicitudin lorem non ex ultricies posuere. Aliquam erat volutpat. Praesent auctor tincidunt velit, at tempor purus. Sed et ante porta, cursus magna at, varius lectus. Integer nec blandit arcu. Integer porta sem in justo molestie facilisis. Duis vitae metus vitae est facilisis iaculis eget a ligula. Donec quam leo, malesuada vitae aliquet id, finibus vel eros.', '2019-11-11'),
(37, 2, 'Morbi sed bibendum arcu, a fermentum nulla', 'Pellentesque sit amet tristique ante. Phasellus in aliquam metus. Nunc nec nulla venenatis, euismod lorem ut, blandit nunc', 'Nulla Crane', 'Morbi sed bibendum arcu, a fermentum nulla. Pellentesque sit amet tristique ante. Phasellus in aliquam metus. Nunc nec nulla venenatis, euismod lorem ut, blandit nunc. Donec porta egestas erat. Cras feugiat blandit lectus non faucibus. Fusce consequat, velit sed vehicula feugiat, lorem elit commodo magna, id feugiat libero nibh a diam. In egestas magna non hendrerit fringilla. Mauris sed erat eros. Ut consequat nulla mauris, vitae interdum dolor pharetra non.\r\n\r\nSed sollicitudin, justo eget sollicitudin porta, quam sapien ultricies justo, eu semper massa velit ac felis. Aenean eu risus eget tellus aliquam eleifend. Cras ut nulla felis. Quisque egestas ante sollicitudin dui tempus eleifend. Donec sit amet erat vitae quam porta sodales sit amet id diam. Duis ipsum nunc, gravida a bibendum vitae, scelerisque sit amet ligula. Sed egestas suscipit dolor non ultrices. Nullam mattis lectus eros, ut sagittis nulla congue eget.\r\n\r\nDuis eleifend accumsan dui, quis cursus elit tempus eget. Morbi nec eros in est efficitur pretium. Vestibulum in porta nunc, in tincidunt urna. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum laoreet metus et ipsum dapibus bibendum sit amet at quam. Nam nunc ligula, lacinia et rhoncus eget, pretium vitae felis. Mauris mattis ex a dolor facilisis pulvinar. Nulla pharetra non turpis ac vehicula. Aliquam non arcu posuere, tincidunt lectus quis, dignissim tellus. Sed sed lacus eget magna viverra porta. Sed quis velit non risus iaculis ultricies. Fusce dapibus rhoncus sem et dapibus. Suspendisse nec purus faucibus dui iaculis fringilla.', '2019-11-10'),
(38, 2, 'Vel molestie odio accumsan eget.', 'u semper massa velit ac felis. Aenean eu risus eget tellus aliquam eleifend. Cras ut nulla felis. Quisque egestas ante sollicitudin dui tempus ele', 'Lollipop Annie', 'Duis sollicitudin bibendum orci at fringilla. Fusce elementum purus sit amet nulla laoreet, ut convallis est volutpat. Mauris congue lacus in quam mollis rutrum. Pellentesque at justo sagittis, sollicitudin nulla eu, interdum tortor. Curabitur tincidunt leo lorem, vel molestie odio accumsan eget. In venenatis mauris sed pretium ornare. Sed feugiat tempus orci, eu venenatis justo rutrum sodales. Donec fringilla lacus sit amet erat iaculis aliquet. Quisque eget sapien in neque rhoncus dictum a eget ante.\r\n\r\nMorbi sed bibendum arcu, a fermentum nulla. Pellentesque sit amet tristique ante. Phasellus in aliquam metus. Nunc nec nulla venenatis, euismod lorem ut, blandit nunc. Donec porta egestas erat. Cras feugiat blandit lectus non faucibus. Fusce consequat, velit sed vehicula feugiat, lorem elit commodo magna, id feugiat libero nibh a diam. In egestas magna non hendrerit fringilla. Mauris sed erat eros. Ut consequat nulla mauris, vitae interdum dolor pharetra non.\r\n\r\nSed sollicitudin, justo eget sollicitudin porta, quam sapien ultricies justo, eu semper massa velit ac felis. Aenean eu risus eget tellus aliquam eleifend. Cras ut nulla felis. Quisque egestas ante sollicitudin dui tempus eleifend. Donec sit amet erat vitae quam porta sodales sit amet id diam. Duis ipsum nunc, gravida a bibendum vitae, scelerisque sit amet ligula. Sed egestas suscipit dolor non ultrices. Nullam mattis lectus eros, ut sagittis nulla congue eget.\r\n\r\nDuis eleifend accumsan dui, quis cursus elit tempus eget. Morbi nec eros in est efficitur pretium. Vestibulum in porta nunc, in tincidunt urna. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum laoreet metus et ipsum dapibus bibendum sit amet at quam. Nam nunc ligula, lacinia et rhoncus eget, pretium vitae felis. Mauris mattis ex a dolor facilisis pulvinar. Nulla pharetra non turpis ac vehicula. Aliquam non arcu posuere, tincidunt lectus quis, dignissim tellus. Sed sed lacus eget magna viverra porta. Sed quis velit non risus iaculis ultricies. Fusce dapibus rhoncus sem et dapibus. Suspendisse nec purus faucibus dui iaculis fringilla.', '2019-11-10'),
(39, 1, 'Pellentesque sit amet tristique ante', 'Phasellus in aliquam metus. Nunc nec nulla venenatis, euismod lorem ut, blandit nunc. Donec porta egestas era', 'Rudolf Smith', 'Sed sollicitudin, justo eget sollicitudin porta, quam sapien ultricies justo, eu semper massa velit ac felis. Aenean eu risus eget tellus aliquam eleifend. Cras ut nulla felis. Quisque egestas ante sollicitudin dui tempus eleifend. Donec sit amet erat vitae quam porta sodales sit amet id diam. Duis ipsum nunc, gravida a bibendum vitae, scelerisque sit amet ligula. Sed egestas suscipit dolor non ultrices. Nullam mattis lectus eros, ut sagittis nulla congue eget.\r\n\r\nDuis eleifend accumsan dui, quis cursus elit tempus eget. Morbi nec eros in est efficitur pretium. Vestibulum in porta nunc, in tincidunt urna. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum laoreet metus et ipsum dapibus bibendum sit amet at quam. Nam nunc ligula, lacinia et rhoncus eget, pretium vitae felis. Mauris mattis ex a dolor facilisis pulvinar. Nulla pharetra non turpis ac vehicula. Aliquam non arcu posuere, tincidunt lectus quis, dignissim tellus. Sed sed lacus eget magna viverra porta. Sed quis velit non risus iaculis ultricies. Fusce dapibus rhoncus sem et dapibus. Suspendisse nec purus faucibus dui iaculis fringilla.', '2019-11-10'),
(40, 1, 'Aenean eu risus eget tellus aliquam eleifend', 'Vestibulum in porta nunc, in tincidunt urna. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Merchi Opsoble', 'Morbi sed bibendum arcu, a fermentum nulla. Pellentesque sit amet tristique ante. Phasellus in aliquam metus. Nunc nec nulla venenatis, euismod lorem ut, blandit nunc. Donec porta egestas erat. Cras feugiat blandit lectus non faucibus. Fusce consequat, velit sed vehicula feugiat, lorem elit commodo magna, id feugiat libero nibh a diam. In egestas magna non hendrerit fringilla. Mauris sed erat eros. Ut consequat nulla mauris, vitae interdum dolor pharetra non.\r\n\r\nSed sollicitudin, justo eget sollicitudin porta, quam sapien ultricies justo, eu semper massa velit ac felis. Aenean eu risus eget tellus aliquam eleifend. Cras ut nulla felis. Quisque egestas ante sollicitudin dui tempus eleifend. Donec sit amet erat vitae quam porta sodales sit amet id diam. Duis ipsum nunc, gravida a bibendum vitae, scelerisque sit amet ligula. Sed egestas suscipit dolor non ultrices. Nullam mattis lectus eros, ut sagittis nulla congue eget.\r\n\r\nDuis eleifend accumsan dui, quis cursus elit tempus eget. Morbi nec eros in est efficitur pretium. Vestibulum in porta nunc, in tincidunt urna. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum laoreet metus et ipsum dapibus bibendum sit amet at quam. Nam nunc ligula, lacinia et rhoncus eget, pretium vitae felis. Mauris mattis ex a dolor facilisis pulvinar. Nulla pharetra non turpis ac vehicula. Aliquam non arcu posuere, tincidunt lectus quis, dignissim tellus. Sed sed lacus eget magna viverra porta. Sed quis velit non risus iaculis ultricies. Fusce dapibus rhoncus sem et dapibus. Suspendisse nec purus faucibus dui ', '2019-11-10');

-- --------------------------------------------------------

--
-- Table structure for table `news_tag`
--

CREATE TABLE `news_tag` (
  `id` int(20) NOT NULL,
  `id_news` int(20) NOT NULL,
  `id_tag` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `news_tag`
--

INSERT INTO `news_tag` (`id`, `id_news`, `id_tag`) VALUES
(3, 3, 1),
(4, 2, 1),
(5, 30, 1),
(6, 21, 1),
(7, 22, 3),
(8, 23, 2),
(9, 24, 2),
(10, 26, 3),
(11, 27, 4),
(12, 28, 4),
(13, 29, 4),
(14, 30, 2),
(15, 31, 3),
(16, 32, 1),
(17, 30, 3),
(18, 24, 1),
(19, 24, 4),
(20, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` int(20) NOT NULL,
  `tag_name` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id`, `tag_name`) VALUES
(1, 'Economic'),
(2, 'New York'),
(3, 'Technology'),
(4, 'Science');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_commentNews` (`id_news`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_newsCategory` (`id_category`);

--
-- Indexes for table `news_tag`
--
ALTER TABLE `news_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_newstag` (`id_news`),
  ADD KEY `FK_tagnews` (`id_tag`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `news_tag`
--
ALTER TABLE `news_tag`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_commentNews` FOREIGN KEY (`id_news`) REFERENCES `news` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `FK_newsCategory` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `news_tag`
--
ALTER TABLE `news_tag`
  ADD CONSTRAINT `FK_newstag` FOREIGN KEY (`id_news`) REFERENCES `news` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_tagnews` FOREIGN KEY (`id_tag`) REFERENCES `tag` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
