<?php

$GLOBALS['ldapdsn'] = array(
    array(
        'host' 		 => getenv("LDAP_HOST"),
        'port' 		 => getenv("LDAP_PORT"),
        'version'  	 => '3',
        'basedn'     => getenv("LDAP_BASEDN"),
        'binddn'    => getenv("LDAP_BINDDN"),
        'bindpw'    => getenv("LDAP_DINDPW"),
        'userattr'   => 'sAMAccountName',
        'attributes' => array('samaccountname'),
        'userfilter' => '(objectClass=user)',
        'referral'   => 'false',
    )
);
