ALTER TABLE `mail_mailinglist` ADD `list_type` enum('open','closed') NOT NULL DEFAULT 'open';
ALTER TABLE `mail_mailinglist` ADD `subject_prefix` varchar(50) NOT NULL DEFAULT '';
ALTER TABLE `mail_mailinglist` ADD `admins` mediumtext;
ALTER TABLE `mail_mailinglist` ADD `digestinterval` int(11) NOT NULL DEFAULT '7';
ALTER TABLE `mail_mailinglist` ADD `digestmaxmails` int(11) NOT NULL DEFAULT '50';
ALTER TABLE `mail_mailinglist` ADD `archive` enum('n','y') NOT NULL DEFAULT 'n';
ALTER TABLE `mail_mailinglist` ADD `digesttext` ENUM('n','y') NOT NULL DEFAULT 'n';
ALTER TABLE `mail_mailinglist` ADD `digestsub` ENUM('n','y') NOT NULL DEFAULT 'n';
ALTER TABLE `mail_mailinglist` ADD `mail_footer` mediumtext;
ALTER TABLE `mail_mailinglist` ADD `subscribe_policy` enum('disabled','confirm','approval','both','none') NOT NULL DEFAULT 'confirm';
ALTER TABLE `mail_mailinglist` ADD `posting_policy` enum('closed','moderated','free') NOT NULL DEFAULT 'free';
ALTER TABLE `web_domain` CHANGE `folder_directive_snippets` `folder_directive_snippets` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL;
