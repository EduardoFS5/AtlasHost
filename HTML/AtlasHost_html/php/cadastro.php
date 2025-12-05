<?php
// Dados de conexão com o banco
$servername = "localhost";
$username = "root";
$password = "rosa"; // substitui aqui pela tua senha real
$dbname = "atlashost";

// 1. Conectar ao banco de dados
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexão
if ($conn->connect_error) {
    die("Falha na conexão: " . $conn->connect_error);
}

// 2. Receber dados do formulário (enviados pelo método POST)
$nome = $_POST['nome'];
$cpf = $_POST['cpf'];
$email = $_POST['email'];
$senha = $_POST['senha'];

// 3. Criptografar a senha (boa prática)
$senha_criptografada = password_hash($senha, PASSWORD_DEFAULT);

// 4. Verificar se o CPF ou e-mail já existe
$verifica = $conn->prepare("SELECT cpf, email FROM usuario WHERE cpf = ? OR email = ?");
$verifica->bind_param("ss", $cpf, $email);
$verifica->execute();
$verifica->store_result();

if ($verifica->num_rows > 0) {
    echo "❌ CPF ou e-mail já cadastrado.";
} else {
    // 5. Inserir o novo usuário
    $sql = $conn->prepare("INSERT INTO usuario (cpf, nome, email, senha, data_registro) VALUES (?, ?, ?, ?, CURDATE())");
    $sql->bind_param("ssss", $cpf, $nome, $email, $senha_criptografada);

    if ($sql->execute()) {
        echo "✅ Conta criada com sucesso!";
    } else {
        echo "Erro ao cadastrar: " . $sql->error;
    }

    $sql->close();
}

$verifica->close();
$conn->close();
?>
