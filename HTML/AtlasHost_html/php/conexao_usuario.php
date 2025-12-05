<?php
include "conexao.php";
header('Content-Type: application/json; charset=utf-8');

// CPF fixo (depois você muda para pegar da sessão)
$cpf_usuario = "42651874854"; 

// Buscar informações do usuário
$sql_usuario = "SELECT cpf, nome, email, administrador FROM Usuario WHERE cpf = '$cpf_usuario'";
$result_usuario = $conn->query($sql_usuario);

if ($result_usuario->num_rows == 0) {
    echo json_encode(["erro" => "Usuário não encontrado"]);
    exit;
}

$usuario = $result_usuario->fetch_assoc();

// Buscar planos contratados
$sql_planos = "
SELECT 
    Contrato.id_contrato,
    Plano.id_plano,
    Plano.tipo,
    Contrato.data_fim,
    Contrato.valor,
    Contrato.status
FROM Contrato
INNER JOIN Plano ON Plano.id_plano = Contrato.id_plano
WHERE Contrato.cpf_usuario = '$cpf_usuario'
";

$result_planos = $conn->query($sql_planos);

$planos = [];
while ($row = $result_planos->fetch_assoc()) {
    $planos[] = $row;
}

echo json_encode([
    "usuario" => [
        "cpf" => $usuario["cpf"],
        "nome" => $usuario["nome"],
        "email" => $usuario["email"],
        "admin" => $usuario["administrador"]
    ],
    "planos" => $planos
], JSON_UNESCAPED_UNICODE);
?>
