<?php
require_once (__DIR__.'/content/vendor/autoload.php');
// Move the location of the content dir
define('WP_CONTENT_DIR', dirname(__FILE__).'/content');

$s = empty($_SERVER["HTTPS"]) ? '' : ($_SERVER["HTTPS"] == "on") ? "s" : "";
$sp = strtolower($_SERVER["SERVER_PROTOCOL"]);
$protocol = substr($sp, 0, strpos($sp, "/")) . $s;
$port = ($_SERVER["SERVER_PORT"] == "80") ? "" : (":".$_SERVER["SERVER_PORT"]);
define('WP_CONTENT_URL', $protocol."://".$_SERVER['SERVER_NAME'].$port.'/content');

require_once (__DIR__.'/wp-config-extra.php');