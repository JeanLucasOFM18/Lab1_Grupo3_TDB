<template>
  <v-app-bar app color="" elevation="0">
    <v-container>
      <v-row align="center">
        <v-col cols="auto">
            <img src="../static/blacklogo.png" alt="logo" height="40px" href="/">
        </v-col>
        <v-col cols="auto" class="ml-5">
          <v-btn text class="nav-btn" to="/login">Sign out</v-btn>
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
                  <v-list-item to="/tareas" class="list-item">
                    <v-list-item-title class="list-item-title">Nueva tarea</v-list-item-title>
                  </v-list-item>
                </v-list>
            </v-menu>
        </v-col>
        <v-col cols="auto" class="ml-6">
          <v-btn text class="nav-btn" to="/mapa">
            <v-icon>mdi-map</v-icon>
          </v-btn>
        </v-col>
      </v-row>
    </v-container>
  </v-app-bar>    
</template>