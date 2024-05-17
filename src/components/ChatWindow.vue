<template>
    <div class="chat-window">
      <h2>Chat</h2>
      <div class="messages">
        <div v-for="message in messages" :key="message.id" :class="['message', message.type]">
          {{ message.text }}
        </div>
      </div>
      <input v-model="newMessage" @keyup.enter="sendMessage" placeholder="Type a message..." />
    </div>
  </template>
  
  <script setup lang="ts">
import { ref } from 'vue';

const name = 'ChatWindow';
const messages = ref([
  { id: 1, text: 'Hello!', type: 'received' },
  { id: 2, text: 'Hi there!', type: 'sent' }
]);
const newMessage = ref('');

const sendMessage = () => {
  if (newMessage.value.trim() !== '') {
    messages.value.push({ id: Date.now(), text: newMessage.value, type: 'sent' });
    newMessage.value = '';
  }
};
</script>
  
  <style>
  .chat-window {
    width: 100%;
    padding: 20px;
    display: flex;
    flex-direction: column;
    height: calc(100vh - 100px);
    box-sizing: border-box;
  }
  
  h2 {
    margin-top: 0;
  }
  
  .messages {
    flex-grow: 1;
    overflow-y: auto;
    margin-bottom: 10px;
    border: 1px solid #ddd;
    padding: 10px;
  }
  
  .message {
    margin-bottom: 10px;
    padding: 10px;
    border-radius: 5px;
  }
  
  .message.received {
    background-color: #e1ffc7;
    align-self: flex-start;
  }
  
  .message.sent {
    background-color: #c7e1ff;
    align-self: flex-end;
  }
  
  input {
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    width: 100%;
    box-sizing: border-box;
  }
  </style>