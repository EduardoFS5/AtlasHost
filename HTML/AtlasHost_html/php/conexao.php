<?php
$servidor = "localhost";
$usuario = "root";   // ou o nome de usuário do Workbench, se você configurou
$senha = "rosa";         // ou a senha que você criou no MySQL Workbench
$banco = "atlasHost";  // o nome do banco de dados

$conn = new mysqli($servidor, $usuario, $senha, $banco);

if ($conn->connect_error) {
    die("Erro de conexão: " . $conn->connect_error);
}
?>
