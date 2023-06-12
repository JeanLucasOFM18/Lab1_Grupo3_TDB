<template>
    <div id="map-wrap" style="height: 100vh; position: fixed; top: 0; left: 0; right: 0; bottom: 0; margin-top: 60px;">
      <AppBarIn></AppBarIn>
        <div class="filter-container">
            <v-select dense solo v-model="emergenciaSeleccionada" :items="emergencias" item-text="nombre" item-value="id" @input="setMarkers" label="Seleccionar Emergencia"></v-select>
        </div>
        <client-only>
            <l-map :zoom=11 :center="[-33.49148356086479, -70.67173222979008]" style="width: 100%">
                <l-tile-layer url="https://mt1.google.com/vt/lyrs=r&x={x}&y={y}&z={z}"></l-tile-layer>
                <l-marker v-for="marker in markers" :key="marker.id" :lat-lng="marker.coordinates"></l-marker>
            </l-map>
        </client-only>
    </div>
  </template>

<style scoped>
.filter-container {
    position: absolute;
    top: 20px;
    right: 20px;
    z-index: 500;
}
</style>

  <script>
  import axios from 'axios';
import AppBarIn from '../components/AppBar-In.vue';
  
  export default {
    data() {
        return {
            markers: [],
            emergenciaSeleccionada: 0,
            tareas: [],
            emergencias: [],
            vol_tarea: [],
            voluntarios: [],
            voluntariosFiltrados: [],
            regiones: [],
            idsTareasVol: [],
            idsVol: []
        };
    },
    async mounted() {
        console.log(this.markers);
        await this.getEmergencias();
        await this.getRanking();
        await this.getTareas();
        await this.getVoluntarios();
    },
    methods: {
        async getEmergencias() {
            try {
                const url = "http://localhost:8080/emergencias";
                const response = await axios.get(url);
                this.emergencias = response.data;
                console.log(response.data);
            }
            catch (error) {
                console.error(error);
            }
        },
        async getTareas() {
            try {
                const url = "http://localhost:8080/tareas";
                const response = await axios.get(url);
                this.tareas = response.data;
                console.log("tareas:");
                console.log(response.data);
            }
            catch (error) {
                console.error(error);
            }
        },
        async getRanking() {
            try {
                const url = "http://localhost:8080/ranking";
                const response = await axios.get(url);
                this.vol_tarea = response.data;
                console.log("vol_tarea:");
                console.log(response.data);
            }
            catch (error) {
                console.error(error);
            }
        },
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
        async setMarkers() {
            this.markers = [];
            this.idsTareasVol = [];
            this.idsVol = [];
            this.voluntariosFiltrados = [];
            for (let i = 0; i < this.tareas.length; i++) {
                if (this.tareas[i].id_emergencia == this.emergenciaSeleccionada) {
                    this.idsTareasVol.push(i + 1);
                }
            }
            for (let i = 0; i < this.vol_tarea.length; i++) {
                for (let j = 0; j < this.idsTareasVol.length; j++) {
                    if (this.vol_tarea[i].id_tarea == this.idsTareasVol[j]) {
                        this.idsVol.push(this.vol_tarea[i].id_voluntario);
                    }
                }
            }
            for (let i = 0; i < this.voluntarios.length; i++) {
                for (let j = 0; j < this.idsVol.length; j++) {
                    if (this.voluntarios[i].id == this.idsVol[j]) {
                        this.voluntariosFiltrados.push(this.voluntarios[i]);
                    }
                }
            }
            this.markers = [];
            for (let i = 0; i < this.voluntariosFiltrados.length; i++) {
                const marker = {
                    coordinates: [this.voluntariosFiltrados[i].latitud, this.voluntariosFiltrados[i].longitud],
                    id: i
                };
                this.markers.push(marker);
            }
            console.log(this.markers);
        }
    },
    components: { AppBarIn }
}
  </script>