<template>
  <div>
    <AppBarLogin></AppBarLogin>
    <v-row>
      <v-col class="text-left">
        <blockquote class="blockquote">
          Aplicación web destinada a la gestión de voluntariado.
        </blockquote>
      </v-col>
    </v-row>
  </div>
</template>

<script>
import AppBarLogin from '../components/AppBar-Login.vue';

export default {
    name: "IndexPage",
    components: { AppBarLogin }
}
</script>
