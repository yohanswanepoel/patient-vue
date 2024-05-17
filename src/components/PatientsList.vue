<template>
    <div class="patient-table">
      <h2>Patient Information</h2>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Age</th>
            <th>Condition</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="patient in patients" :key="patient.id">
            <td><a :href="'/profile/'+patient.id">{{ patient.id }}</a></td>
            <td>{{ patient.name }}</td>
            <td>{{ patient.age }}</td>
            <td>{{ patient.condition }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </template>
  
  <script setup lang="ts">
  import { ref } from 'vue';
  
  const name = 'PatientsList';
  const patients = ref([
    { id: 1, name: 'John Doe', age: 45, condition: 'Healthy' },
    { id: 2, name: 'Jane Smith', age: 30, condition: 'Flu' },
    { id: 3, name: 'Sam Johnson', age: 65, condition: 'Diabetes' },
  ]);
  </script>
  
  <style>
  .patient-table {
    width: 90%;
    padding: 20px;
  }
  
  table {
    width: 100%;
    border-collapse: collapse;
  }
  
  th, td {
    border: 1px solid #ddd;
    padding: 8px;
  }
  
  th {
    background-color: #f2f2f2;
    text-align: left;
  }
  
  h2 {
    text-align: left;
  }
  </style>