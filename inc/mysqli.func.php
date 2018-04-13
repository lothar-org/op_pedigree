<?php

function insert($table='',$data)
{
	$table = $_DB['pre'].$table;
	if (is_array($data)) {
		$key = array_keys($data);
		$val = array_values($data);
		$sql = "INSERT INTO `{$table}` SET ({$key}) VALUES ($val) ";
		// $sql = 'INSERT INTO `'.$table.'` ('.implode(',',$fields).') VALUES('.implode(',',$value).')';
	} else {
		$sql = $data;
	}
	mysqli_query($sql);
}

function fetchAll()
{

}

?>