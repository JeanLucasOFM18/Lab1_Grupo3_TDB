<template>
  <div>
    <AppBar-Login></AppBar-Login>
    <div class="login">
      <h1 class="title">Log in</h1>
      <form action class="form" @submit.prevent="login">
        <label class="form-label" for="#username">Correo:</label>
        <input
          v-model="username"
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
  </div>
</template>

<script>
import axios from "axios";
import {serialize} from 'cookie';
import AppbarLogin from "../components/AppBar-Login.vue";
export default {
    layout: false,
    data() {
        return {
            correo: "",
            username: "",
            password: "",
            usuarios: [],
            error: false,
        };
    },
    methods: {
        async login() {
            console.log(this.username);
            console.log(this.password);
            try {
                let input = {
                    "username": this.username,
                    "password": this.password
                };
                const url = "http://localhost:8080/login";
                await axios
                    .post(url, input)
                    .then((response) => {
                    if (response.statusText = "ok") {
                        localStorage.token = response.data.jwtToken;
                        function setCookie(name, value, days) {
                            var expires = "";
                            if (days) {
                                var date = new Date();
                                date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
                                expires = "; expires=" + date.toUTCString();
                            }
                            document.cookie = name + "=" + value + expires + "; path=/";
                        }
                        setCookie("token", response.data.jwtToken, 7);
                        console.log(localStorage);
                        this.$router.push("/tareas");
                    }
                    else {
                        this.$router.push("/login");
                    }
                });
            }
            catch (error) {
                console.error(error);
            }
        },
    },
    components: { AppbarLogin }
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
