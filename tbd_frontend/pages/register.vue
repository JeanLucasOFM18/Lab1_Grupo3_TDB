<template>
  <div class="login">
    <AppBarLogin></AppBarLogin>
    <h1 class="title">Sign up</h1>
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
        placeholder="YYYY-MM-DD"
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
      <label class="form-label" for="#latitud">Latitud ubicación:</label>
      <input
        v-model="latitud"
        class="form-input"
        id="latitud"
        placeholder="Latitud ubicación"
      />
      <label class="form-label" for="#longitud">Longitud ubicación:</label>
      <input
        v-model="longitud"
        class="form-input"
        id="longitud"
        placeholder="Longitud ubicación"
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
import AppBarLogin from "../components/AppBar-Login.vue";
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
            latitud: 0,
            longitud: 0,
            id_usuario: 0,
            usuario: {},
            voluntarios: [],
            usuario_creado: {},
            maxId: 0,
        };
    },
    async mounted() {
        await this.getVoluntarios();
        await this.getMaxUserId();
    },
    methods: {
        async getVoluntarios() {
            try {
                const url = "http://localhost:8080/voluntario";
                const response = await axios.get(url);
                this.voluntarios = response.data;
                console.log("voluntarios:");
                console.log(this.voluntarios);
            }
            catch (error) {
                console.error(error);
            }
        },
        async getMaxUserId() {
            for (let i = 0; i < this.voluntarios.length; i++) {
                if (this.voluntarios[i].id > this.maxId) {
                    this.maxId = this.voluntarios[i].id;
                }
            }
            console.log("MAXID:");
            console.log(this.maxId);
        },
        async register() {
            try {
                this.message = "";
                if (this.correo == "" || this.password == "") {
                    this.message = "debes rellenar todos los campos";
                    return false;
                }
                //Se asignan los valores ingresados para el usuario
                //y el id de usuario creado.
                let usuarioIn = {
                    "username": this.correo,
                    "password": this.password,
                };
                console.log(usuarioIn);
                //Se crea el usuario.
                await axios
                    .post("http://localhost:8080/register", usuarioIn)
                    .then((response) => {
                    console.log("Registrao en user");
                })
                    .catch((error) => {
                    console.log(error);
                });
                //Se asignan los valores ingresados para el voluntario
                //y el id de usuario creado.
                let voluntarioIn = {
                    "id": this.maxId + 1,
                    "nombre": this.nombre,
                    "fecha_nacimiento": this.fecha_nacimiento,
                    "latitud": this.latitud,
                    "longitud": this.longitud
                };
                console.log(voluntarioIn);
                //Se crea el voluntario.
                await axios
                    .post("http://localhost:8080/voluntario", voluntarioIn)
                    .then((response) => {
                    console.log("Registrao en volunteer");
                })
                    .catch((error) => {
                    console.log(error);
                });
                this.$router.push("/login");
            }
            catch (error) {
                console.error(error);
            }
        },
    },
    components: { AppBarLogin }
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
