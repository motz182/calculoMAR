<?php   
  // session_destroy();
    $db = new PDO("mysql:host=$hostname;dbname=",'root','');
  $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF8">
    <link rel="stylesheet" type="text/css" href="estilo.css">
    <script>
      function verificaSenha (senha){ 
        if (senha.value != document.getElementById('senha').value) {
          senha.setCustomValidity('Senha incorreta');
        } 
        else 
        {
          senha.setCustomValidity('');
        }
      }
      function verifica() {
        var nome = document.getElementById("nome").value;
        if(nome == null || nome == "") {
          alert("O nome é obrigatório!");
          return false;
        }
        var email = document.getElementById("email").value;
        if(email == null || email == "") {
          alert("O email é obrigatório!");
          return false;
        }
        var senha = document.getElementById("senha").value;
        if(senha == null || senha == "") {
          alert("A senha é obrigatória!");
          return false;
        }
        return true;
      }
    </script>

    <title>Formulario de cadastro</title>
  </head>
  <body>
      <img src="logo.png" alt= "logo do Motz" width="100" height="80">
    
    <h3>Formulario de cadastro</h3>
    <p>Ola esta eh a pagina de cadastro de usuarios do sistema do motz</p>
   <br><br>
    
    <div>
      <fieldset>
        <form action="cadastro.php" method="post" onsubmit="return verifica();">
         <label for="nome">Nome :</label>
         <input type="text" id="nome" name="nome" placeholder="Digite seu nome."><br><br>

         <label for="email">Email :</label>          
         <input type="email" id="email" name="email" placeholder="exemplo@provedor.com"><br><br>


          <label for="senha" >Senha :</label>
          <input type="password" id="senha" name="senha" placeholder="Digite uma senha ..."><br><br>

          <label for="repetir_senha">Confirmar Senha :</label>
          <input type="password" id="senha" placeholder="Confirme a senha ..." required oninput="verificaSenha(this)"/><br><br>

          </fieldset><br>

          <input type="submit" id="cada" value="cadastrar">
        </form>
    </div><br>
    <a href="login.php"> Fazer Login</a>
  </body>
</html>