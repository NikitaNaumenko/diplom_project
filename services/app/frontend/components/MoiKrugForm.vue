<template>
  <form @submit.prevent="onSubmit">
    <div class="centerx labelx">
      <vs-input v-model="clientId" label="Client id" color="success" />
      <vs-input v-model="clientSecret" label="Client Secret" color="success" />
    </div>
    <vs-button color="success" type="filled">Success</vs-button>
  </form>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      clientId: "",
      clientSecret: ""
    };
  },
  methods: {
    onSubmit() {
      axios
        .post("/moi_krugs", {
          client_id: this.clientId,
          client_secret: this.clientSecret
        })
        .then(response => {
          window.location.href = response.data.redirect_path;
        });
    }
  }
};
</script>

<style>
.vs-input {
  margin-bottom: 10px;
}
</style>
