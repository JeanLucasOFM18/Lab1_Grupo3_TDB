<template>
  <v-app-bar app color="" elevation="0">
    <v-container>
      <v-row align="center">
        <v-col cols="auto">
          <NuxtLink to="/">
            <img src="../static/blacklogo.png" alt="logo" height="40px" href="/">
          </NuxtLink>
        </v-col>
        <v-col cols="auto" class="ml-5">
          <v-btn text class="nav-btn" to="/register">Sign up</v-btn>
          <v-btn text class="nav-btn" to="/login">Log in</v-btn>
        </v-col>
      </v-row>
    </v-container>
  </v-app-bar>    
</template>