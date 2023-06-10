<template>
  <div class="login">
    <h1 class="title">Ingresar en la pagina</h1>
    <form action class="form" @submit.prevent="login">
      <label class="form-label" for="#correo">Correo:</label>
      <input
        v-model="correo"
        class="form-input"
        type="correo"
        id="correo"
        required
        placeholder="Correo"
      />
      <label class="form-label" for="#password">Password:</label>
      <input
        v-model="password"
        class="form-input"
        type="password"
        id="password"
        placeholder="Password"
      />
      <input class="form-submit" type="submit" value="Ingresar" />
    </form> 
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      correo: "",
      password: "",
      usuarios: [],
      error: false,
    };
  },
  methods: {
    async login() {
      //Se obtienen los usuario registrados.
      try {
        const response = await axios.get("http://localhost:8080/usuario");
        this.usuarios = response.data;
        console.log(response.data);
      } catch (error) {
        console.error(error);
      }
      var estaUsuario = false;
      //Se verifica si el usuario ingresado esta registrado.
      for (var i = 0; i < this.usuarios.length; ++i) {
        if (this.usuarios[i].correo == this.correo) {
          if (this.usuarios[i].password == this.password) {
            estaUsuario = true;
          }
        }
      }
      if (estaUsuario) {
        this.$router.push("/tareas");
      } else {
        this.error = true;
      }
    },
  },
};
</script>

<style lang="scss" scoped>
.login {
  padding: 2rem;
}
.title {
  text-align: center;
}
.form {
  margin: 3rem auto;
  display: flex;
  flex-direction: column;
  justify-content: center;
  width: 20%;
  min-width: 350px;
  max-width: 100%;
  background: rgba(19, 35, 47, 0.9);
  border-radius: 5px;
  padding: 40px;
  box-shadow: 0 4px 10px 4px rgba(0, 0, 0, 0.3);
}
.form-label {
  margin-top: 2rem;
  color: white;
  margin-bottom: 0.5rem;
  &:first-of-type {
    margin-top: 0rem;
  }
}
.form-input {
  padding: 10px 15px;
  background: none;
  background-image: none;
  border: 1px solid white;
  color: white;
  &:focus {
    outline: 0;
    border-color: #1ab188;
  }
}
.form-submit {
  background: #1ab188;
  border: none;
  color: white;
  margin-top: 3rem;
  padding: 1rem 0;
  cursor: pointer;
  transition: background 0.2s;
  &:hover {
    background: #0b9185;
  }
}
</style>
