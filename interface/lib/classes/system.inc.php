<?php

/*
Copyright (c) 2016, Florian Schaal, schaal @it
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

class system {

	var $client_service = null;

	public function has_service($userid, $service) {
		global $app;

		if(!preg_match('/^[a-z]+$/', $service)) $app->error('Invalid service '.$service);

		if(isset($_SESSION['s']['user']) && $_SESSION['s']['user']['typ'] == 'admin') return true; //* We do not check admin-users

		// simple query cache
		if($this->client_service===null)
			$this->client_service = $app->db->queryOneRecord("SELECT client.* FROM sys_user, client WHERE sys_user.userid = ? AND sys_user.client_id = client.client_id", $userid);

		// isn't service
		if(!$this->client_service) return false;

		if($this->client_service['default_'.$service.'server'] > 0 || $this->client_service[$service.'_servers'] != '') {
			return true;
		} else {
			return false;
		}
	}
} //* End Class

?>


