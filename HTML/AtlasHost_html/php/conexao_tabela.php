<?php
include "conexao.php";
header('Content-Type: application/json; charset=utf-8');

$data = json_decode(file_get_contents("php://input"), true);

$id_contrato = intval($data["id_contrato"]);
$id_plano = intval($data["id_plano"]);
$tipo = $conn->real_escape_string($data["tipo"]);
$data_fim = $conn->real_escape_string($data["data_fim"]);

// Atualiza tipo do plano
$sql1 = "UPDATE Plano SET tipo = '$tipo' WHERE id_plano = $id_plano";
$ok1 = $conn->query($sql1);

// Atualiza data de fim do contrato
$sql2 = "UPDATE Contrato SET data_fim = '$data_fim' WHERE id_contrato = $id_contrato";
$ok2 = $conn->query($sql2);

if ($ok1 && $ok2) {
    echo json_encode(["sucesso" => true]);
} else {
    echo json_encode([
        "sucesso" => false,
        "erro" => $conn->error
    ]);
}
?>
