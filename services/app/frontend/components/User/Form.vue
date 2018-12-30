<template>
  <form @submit.prevent="onSubmit">
    <div class="centerx labelx">
      <vs-input v-model="firstName" label="First name" color="success" />
      <vs-input v-model="lastName" label="Last name" color="success" />
      <vs-input v-model="email" label="Email" color="success" />
    </div>
    <vs-button color="success" type="filled">Success</vs-button>
  </form>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      firstName: "",
      lastName: "",
      email: ""
    };
  },
  methods: {
    getUserIdFromUrl() {
      return window.location.pathname.split("/")[2];
    },
    onSubmit() {
      const id = this.getUserIdFromUrl();
      const userUrl = `/users/${id}`;
      axios
        .patch(userUrl, {
          first_name: this.firstName,
          last_name: this.lastName,
          email: this.email
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
