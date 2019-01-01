<template>
  <form @submit.prevent="onSubmit" class="educations-form">
    <div>{{ this.$t("settings.educations.form.title") }}</div>
    <div class="centerx labelx">
      <vs-input
        v-model="code"
        :label-placeholder="this.$t('settings.educations.form.code')"
        color="rgb(11, 189, 135)"
      />
      <vs-input
        v-model="name"
        :label-placeholder="this.$t('settings.educations.form.name')"
        color="rgb(11, 189, 135)"
      />
      <vs-input
        v-model="description"
        :label-placeholder="this.$t('settings.educations.form.description')"
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
    onSubmit() {
      axios
        .patch("/settings/catalogs/educations", {
          code: this.code,
          name: this.name,
          description: this.description
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
.educations-form {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 25px;
}
</style>
