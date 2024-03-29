<?php

/*
Copyright (c) 2018 Marius Burkard, ISPConfig UG
All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright notice,
      this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright notice,
      this list of conditions and the following disclaimer in the documentation
      and/or other materials provided with the distribution.
    * Neither the name of ISPConfig nor the names of its contributors
      may be used to endorse or promote products derived from this software without
      specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

define('SCRIPT_PATH', dirname($_SERVER["SCRIPT_FILENAME"]));
require SCRIPT_PATH."/lib/config.inc.php";
require SCRIPT_PATH."/lib/app.inc.php";

set_time_limit(0);
ini_set('error_reporting', E_ALL & ~E_NOTICE);

// make sure server_id is always an int
$conf['server_id'] = intval($conf['server_id']);

if(!isset($_SERVER['argv'])) {
	die('No package path given.');
}

$action = '';
$package = '';
$force = false;

$argv = $_SERVER['argv'];
for($a = 1; $a < count($argv); $a++) {
	if($argv[$a] === '--install' || $argv[$a] === 'install'
			|| $argv[$a] === '--update' || $argv[$a] === 'update') {
		$action = 'install';
	} elseif($argv[$a] === '--uninstall' || $argv[$a] === 'uninstall') {
		$action = 'uninstall';
	} elseif($argv[$a] === '--force') {
		$force = true;
	} elseif(substr($argv[$a], -4) === '.pkg' && is_file($argv[$a])) {
		$package = $argv[$a];
	} else {
		die('Unknown argument ' . $argv[$a]);
	}
}

if($action == 'uninstall') {
	die('Automatic uninstall not supported, yet.');
} else {
	try {
		$app->addon_installer->installAddon($package, $force);
	} catch(Exception $e) {
		die('Error: ' . $e->getMessage() . "\n");
	}
}