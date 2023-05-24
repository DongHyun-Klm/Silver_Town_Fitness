<template>
  <div>
    <h1>현재 날씨: {{ weather }}</h1>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      weather: '',
    };
  },
  created() {
    this.getWeather();
  },
  methods: {
    getWeather() {
      const apiKey = 'YOUR_API_KEY'; // OpenWeatherMap에서 발급받은 API 키
      const city = 'Seoul'; // 날씨를 확인할 도시 이름

      axios
        .get(`https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${apiKey}`)
        .then((response) => {
          this.weather = response.data.weather[0].description;
        })
        .catch((error) => {
          console.error(error);
        });
    },
  },
};
</script>