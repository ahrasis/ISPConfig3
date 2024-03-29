ALTER TABLE `sys_user` ADD `last_login_ip` VARCHAR(50) NULL AFTER `lost_password_reqtime`;
ALTER TABLE `sys_user` ADD `last_login_at` BIGINT(20) NULL AFTER `last_login_ip`;
-- DNS-Status (2 lines)
ALTER TABLE `dns_soa` ADD COLUMN `status` enum('OK','ERROR','PENDING') NOT NULL DEFAULT 'OK' AFTER `active`;
ALTER TABLE `dns_soa` ADD COLUMN `status_txt` text AFTER `status`;
ALTER TABLE `sys_remoteaction` CHANGE `action_state` `action_state` ENUM('pending','processing','ok','warning','error') NOT NULL DEFAULT 'pending';

CREATE TABLE IF NOT EXISTS `dns_ssl_ca` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sys_userid` int(11) unsigned NOT NULL DEFAULT '0',
  `sys_groupid` int(11) unsigned NOT NULL DEFAULT '0',
  `sys_perm_user` varchar(5) NOT NULL DEFAULT '',
  `sys_perm_group` varchar(5) NOT NULL DEFAULT '',
  `sys_perm_other` varchar(5) NOT NULL DEFAULT '',
  `active` enum('N','Y') NOT NULL DEFAULT 'N',
  `ca_name` varchar(255) NOT NULL DEFAULT '',
  `ca_issue` varchar(255) NOT NULL DEFAULT '',
  `ca_wildcard` enum('Y','N') NOT NULL DEFAULT 'N',
  `ca_iodef` text NOT NULL,
  `ca_critical` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY (`ca_issue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

ALTER TABLE `dns_ssl_ca` ADD UNIQUE(`ca_issue`);

UPDATE `dns_ssl_ca` SET `ca_issue` = 'comodo.com' WHERE `ca_issue` = 'comodoca.com';
DELETE FROM `dns_ssl_ca` WHERE `ca_issue` = 'geotrust.com';
DELETE FROM `dns_ssl_ca` WHERE `ca_issue` = 'thawte.com';
UPDATE `dns_ssl_ca` SET `ca_name` = 'Symantec / Thawte / GeoTrust' WHERE `ca_issue` = 'symantec.com';

INSERT IGNORE INTO `dns_ssl_ca` (`id`, `sys_userid`, `sys_groupid`, `sys_perm_user`, `sys_perm_group`, `sys_perm_other`, `active`, `ca_name`, `ca_issue`, `ca_wildcard`, `ca_iodef`, `ca_critical`) VALUES
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'AC Camerfirma', 'camerfirma.com', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'ACCV', 'accv.es', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'Actalis', 'actalis.it', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'Amazon', 'amazon.com', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'Asseco', 'certum.pl', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'Buypass', 'buypass.com', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'CA Disig', 'disig.sk', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'CATCert', 'aoc.cat', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'Certinomis', 'www.certinomis.com', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'Certizen', 'hongkongpost.gov.hk', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'certSIGN', 'certsign.ro', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'CFCA', 'cfca.com.cn', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'Chunghwa Telecom', 'cht.com.tw', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'Comodo', 'comodoca.com', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'D-TRUST', 'd-trust.net', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'DigiCert', 'digicert.com', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'DocuSign', 'docusign.fr', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'e-tugra', 'e-tugra.com', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'EDICOM', 'edicomgroup.com', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'Entrust', 'entrust.net', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'Firmaprofesional', 'firmaprofesional.com', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'FNMT', 'fnmt.es', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'GlobalSign', 'globalsign.com', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'GoDaddy', 'godaddy.com', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'Google Trust Services', 'pki.goog', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'GRCA', 'gca.nat.gov.tw', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'HARICA', 'harica.gr', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'IdenTrust', 'identrust.com', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'Izenpe', 'izenpe.com', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'Kamu SM', 'kamusm.gov.tr', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'Let''s Encrypt', 'letsencrypt.org', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'Microsec e-Szigno', 'e-szigno.hu', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'NetLock', 'netlock.hu', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'PKIoverheid', 'www.pkioverheid.nl', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'PROCERT', 'procert.net.ve', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'QuoVadis', 'quovadisglobal.com', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'SECOM', 'secomtrust.net', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'Sertifitseerimiskeskuse', 'sk.ee', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'StartCom', 'startcomca.com', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'SwissSign', 'swisssign.com', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'Symantec / Thawte / GeoTrust', 'symantec.com', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'T-Systems', 'telesec.de', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'Telia', 'telia.com', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'Trustwave', 'trustwave.com', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'Web.com', 'web.com', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'WISeKey', 'wisekey.com', 'Y', '', 0),
(NULL, 1, 1, 'riud', 'riud', '', 'Y', 'WoSign', 'wosign.com', 'Y', '', 0);

ALTER TABLE `dns_rr` CHANGE `type` `type` ENUM('A','AAAA','ALIAS','CAA','CNAME','DS','HINFO','LOC','MX','NAPTR','NS','PTR','RP','SRV','TXT','TLSA','DNSKEY') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;
ALTER TABLE `web_domain` ADD COLUMN `ssl_letsencrypt_exclude` enum('n','y') NOT NULL DEFAULT 'n' AFTER `ssl_letsencrypt`;
ALTER TABLE `remote_user` ADD `remote_access` ENUM('y','n') NOT NULL DEFAULT 'y' AFTER `remote_password`;
ALTER TABLE `remote_user` ADD `remote_ips` TEXT AFTER `remote_access`;
ALTER TABLE `web_domain` ADD `php_fpm_chroot` enum('n','y') NOT NULL DEFAULT 'n' AFTER `php_fpm_use_socket`;


ALTER TABLE `client_template`
  ADD COLUMN `limit_xmpp_webpresence` ENUM( 'n', 'y' ) NOT NULL default 'y',
  ADD COLUMN `limit_xmpp_http_upload` ENUM( 'n', 'y' ) NOT NULL default 'n';

ALTER TABLE `client`
  ADD COLUMN `limit_xmpp_webpresence` ENUM( 'n', 'y' ) NOT NULL default 'y',
  ADD COLUMN `limit_xmpp_http_upload` ENUM( 'n', 'y' ) NOT NULL default 'n';

ALTER TABLE `xmpp_domain`
  ADD COLUMN `use_webpresence` enum('n','y') NOT NULL DEFAULT 'y',
  ADD COLUMN `use_http_upload` enum('n','y') NOT NULL DEFAULT 'n';


-- STRIPDOWN!
ALTER TABLE `client` CHANGE `web_php_options` `web_php_options` VARCHAR(255) NOT NULL DEFAULT 'no,fast-cgi,mod,php-fpm';

-- only on nginx
UPDATE `web_domain` as d INNER JOIN `server` as s ON (s.server_id = d.server_id) SET d.php = 'php-fpm' WHERE d.php = 'fast-cgi' AND s.config LIKE '%\nserver_type=nginx\n%' AND s.config NOT LIKE '%\nserver_type=apache\n%';

UPDATE `web_domain` SET `php` = 'php-fpm' WHERE `php` = 'hhvm';
UPDATE `web_domain` SET `php` = 'fast-cgi' WHERE `php` = 'cgi';
UPDATE `web_domain` SET `php` = 'mod' WHERE `php` = 'suphp';

-- we do not drop columns or tables here to avoid deleting user data on existing servers!

-- END OF STRIPDOWN!

-- rspamd
ALTER TABLE `spamfilter_policy` ADD `rspamd_greylisting` ENUM('n','y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'n' AFTER `policyd_greylist`;
ALTER TABLE `spamfilter_policy` ADD `rspamd_spam_greylisting_level` DECIMAL(5,2) NULL DEFAULT NULL AFTER `rspamd_greylisting`;
ALTER TABLE `spamfilter_policy` ADD `rspamd_spam_tag_level` DECIMAL(5,2) NULL DEFAULT NULL AFTER `rspamd_spam_greylisting_level`;
ALTER TABLE `spamfilter_policy` ADD `rspamd_spam_tag_method` ENUM('add_header','rewrite_subject') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'rewrite_subject' AFTER `rspamd_spam_tag_level`;
ALTER TABLE `spamfilter_policy` ADD `rspamd_spam_kill_level` DECIMAL(5,2) NULL DEFAULT NULL AFTER `rspamd_spam_tag_method`;

UPDATE `spamfilter_policy` SET `rspamd_greylisting` = 'y' WHERE id = 4;
UPDATE `spamfilter_policy` SET `rspamd_greylisting` = 'y' WHERE id = 5;
UPDATE `spamfilter_policy` SET `rspamd_greylisting` = 'y' WHERE id = 6;

UPDATE `spamfilter_policy` SET `rspamd_spam_greylisting_level` = '4.00';
UPDATE `spamfilter_policy` SET `rspamd_spam_greylisting_level` = '6.00' WHERE id = 1;
UPDATE `spamfilter_policy` SET `rspamd_spam_greylisting_level` = '999.00' WHERE id = 2;
UPDATE `spamfilter_policy` SET `rspamd_spam_greylisting_level` = '999.00' WHERE id = 3;
UPDATE `spamfilter_policy` SET `rspamd_spam_greylisting_level` = '2.00' WHERE id = 6;
UPDATE `spamfilter_policy` SET `rspamd_spam_greylisting_level` = '7.00' WHERE id = 7;

UPDATE `spamfilter_policy` SET `rspamd_spam_tag_level` = '6.00';
UPDATE `spamfilter_policy` SET `rspamd_spam_tag_level` = '8.00' WHERE id = 1;
UPDATE `spamfilter_policy` SET `rspamd_spam_tag_level` = '999.00' WHERE id = 2;
UPDATE `spamfilter_policy` SET `rspamd_spam_tag_level` = '999.00' WHERE id = 3;
UPDATE `spamfilter_policy` SET `rspamd_spam_tag_level` = '4.00' WHERE id = 6;
UPDATE `spamfilter_policy` SET `rspamd_spam_tag_level` = '10.00' WHERE id = 7;

UPDATE `spamfilter_policy` SET `rspamd_spam_kill_level` = '10.00';
UPDATE `spamfilter_policy` SET `rspamd_spam_kill_level` = '12.00' WHERE id = 1;
UPDATE `spamfilter_policy` SET `rspamd_spam_kill_level` = '999.00' WHERE id = 2;
UPDATE `spamfilter_policy` SET `rspamd_spam_kill_level` = '999.00' WHERE id = 3;
UPDATE `spamfilter_policy` SET `rspamd_spam_kill_level` = '8.00' WHERE id = 6;
UPDATE `spamfilter_policy` SET `rspamd_spam_kill_level` = '20.00' WHERE id = 7;
-- end of rspamd

CREATE TABLE IF NOT EXISTS `addons` (
  `addon_id` int(11) NOT NULL AUTO_INCREMENT,
  `addon_ident` VARCHAR(100) NOT NULL DEFAULT '',
  `addon_version` VARCHAR(20) NOT NULL DEFAULT '',
  `addon_name` VARCHAR(255) NOT NULL DEFAULT '',
  `db_version` INT(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`addon_id`),
  UNIQUE KEY `ident` (`addon_ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;

CREATE TABLE IF NOT EXISTS `sys_mailqueue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_address` varchar(255) NOT NULL DEFAULT '',
  `recipients` text NOT NULL,
  `mail_content` mediumblob NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

ALTER TABLE `web_domain` ADD `jailkit_jkupdate_cron` enum('n','y') NOT NULL DEFAULT 'y' AFTER `custom_php_ini`;
ALTER TABLE `sys_datalog` ADD `session_id` varchar(64) NOT NULL DEFAULT '' AFTER `error`;

CREATE TABLE IF NOT EXISTS `sys_login` (
  `session_id` varchar(64) NOT NULL,
  `username` varchar(64) NOT NULL default '',
  `ip` varchar(255) NOT NULL default '',
  `login-time` TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

