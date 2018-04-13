<?php
/** 
* 预定义
* 定义根目录
* 定义插件目录(相对路径)
*/
define('__DS__', DIRECTORY_SEPARATOR);
define('__PS__', PATH_SEPARATOR);
define('__ROOT__', dirname(dirname(__FILE__)));
define('__INC__', __ROOT__.__DS__.'inc');
define('__PLUGIN__', __ROOT__.__DS__.'public'.__DS__.'plugins');

/** 设置包含路径 */
@set_include_path(get_include_path() . __PS__ . __INC__ . __PS__ . __PLUGIN__);

// 直接引入文件名
require_once 'db.php';
require_once 'config.php';
if (PHP_VERSION >= 5.5) {
	require_once 'mysqli.func.php';
} else {
	require_once 'mysql.func.php';
}

//连接数据库
connect($_DB['name'],$_DB['pwd']);

?>