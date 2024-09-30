<template>
    <div class="home">
      Environment - $ENV
      <div class="container">
        <PatientTable />
        <ChatWindow />
      </div>
    </div>
  </template>
  
  <script lang="ts">
  import { defineComponent } from 'vue';
  import PatientTable from './PatientTable.vue';
  import ChatWindow from './ChatWindow.vue';
  
  export default defineComponent({
    name: 'Home',
    components: {
      PatientTable,
      ChatWindow
    }
  });
  </script>
  
  <style scoped>
  .container {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    padding-top: 45px;
    height: 100vh;
  }
  
  .container > * {
    width: 48%;
  }
  </style>