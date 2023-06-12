<template>
  <v-app>
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
    name: "DefaultLayout",
}



</script>
