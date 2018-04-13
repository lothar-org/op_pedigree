<?php
//
function connect($name='',$pwd='root',$user='root',$host='localhost',$charset='utf8')
{
	$link=mysql_connect($host,$user,$pwd) or die('数据库连接失败');
	mysql_set_charset($charset);
	mysql_select_db($name) or die('指定数据库打开失败');
	return $link;
}

function insert($table='',$data)
{
	$table = $_DB['prefix'].$table;
	if (is_array($data)) {
		$keys = join(",",array_keys($data));
		$vals = "'".join("','",array_values($data))."'";
		$sql="INSERT {$table} ({$keys}) VALUES ({$vals})";
	} else {
		$sql = $data;
	}
	mysql_query($sql);
	return mysql_insert_id();
}

function update($table='',$data,$where=null)
{
	$table = $_DB['prefix'].$table;
	foreach ($data as $key => $val) {
		if ($str==null) {
			$sep='';
		} else {
			$sep=',';
		}
		$str.=$sep.$key."='".$val."'";
	}
	$sql="update {$table} set {$str}".($where==null?null:" where ".$where);
	mysql_query($sql);
	return mysql_affected_rows();
}

function delete($table='',$where=null)
{
	$table = $_DB['prefix'].$table;
	$where=$where==null?null:" where ".$where;
	$sql="delete from {$table} {$where}";
	mysql_query($sql);
	return mysql_affected_rows();
}



function fetchOne($sql='',$result_type=MYSQL_ASSOC)
{
	$result=mysql_query($sql);
	$row=mysql_fetch_array($result,$result_type);
	return $row;
}

function fetchAll($sql='',$result_type=MYSQL_ASSOC)
{
	$result=mysql_query($sql);
	while (@$row=mysql_fetch_array($result,$result_type)) {
		$rows[]=$row;
	}
	return $rows;
}

function getResNum($sql='')
{
	$result=mysql_query($sql);
	return mysql_num_rows($result);
}

?>