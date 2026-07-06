<?php

$sourceDbName = 'slakdb';
$destinationDbName = 'slakdbdest';
$connection = new PDO('mysql:host=hostname;dbname=' . $sourceDbName, 'root', 'djemos');

$tables = $connection->query("SHOW TABLES")->fetchAll(PDO::FETCH_COLUMN);
$connection->exec("USE {$destinationDbName}");

foreach ($tables as $tableName) {
    $createCommand = $connection->query("SHOW CREATE TABLE `{$sourceDbName}`.`{$tableName}`")->fetchColumn(1);
    $carefulCreateCommand = str_replace("CREATE TABLE", "CREATE TABLE IF NOT EXISTS", $createCommand);
    
    $connection->exec($carefulCreateCommand);
    echo "Table `{$tableName}` created" . PHP_EOL;
  
    $connection->exec("INSERT INTO `{$destinationDbName}`.`{$tableName}` SELECT * FROM `{$sourceDbName}`.`{$tableName}`");
    echo "Data for table `{$tableName}` copied" . PHP_EOL;
}
