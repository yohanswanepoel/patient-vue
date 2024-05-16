<template>
    <div class="patient-info">
        <div class="patient-form">
      <h2>Patient Information</h2>
      <table>
        <tbody>
          <tr>
            <th>Name</th>
            <td>{{ patient.name }}</td>
          </tr>
          <tr>
            <th>Age</th>
            <td>{{ patient.age }}</td>
          </tr>
          <tr>
            <th>Health Identifier ID</th>
            <td>{{ patient.healthId }}</td>
          </tr>
          <tr>
            <th>Current Medication</th>
            <td>{{ patient.currentMedication }}</td>
          </tr>
          <tr>
            <th>Date of Last Visit</th>
            <td>{{ patient.lastVisit }}</td>
          </tr>
          <tr>
            <th>Current Conditions</th>
            <td>{{ patient.currentConditions }}</td>
          </tr>
        </tbody>
      </table>
    </div>
</div>
  </template>
  
  <script>
  export default {
    name: 'PatientTable',
    data() {
      return {
        patient: {
          name: 'John Doe',
          age: 45,
          healthId: 'A12345678',
          currentMedication: 'Lisinopril',
          lastVisit: '2024-01-15',
          currentConditions: 'Hypertension'
        }
      }
    }
  }
  </script>
  
  <style>
  .patient-info {
    width: 100%;
    padding: 20px;
  }

  .patient-form {
    width: 100%;
    background: #f5f5f5;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
    border: 1px solid #ccc;
    text-align: left;
  }
  
  table {
    width: 100%;
    border-collapse: collapse;
  }
  
  th, td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
  }
  
  th {
    background-color: #f2f2f2;
  }
  
  h2 {
    text-align: left;
  }
  </style>