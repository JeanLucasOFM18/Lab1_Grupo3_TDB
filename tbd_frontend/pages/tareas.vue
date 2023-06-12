<template>
    <div>
      <AppBarIn></AppBarIn>
      <br>
      <v-toolbar flat color="dark">
        <v-toolbar-title>Tareas</v-toolbar-title>
        <v-spacer></v-spacer>
        <v-btn outlined @click="showDialog = true" class="nav-btn">
          <v-icon left>
          mdi-plus
          </v-icon> 
          Ingresar tarea
        </v-btn>
      </v-toolbar>
      <v-data-table :headers="headers" :items="tareasDataTable" :sort-by="'id'" :sort-desc="false" class="elevation-0" small>
        <template v-slot:item.actions="{ item }">
          <v-icon small class="mr-2" @click="setTarea(item)">
            mdi-pencil
          </v-icon>
          <v-icon small @click="deleteTarea(item)">
            mdi-delete
          </v-icon>
        </template>
        <template v-slot:item.requerimientosTarea="{ item }">
          {{ item.requerimientosTarea.join(', ') }} 
        </template>
      </v-data-table>
      <v-dialog v-model="showDialog" @input="dialogClosed" max-width="500">
        <v-card>
          <v-card-title class="headline grey lighten-2" primary-title>{{ mensajeDialog }}</v-card-title>
          <v-card-text>
            <v-form @submit.prevent="save">
              <v-text-field v-model="newTarea.nombre" label="Nombre"></v-text-field>
                <v-text-field v-model="newTarea.descripcion" label="Descripción"></v-text-field>
                <v-text-field v-model.number="newTarea.cantidad_requeridos" label="Voluntarios requeridos" type="number"></v-text-field>
                <v-text-field v-model.number="newTarea.cantidad_inscritos" label="Voluntarios inscritos" type="number"></v-text-field>
                <v-select v-model="newTarea.id_emergencia" :items="emergencias" item-text="nombre" item-value="id" @input="setRequerimientos" label="Emergencia"></v-select>
                <v-select v-model="newTarea.id_estado" :items="estados" item-text="estado" item-value="id" label="Estado"></v-select>
                <v-select v-model="requerimientosSeleccionados" multiple :items="requerimientosActuales" item-text="habilidad" item-value="id" label="Requerimientos" required></v-select>
                <v-row justify="center">
                  <v-col cols="12" sm="4">
                    <v-btn class="nav-btn" color="primary" type="submit">Ingresar</v-btn>
                  </v-col>
                </v-row>  
            </v-form>
          </v-card-text>
        </v-card>
      </v-dialog>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  import AppBarIn from '../components/AppBar-In.vue';
  
  export default {
    data() {
        return {
            headers: [
                { text: "ID", value: "id", align: "start", sortable: false },
                { text: "Nombre", value: "nombre", sortable: false },
                { text: "Descripción", value: "descripcion", sortable: false },
                { text: "Voluntarios Requeridos", value: "cantidad_requeridos", sortable: false },
                { text: "Voluntarios Inscritos", value: "cantidad_inscritos", sortable: false },
                { text: "Emergencia", value: "nombreEmergencia", sortable: false },
                { text: "Estado", value: "nombreEstado", sortable: false },
                { text: "Requerimientos", value: "requerimientosTarea", sortable: false },
                { text: "Acciones", value: "actions", sortable: false },
            ],
            tareas: [],
            tareasDataTable: [],
            emergencias: [],
            estados: [],
            requerimientos: [],
            requerimientosActuales: [],
            requerimientosSeleccionados: [],
            requerimiento: null,
            requerimientosList: [],
            requerimientosListIds: [],
            emeHabilidad: [],
            tareaHabilidad: [],
            showDialog: false,
            banderaEdit: false,
            mensajeDialog: "Crear tarea",
            mayorId: 0,
            newTareaHabilidad: {
                id: 0,
                id_tarea: 0,
                id_eme_habilidad: 0,
            },
            newTarea: {
                id: 0,
                nombre: "",
                descripcion: "",
                cantidad_requeridos: 0,
                cantidad_inscritos: 0,
                id_emergencia: 0,
                id_estado: 0,
            },
        };
    },
    async mounted() {
        console.log(localStorage);
        await this.getTareas();
        await this.getEmergencias();
        await this.getEstados();
        await this.getRequerimientos();
        await this.getEmeHabilidad();
        await this.getTareaHabilidad();
        this.createTareaDataTable();
    },
    methods: {
        async save() {
            if (this.banderaEdit == true) {
                await this.editTareas(this.newTarea);
                await this.deleteTareaHabilidadByTarea(this.newTarea.id);
                await this.createTareaHabilidad();
                this.banderaEdit = false;
                window.location.assign("/tareas");
            }
            else {
                this.newTarea.id = this.tareas.length + 1;
                await this.addTareas(this.newTarea);
                await this.createTareaHabilidad();
                window.location.assign("/tareas");
            }
        },
        async addTareas(et) {
            const url = "http://localhost:8080/tareas/" + String(1);
            await axios
                .post(url, et)
                .then((response) => {
            })
                .catch((error) => {
                console.log(error);
            });
        },
        async addTareaHabilidad(et) {
            const url = "http://localhost:8080/tarea_habilidad";
            await axios
                .post(url, et)
                .then((response) => {
            })
                .catch((error) => {
                console.log(error);
            });
        },
        async getTareas() {
            try {
                const url = "http://localhost:8080/tareas";
                const response = await axios.get(url);
                this.tareas = response.data;
                console.log(response.data);
            }
            catch (error) {
                console.error(error);
            }
        },
        async getEmergencias() {
            try {
                const url = "http://localhost:8080/emergencias";
                const response = await axios.get(url);
                this.emergencias = response.data;
                console.log("Emergencias:");
                console.log(response.data);
            }
            catch (error) {
                console.error(error);
            }
        },
        async getEstados() {
            try {
                const url = "http://localhost:8080/estados_tarea";
                const response = await axios.get(url);
                this.estados = response.data;
            }
            catch (error) {
                console.error(error);
            }
        },
        async getRequerimientos() {
            try {
                const url = "http://localhost:8080/habilidades";
                const response = await axios.get(url);
                this.requerimientos = response.data;
                console.log("Requerimientos:");
                console.log(response.data);
            }
            catch (error) {
                console.error(error);
            }
        },
        async getEmeHabilidad() {
            try {
                const url = "http://localhost:8080/eme_habilidad";
                const response = await axios.get(url);
                this.emeHabilidad = response.data;
                console.log("Eme_Habilidad:");
                console.log(response.data);
            }
            catch (error) {
                console.error(error);
            }
        },
        async getTareaHabilidad() {
            try {
                const url = "http://localhost:8080/tarea_habilidad";
                const response = await axios.get(url);
                this.tareaHabilidad = response.data;
                console.log(response.data);
            }
            catch (error) {
                console.error(error);
            }
        },
        async editTareas(et) {
            const url = "http://localhost:8080/tareas/update/" + String(1);
            await axios
                .put(url, et)
                .then((response) => {
            })
                .catch((error) => {
                console.log(error);
            });
        },
        async deleteTareaHabilidad(et) {
            const url = "http://localhost:8080/tarea_habilidad/delete/" + String(et.id);
            await axios
                .delete(url)
                .then((response) => {
            })
                .catch((error) => {
                console.log(error);
            });
        },
        async createTareaHabilidad() {
            await this.findIdTareaHabilidad();
            for (let i = 0; i < this.requerimientosSeleccionados.length; i++) {
                this.newTareaHabilidad.id = this.mayorId + i + 1;
                this.newTareaHabilidad.id_tarea = this.newTarea.id;
                await this.setIdEmeHabilidadByIds(this.newTarea.id_emergencia, this.requerimientosSeleccionados[i]);
                await this.addTareaHabilidad(this.newTareaHabilidad);
            }
        },
        async setIdEmeHabilidadByIds(id_emergencia, id_habilidad) {
            for (let i = 0; i < this.emeHabilidad.length; i++) {
                if (this.emeHabilidad[i].id_emergencia == id_emergencia && this.emeHabilidad[i].id_habilidad == id_habilidad) {
                    console.log(this.emeHabilidad[i].id);
                    this.newTareaHabilidad.id_eme_habilidad = this.emeHabilidad[i].id;
                }
            }
        },
        async deleteTareaHabilidadByTarea(id) {
            for (let i = 0; i < this.tareaHabilidad.length; i++) {
                if (this.tareaHabilidad[i].id_tarea == id) {
                    this.deleteTareaHabilidad(this.tareaHabilidad[i]);
                }
            }
        },
        async findIdTareaHabilidad() {
            for (let i = 0; i < this.tareaHabilidad.length; i++) {
                if (this.tareaHabilidad[i].id > this.mayorId) {
                    this.mayorId = this.tareaHabilidad[i].id;
                }
            }
        },
        createTareaDataTable() {
            this.tareas.forEach(tarea => {
                const emergenciaAsociada = this.emergencias.find(em => em.id === tarea.id_emergencia);
                const estadoAsociado = this.estados.find(es => es.id === tarea.id_estado);
                tarea.nombreEmergencia = emergenciaAsociada.nombre ? emergenciaAsociada.nombre : null;
                tarea.nombreEstado = estadoAsociado.estado ? estadoAsociado.estado : null;
                tarea.requerimientosTarea = this.findRequerimientosByIdTarea(tarea.id);
                tarea.requerimientosTareaIds = this.findRequerimientosIdsByIdTarea(tarea.id);
            });
            this.tareasDataTable.splice(0, 0, ...this.tareas);
        },
        findRequerimientosByIdTarea(id) {
            this.requerimientosList = [];
            this.tareaHabilidad.forEach(tareaH => {
                if (tareaH.id_tarea === id) {
                    const emeHabilidadAsociada = this.emeHabilidad.find(em => em.id === tareaH.id_eme_habilidad);
                    const habilidadAsociada = this.requerimientos.find(req => req.id === emeHabilidadAsociada.id_habilidad);
                    this.requerimientosList.push(habilidadAsociada.habilidad);
                }
            });
            return this.requerimientosList;
        },
        findRequerimientosIdsByIdTarea(id) {
            this.requerimientosListIds = [];
            this.tareaHabilidad.forEach(tareaH => {
                if (tareaH.id_tarea === id) {
                    const emeHabilidadAsociada = this.emeHabilidad.find(em => em.id === tareaH.id_eme_habilidad);
                    const habilidadAsociada = this.requerimientos.find(req => req.id === emeHabilidadAsociada.id_habilidad);
                    this.requerimientosListIds.push(habilidadAsociada.id);
                }
            });
            return this.requerimientosListIds;
        },
        setRequerimientos() {
            this.requerimientosActuales = [];
            for (let i = 0; i < this.requerimientos.length; i++) {
                if (this.emeHabilidad[i].id_emergencia == this.newTarea.id_emergencia) {
                    this.requerimientosActuales.push(this.requerimientos[i]);
                    console.log("Requerimientos a mostrar:");
                    console.log(this.requerimientosActuales);
                }
            }
        },
        setTarea(tarea) {
            this.mensajeDialog = "Editar tarea";
            this.newTarea.id = tarea.id;
            this.newTarea = Object.assign({}, tarea);
            this.setRequerimientos();
            this.requerimientosSeleccionados = tarea.requerimientosTareaIds;
            this.banderaEdit = true;
            this.showDialog = true;
        },
        dialogClosed() {
            if (!this.showDialog) {
                this.mensajeDialog = "Crear tarea";
                this.newTarea.id = 0;
                this.newTarea.nombre = "";
                this.newTarea.descripcion = "";
                this.newTarea.cantidad_requeridos = 0;
                this.newTarea.cantidad_inscritos = 0;
                this.newTarea.id_emergencia = 0;
                this.newTarea.id_estado = 0;
                this.requerimientosSeleccionados = [];
                this.requerimientosActuales = [];
                this.banderaEdit = false;
            }
        },
    },
    components: { AppBarIn }
};
  </script>