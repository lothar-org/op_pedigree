<?php
header('Content-Type:text/html;charset=UTF-8');
require_once 'inc/include.php';// 核心文件 统一调用

$sql="select * from `lol_match`";
$rows=fetchAll($sql);
print_r($rows);

?>