<template>
  <div class="login">
    <h1 class="title">Formulario de registro</h1>
    <form action class="form" @submit.prevent="register">
      <label class="form-label" for="#nombre">Nombre:</label>
      <input
        v-model="nombre"
        class="form-input"
        type="nombre"
        id="nombre"
        placeholder="Nombre"
      />
      <label class="form-label" for="#fecha_nacimiento"
        >Fecha Nacimiento:</label
      >
      <input
        v-model="fecha_nacimiento"
        class="form-input"
        type="fecha_nacimiento"
        id="fecha_nacimiento"
        placeholder="Fecha Nacimiento"
      />
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
      <input class="form-submit" type="submit" value="Registrarse" />
    </form>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "register.vue",
  metaInfo() {
    return {
      layout: "none", // Indicar que no se debe mostrar el diseño
    };
  },
  data() {
    return {
      message: "",
      correo: "",
      password: "",
      rol: "",
      nombre: "",
      fecha_nacimiento: "",
      id_usuario: 0,
      usuario: {},
      voluntario: {},
      usuario_creado: {},
    };
  },
  methods: {
    async register() {
      this.message = "";
      if (this.correo == "" || this.password == "") {
        this.message = "debes rellenar todos los campos";
        return false;
      }

      //Se asignan los valores ingresados para el usuario
      //y el id de usuario creado.
      this.usuario = {
        correo: this.correo,
        password: this.password,
        rol: "voluntario",
      };

      //Se crea el usuario.
      var usuarioCreado;
      await axios
        .post("http://localhost:8080/usuario", this.usuario)
        .then((response) => {
          usuarioCreado = response.data;
        })
        .catch((error) => {
          console.log(error);
        });

      //Se asignan los valores ingresados para el voluntario
      //y el id de usuario creado.
      this.voluntario = {
        nombre: this.nombre,
        fecha_nacimiento: this.fecha_nacimiento,
        id_usuario: usuarioCreado.id,
      };

      //Se crea el voluntario.
      await axios
        .post("http://localhost:8080/voluntario", this.voluntario)
        .then((response) => {})
        .catch((error) => {
          console.log(error);
        });
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
