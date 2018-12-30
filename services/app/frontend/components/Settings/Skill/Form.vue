<template>
  <form @submit.prevent="onSubmit" class="skills-form">
    <div>{{ this.$t("settings.skills.form.title") }}</div>
    <div class="centerx labelx">
      <vs-input
        v-model="code"
        :label-placeholder="this.$t('settings.skills.form.code')"
        color="rgb(11, 189, 135)"
      />
      <vs-input
        v-model="name"
        :label-placeholder="this.$t('settings.skills.form.name')"
        color="rgb(11, 189, 135)"
      />
      <vs-input
        v-model="description"
        :label-placeholder="this.$t('settings.skills.form.description')"
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
      code: "",
      name: "",
      description: ""
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
.skills-form {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 25px;
}
</style>
