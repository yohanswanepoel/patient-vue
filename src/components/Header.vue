<template>
    <div class="header">
      <nav>
        <ul>
          <li><router-link to="/">Home</router-link></li>
          <li><router-link to="/patientslist">Patients</router-link></li>
          <li><router-link to="/appointments">Appointments</router-link></li>
          <li><router-link to="/messages">Messages</router-link></li>
          <li><router-link to="/questionnaire">Questionnaire</router-link></li>
        </ul>
      </nav>
    </div>
  </template>
  
  <script setup lang="ts">

  </script>
  
  <style>
  .header {
    width: 100%;
    height: 60px;
    background-color: #2c3e50;
    display: flex;
    align-items: center;
    justify-content: center;
    position: fixed;
    top: 0;
    left: 0;
    z-index: 1000;
  }
  
  nav ul {
    list-style: none;
    margin: 0;
    padding: 0;
    display: flex;
  }
  
  nav ul li {
    margin: 0 15px;
  }
  
  nav ul li a {
    color: #fff;
    text-decoration: none;
    font-size: 16px;
  }
  
  nav ul li a:hover {
    text-decoration: underline;
  }
  </style>