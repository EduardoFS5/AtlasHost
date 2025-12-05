// Ao carregar a página
document.addEventListener("DOMContentLoaded", async () => {
  try {
    // Buscar informações do usuário e seus planos
    const resposta = await fetch("conexao_usuario.php");
    const dados = await resposta.json();

    // Preenche nome e email
    document.getElementById("nome").textContent = `Nome: ${dados.usuario.nome}`;
    document.getElementById("email").textContent = `Email: ${dados.usuario.email}`;

    // Preenche a tabela com os planos
    const tabela = document.querySelector("#tabela-planos tbody");
    tabela.innerHTML = "";

    dados.planos.forEach(plano => {
      const linha = document.createElement("tr");
      linha.innerHTML = `
        <td>${plano.id_plano}</td>
        <td contenteditable="true">${plano.tipo}</td>
        <td contenteditable="true">${plano.data_fim}</td>
        <td>${plano.status}</td>
        <td>R$ ${plano.valor.toFixed(2)}</td>
        <td><button class="btn-salvar">Salvar</button></td>
      `;
      tabela.appendChild(linha);

      // Adiciona evento de salvar para cada linha
      linha.querySelector(".btn-salvar").addEventListener("click", async () => {
        const tipo = linha.children[1].textContent;
        const data_fim = linha.children[2].textContent;

        const resposta = await fetch("conexao_tabela.php", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            id_contrato: plano.id_contrato,
            id_plano: plano.id_plano,
            tipo,
            data_fim
          })
        });

        const resultado = await resposta.json();
        if (resultado.sucesso) {
          alert("✅ Dados atualizados com sucesso!");
        } else {
          alert("❌ Erro ao atualizar: " + resultado.erro);
        }
      });
    });
  } catch (erro) {
    console.error("Erro ao carregar dados:", erro);
  }
});
