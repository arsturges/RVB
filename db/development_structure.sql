CREATE TABLE `activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity` varchar(255) DEFAULT NULL,
  `activity_abbreviation` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

CREATE TABLE `date_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_category` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

CREATE TABLE `doe_project_managers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_manager` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

CREATE TABLE `drivers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `driver` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

CREATE TABLE `milestones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rulemaking_id` int(11) DEFAULT NULL,
  `phase_id` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `date_category_id` int(11) DEFAULT NULL,
  `milestone` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12973 DEFAULT CHARSET=latin1;

CREATE TABLE `phases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phase` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product` varchar(255) DEFAULT NULL,
  `rulemaking_id` int(11) DEFAULT NULL,
  `sector_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `rule_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_type` varchar(255) DEFAULT NULL,
  `rule_type_abbreviation` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE `rulemakings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule` varchar(255) DEFAULT NULL,
  `rule_type_id` int(11) DEFAULT NULL,
  `notes` text,
  `doe_project_manager_id` int(11) DEFAULT NULL,
  `legislative_deadline` date DEFAULT NULL,
  `phase_id` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `short_name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=latin1;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first` varchar(255) DEFAULT NULL,
  `last` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `crypted_password` varchar(40) DEFAULT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `remember_token_expires_at` datetime DEFAULT NULL,
  `admin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

INSERT INTO schema_migrations (version) VALUES ('20100116004003');

INSERT INTO schema_migrations (version) VALUES ('20100116005406');

INSERT INTO schema_migrations (version) VALUES ('20100116010033');

INSERT INTO schema_migrations (version) VALUES ('20100116010547');

INSERT INTO schema_migrations (version) VALUES ('20100116011036');

INSERT INTO schema_migrations (version) VALUES ('20100116012313');

INSERT INTO schema_migrations (version) VALUES ('20100120023036');

INSERT INTO schema_migrations (version) VALUES ('20100120030717');

INSERT INTO schema_migrations (version) VALUES ('20100127193959');

INSERT INTO schema_migrations (version) VALUES ('20100308222402');