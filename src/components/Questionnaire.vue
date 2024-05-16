<template>
    <div class="questionnaire-container">
      <div class="questionnaire">
        <h2>Health Survey</h2>
        <form @submit.prevent="handleSubmit">
          <div v-for="(question, index) in visibleQuestions" :key="index" class="question">
            <label :for="'question-' + index">{{ question.text }}</label>
            <div>
              <template v-if="question.type === 'yesno'">
                <label>Yes</label>
                <input 
                  type="radio" 
                  :name="'question-' + index" 
                  value="yes" 
                  v-model="answers[index]" 
                />
                <label>No</label>
                <input 
                  type="radio" 
                  :name="'question-' + index" 
                  value="no" 
                  v-model="answers[index]" 
                /> 
              </template>
              <input 
                v-if="question.type === 'text'" 
                type="text" 
                :id="'question-' + index" 
                v-model="answers[index]" 
              />
            </div>
          </div>
          <button type="submit">Submit</button>
        </form>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    name: 'Questionnaire',
    data() {
      return {
        questions: [
          { text: 'Do you have a chronic illness?', type: 'yesno', conditional: [1, 2, 3] },
          { text: 'What is your chronic illness?', type: 'text', condition: 0 },
          { text: 'How long have you had your chronic illness?', type: 'text', condition: 0 },
          { text: 'Are you taking medication for your chronic illness?', type: 'yesno', condition: 0 },
          { text: 'Do you have allergies?', type: 'yesno', conditional: [5, 6] },
          { text: 'What are your allergies?', type: 'text', condition: 4 },
          { text: 'Do you have a family history of chronic illness?', type: 'yesno' },
          { text: 'Do you smoke?', type: 'yesno' },
          { text: 'Do you drink alcohol?', type: 'yesno' },
          { text: 'Do you exercise regularly?', type: 'yesno' },
          { text: 'How many hours of sleep do you get per night?', type: 'text' },
          { text: 'Do you have any dietary restrictions?', type: 'yesno', conditional: [12] },
          { text: 'What are your dietary restrictions?', type: 'text', condition: 11 },
          { text: 'Have you had any surgeries in the past year?', type: 'yesno' },
          { text: 'Do you have any current injuries?', type: 'yesno' },
          { text: 'Do you experience chronic pain?', type: 'yesno' },
          { text: 'Do you experience stress regularly?', type: 'yesno' },
          { text: 'How would you rate your overall health?', type: 'text' },
          { text: 'Do you have regular check-ups with your doctor?', type: 'yesno' },
          { text: 'Do you take any vitamins or supplements?', type: 'yesno' },
          { text: 'Do you have any mental health concerns?', type: 'yesno', conditional: [22] },
          { text: 'What are your mental health concerns?', type: 'text', condition: 21 },
          { text: 'Do you have any vision or hearing problems?', type: 'yesno' },
          { text: 'Do you have any mobility issues?', type: 'yesno' },
          { text: 'Is there anything else you would like to share about your health?', type: 'text' },
        ],
        answers: Array(25).fill(''),
      };
    },
    computed: {
      visibleQuestions() {
        return this.questions.filter((question, index) => {
          if (question.condition !== undefined) {
            return this.answers[question.condition] === 'yes';
          }
          return true;
        });
      }
    },
    methods: {
      handleSubmit() {
        console.log('Submitted answers:', this.answers);
        alert('Survey submitted!');
      }
    }
  }
  </script>
  
  <style>
    .questionnaire-container {
    display: flex;
    width: 80%;
    justify-content: center;
    box-sizing: border-box;
    align-items: flex-start; /* Align items to the top */
    height: calc(100vh - 60px);
    padding-top: 80px; /* Increase padding to avoid content being hidden by the header */
    }
  .questionnaire {
    width: 80%;
    background: #f5f5f5;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
    border: 1px solid #ccc;
    text-align: left;
  }
  
  
h2 {
  text-align: center;
}

.question {
  margin-bottom: 20px;
}

label {
  display: block;
  margin-bottom: 10px;
  font-weight: bold;
}

.question > div {
  display: flex;
  align-items: center; /* Aligns the radio buttons with the text vertically */
  gap: 10px; /* Adds space between the radio buttons and text */
}

input[type="text"],
input[type="radio"] {
  display: block;
  margin-bottom: 10px;
}

input[type="text"] {
  width: calc(100% - 20px);
  padding: 10px;
  margin-top: 5px;
  border: 1px solid #ccc;
  border-radius: 5px;
  box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1);
}

input[type="radio"] {
  display: inline-block; /* Change to inline-block to align with labels */
  margin-right: 5px;
}

button {
  display: block;
  width: 100%;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  background-color: #2c3e50;
  color: #fff;
  font-size: 16px;
  cursor: pointer;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
  transition: background-color 0.3s ease;
}

button:hover {
  background-color: #1a252f;
}
  </style>