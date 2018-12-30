<template>
  <form @submit.prevent="onSubmit" class="account-form">
    <div>{{ this.$t("account.form.title") }}</div>
    <div class="centerx labelx">
      <vs-input
        v-model="name"
        :label-placeholder="this.$t('account.form.name')"
        color="rgb(11, 189, 135)"
      />
      <vs-input
        v-model="firstName"
        :label-placeholder="this.$t('account.form.firstName')"
        color="rgb(11, 189, 135)"
      />

      <vs-input
        v-model="email"
        :label-placeholder="this.$t('account.form.email')"
        color="rgb(11, 189, 135)"
      />
      <vs-input
        v-model="password"
        :label-placeholder="this.$t('account.form.password')"
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
      name: "",
      email: "",
      password: "",
      firstName: ""
    };
  },
  methods: {
    onSubmit() {
      axios
        .post("/accounts", {
          name: this.name,
          email: this.email,
          password: this.password,
          users_attributes: [
            {
              first_name: this.firstName,
              email: this.email,
              password: this.password,
              password_confirmation: this.password
            }
          ]
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
.account-form {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 25px;
}
</style>
