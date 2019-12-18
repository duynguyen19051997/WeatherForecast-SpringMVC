-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2019 at 06:49 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `weatherforecast`
--

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE `data` (
  `data_id` int(255) NOT NULL COMMENT 'Data ID',
  `json_id` int(255) NOT NULL COMMENT 'Json ID',
  `valid_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date the forecast is valid for in format YYYY-MM-DD. [Midnight to midnight local time]',
  `ts` int(255) NOT NULL COMMENT 'Forecast period start unix timestamp (UTC).',
  `datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '[DEPRECATED] Forecast valid date (YYYY-MM-DD).',
  `wind_gust_spd` double NOT NULL COMMENT 'Wind gust speed (Default m/s).',
  `wind_spd` double NOT NULL COMMENT 'Wind speed (Default m/s).',
  `wind_dir` int(255) NOT NULL COMMENT 'Wind direction (degrees).',
  `wind_cdir` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Abbreviated wind direction.',
  `wind_cdir_full` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Verbal wind direction.',
  `temp` double NOT NULL COMMENT 'Average Temperature (default Celcius).',
  `max_temp` double NOT NULL COMMENT ' Maximum Temperature (default Celcius).',
  `min_temp` double NOT NULL COMMENT ' Minimum Temperature (default Celcius).',
  `high_temp` double NOT NULL COMMENT 'High Temperature - Calculated from 6AM to 6AM local time (default Celcius).',
  `low_temp` double NOT NULL COMMENT 'Low Temperature - Calculated from 6AM to 6AM local (default Celcius).',
  `app_max_temp` double NOT NULL COMMENT 'Apparent/"Feels Like" temperature at max_temp time (default Celcius).',
  `app_min_temp` double NOT NULL COMMENT 'Apparent/"Feels Like" temperature at min_temp time (default Celcius).',
  `pop` double NOT NULL COMMENT 'Probability of Precipitation (%).',
  `precip` double NOT NULL COMMENT 'Accumulated liquid equivalent precipitation (default mm).',
  `snow` double NOT NULL COMMENT 'Accumulated snowfall (default mm).',
  `snow_depth` double NOT NULL COMMENT 'Snow Depth (default mm).',
  `pres` double NOT NULL COMMENT 'Average pressure (mb).',
  `slp` double NOT NULL COMMENT 'Average sea level pressure (mb).',
  `dewpt` double NOT NULL COMMENT 'Average dew point (default Celcius).',
  `rh` double NOT NULL COMMENT 'Average relative humidity (%).',
  `clouds_low` double NOT NULL COMMENT 'Low-level (~0-3km AGL) cloud coverage (%).',
  `clouds_mid` double NOT NULL COMMENT 'Mid-level (~3-5km AGL) cloud coverage (%).',
  `clouds_hi` double NOT NULL COMMENT 'High-level (>5km AGL) cloud coverage (%).',
  `clouds` double NOT NULL COMMENT 'Average total cloud coverage (%).',
  `vis` double NOT NULL COMMENT ' Visibility (default KM).',
  `max_dhi` double NOT NULL COMMENT '[DEPRECATED] Maximum direct component of solar radiation (W/m^2).',
  `uv` int(255) NOT NULL COMMENT 'Maximum UV Index (0-11+).',
  `moon_phase` int(255) NOT NULL COMMENT 'Moon phase fraction (0-1).',
  `moonrise_ts` int(255) NOT NULL COMMENT 'Moonrise time unix timestamp (UTC).',
  `moonset_ts` int(255) NOT NULL COMMENT ' Moonset time unix timestamp (UTC).',
  `sunrise_ts` int(255) NOT NULL COMMENT 'Sunrise time unix timestamp (UTC).',
  `sunset_ts` int(255) NOT NULL COMMENT 'Sunset time unix timestamp (UTC) .'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `data`
--

INSERT INTO `data` (`data_id`, `json_id`, `valid_date`, `ts`, `datetime`, `wind_gust_spd`, `wind_spd`, `wind_dir`, `wind_cdir`, `wind_cdir_full`, `temp`, `max_temp`, `min_temp`, `high_temp`, `low_temp`, `app_max_temp`, `app_min_temp`, `pop`, `precip`, `snow`, `snow_depth`, `pres`, `slp`, `dewpt`, `rh`, `clouds_low`, `clouds_mid`, `clouds_hi`, `clouds`, `vis`, `max_dhi`, `uv`, `moon_phase`, `moonrise_ts`, `moonset_ts`, `sunrise_ts`, `sunset_ts`) VALUES
(106, 112, '2019-12-19 00:00:00', 1576688460, '2019-12-19 00:00:00', 4.42205, 2.14037, 124, 'SE', 'southeast', 23.8, 25.2, 22.2, 25.1, 22.3, 25.6, 22.8, 40, 1.8125, 0, 0, 1011.5, 1015.21, 20.5, 82, 56, 0, 87, 92, 24.1085, 0, 2, 0, 1576772547, 1576734409, 1576710554, 1576751085);

-- --------------------------------------------------------

--
-- Table structure for table `jsonresult`
--

CREATE TABLE `jsonresult` (
  `json_id` int(255) NOT NULL COMMENT 'ID',
  `lat` double NOT NULL COMMENT 'Latitude (Degrees).',
  `lon` double NOT NULL COMMENT 'Longitude (Degrees).',
  `timezone` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Local IANA Timezone.',
  `city_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'City name.',
  `country_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Country abbreviation.',
  `state_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'State abbreviation/code.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `jsonresult`
--

INSERT INTO `jsonresult` (`json_id`, `lat`, `lon`, `timezone`, `city_name`, `country_code`, `state_code`) VALUES
(112, 16.06778, 108.22083, 'Asia/Ho_Chi_Minh', 'Danang', 'VN', '78');

-- --------------------------------------------------------

--
-- Table structure for table `weather`
--

CREATE TABLE `weather` (
  `weather_id` int(255) NOT NULL COMMENT 'ID',
  `data_id` int(255) NOT NULL COMMENT 'Data ID',
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Weather icon code.',
  `code` int(255) NOT NULL COMMENT 'Weather code.',
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Text weather description.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `weather`
--

INSERT INTO `weather` (`weather_id`, `data_id`, `icon`, `code`, `description`) VALUES
(104, 106, 'c04d', 804, 'Overcast clouds');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`data_id`);

--
-- Indexes for table `jsonresult`
--
ALTER TABLE `jsonresult`
  ADD PRIMARY KEY (`json_id`);

--
-- Indexes for table `weather`
--
ALTER TABLE `weather`
  ADD PRIMARY KEY (`weather_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data`
--
ALTER TABLE `data`
  MODIFY `data_id` int(255) NOT NULL AUTO_INCREMENT COMMENT 'Data ID', AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `jsonresult`
--
ALTER TABLE `jsonresult`
  MODIFY `json_id` int(255) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `weather`
--
ALTER TABLE `weather`
  MODIFY `weather_id` int(255) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=105;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
