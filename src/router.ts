import { createRouter, createWebHashHistory } from 'vue-router';
import Home from './components/Home.vue';
import PatientsList from './components/PatientsList.vue';
import Appointments from './components/Appointments.vue';
import Messages from './components/Messages.vue';
import Questionnaire from './components/Questionnaire.vue';

const routes = [
  { path: '/', name: 'Home', component: Home },
  { path: '/:pathMatch(.*)*', name: 'NotFound', component: Home },
  { path: '/patientslist', name: 'Patients', component: PatientsList },
  { path: '/appointments', name: 'Appointments', component: Appointments },
  { path: '/messages', name: 'Messages', component: Messages },
  { path: '/profile/:id', name: 'Profile', component: Home },
  { path: '/questionnaire', name: 'Questionnaire', component: Questionnaire },
];

const router = createRouter({
  history: createWebHashHistory(),
  routes,
});

export default router;