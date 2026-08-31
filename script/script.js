const dados = [];

const toggle = document.getElementById("toggle");
if (toggle) {
  toggle.addEventListener("click", function () {
    alert("Pedido enviado ao Administrador");
  });
}

const formLogin = document.getElementById("formulario");
if (formLogin) {
  formLogin.addEventListener("submit", function (e) {
    e.preventDefault();

    let valido = true;
    const usuarioInput = document.getElementById("usuario");
    const senhaInput = document.getElementById("senha");
    const usuario = usuarioInput.value;
    const senha = senhaInput.value;
    const erroUsuario = document.getElementById("erro-usuario");
    const erroSenha = document.getElementById("erro-senha");

    if (erroUsuario) erroUsuario.innerHTML = "";
    if (erroSenha) erroSenha.innerHTML = "";

    usuarioInput.classList.remove("is-invalid");
    senhaInput.classList.remove("is-invalid");

    if (usuario.trim() === "") {
      usuarioInput.classList.add("is-invalid");
      if (erroUsuario) erroUsuario.innerHTML = "Campo de usuario vazio!";
      valido = false;
    } else if (usuario.trim() !== "Administrador") {
      usuarioInput.classList.add("is-invalid");
      if (erroUsuario) erroUsuario.innerHTML = "Usuario inexistente!";
      valido = false;
    }

    if (senha.trim() === "") {
      senhaInput.classList.add("is-invalid");
      if (erroSenha) erroSenha.innerHTML = "Campo de senha vazio!";
      valido = false;
    } else if (senha.trim() !== "1543") {
      senhaInput.classList.add("is-invalid");
      if (erroSenha) erroSenha.innerHTML = "Senha incorreta!";
      valido = false;
    }

    if (!valido) return;

    dados.push({ usuario, senha });
    console.table(dados);
    alert("Login realizado!");
    window.location.href = "public/home.html";
    formLogin.reset();
  });
}
