<template>
  <v-app>
    <v-app-bar app color="" elevation="0">
    <v-container>
      <v-row align="center">
        <v-col cols="auto">
          <NuxtLink to="/">
            <img src="../static/blacklogo.png" alt="logo" height="40px" href="/">
          </NuxtLink>
        </v-col>
        <v-col cols="auto" class="ml-5">
          <v-btn text class="nav-btn">Sign up</v-btn>
        </v-col>
        <v-col>
          <v-menu offset-y>
            <template v-slot:activator="{ on }">
              <v-btn icon v-on="on">
                <v-icon>mdi-plus</v-icon>
              </v-btn>
              </template>
                <v-list dense>
                  <v-list-item class="list-item">
                    <v-list-item-title class="list-item-title">Nueva emergencia</v-list-item-title>
                  </v-list-item>
              
                  <v-list-item class="list-item">
                    <v-list-item-title class="list-item-title">Nuevo requerimiento</v-list-item-title>
                  </v-list-item>
                  <v-divider></v-divider>
                  <v-list-item to="/tareas" class="list-item">
                    <v-list-item-title class="list-item-title">Nueva tarea</v-list-item-title>
                  </v-list-item>
                </v-list>
            </v-menu>
        </v-col>
      </v-row>
    </v-container>
  </v-app-bar>

    <v-main>
      <v-container>
        <Nuxt />
      </v-container>
    </v-main>

    
    <v-footer padless color="transparent">
      
    <v-col
      class=" text-center"
      cols="12"
    >
    
      {{ new Date().getFullYear() }} — TBD
    </v-col>
  </v-footer>
  </v-app>
</template>

<style>
.nav-btn {
  font-size: 24px;
  text-transform: none;
}
.avatar {
  width: 32px;
  height: 32px;
  margin-left: 16px;
  margin-right: 16px;
}
.list-item {
  border-radius: 4px;
  transition: background-color 0.2s ease-in-out;
}
.list-item:hover {
  background-color: #f5f5f5;
}
.list-item-title {
  color: #333333;
}
</style>

<script>
export default {
  name: 'DefaultLayout',  
}



</script>
