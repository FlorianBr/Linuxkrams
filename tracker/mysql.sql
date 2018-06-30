
CREATE TABLE `Cell` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `User` varchar(20) DEFAULT NULL,
  `Pw` varchar(20) DEFAULT NULL,
  `lat` varchar(50) DEFAULT NULL,
  `lon` varchar(50) DEFAULT NULL,
  `alt` varchar(50) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  `dir` varchar(50) DEFAULT NULL,
  `speed` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
