<?php
ini_set("display_error", "on");//在php.ini里设置：display_errors = on
error_reporting(6143);//错误验证级别：最大  error_reporting(E_ALL);
header('Content-Type:text/html;charset=UTF-8');//设置字符集,纯PHP中使用


$dbi = new mysqli('localhost', 'root', 'root','tree');//要使用new操作符，最后一个参数是直接指定数据库　　
//假如构造时候不指定，那下一句需要$dbi->select_db('database')实现
// $dbi->query("set names utf8");
# check connection
if(mysqli_connect_errno()){
  printf("Connect failed: %s\n",mysqli_connect_error());
  $dbi = null;
  exit;
}
printf("Host infomation: %s\n",$dbi->host_info);
// $sql = "SELECT * FROM test ORDER BY id LIMIT 3";
// $res = $dbi->query($sql);
// $r = $res->fetch_row(); //取一行数据　　
// echo $r[0]; //输出第一个字段的值
// while ($row = $res->fetch_array(MYSQLI_BOTH)){
// 	echo "id".$row["id"]."<br>";
// }
// $dbi->free();
# close connection
// $dbi->close();