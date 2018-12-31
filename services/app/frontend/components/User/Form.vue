<template>
  <form @submit.prevent="onSubmit" class="user-form">
    <div>{{ this.$t("users.form.title") }}</div>
    <div class="centerx labelx">
      <vs-input
        v-model="firstName"
        :label-placeholder="this.$t('users.form.firstName')"
        color="rgb(11, 189, 135)"
      />
      <vs-input
        v-model="lastName"
        :label-placeholder="this.$t('users.form.lastName')"
        color="rgb(11, 189, 135)"
      />
      <vs-input
        v-model="email"
        :label-placeholder="this.$t('users.form.email')"
        color="rgb(11, 189, 135)"
      />
    </div>
    <vs-button
      color="rgb(11, 189, 135)"
      type="border"
      icon-pack="fas"
      icon="fa-plus-circle"
    >
      {{ this.$t("buttons.create") }}
    </vs-button>
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

.user-form {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 25px;
}
</style>
