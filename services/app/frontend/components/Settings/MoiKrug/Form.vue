<template>
  <form @submit.prevent="onSubmit" class="moi-krug-form">
    <div>{{ this.$t("settings.integrations.moiKrug.form.title") }}</div>
    <div class="centerx labelx">
      <vs-input
        v-model="clientId"
        :label-placeholder="
          this.$t('settings.integrations.moiKrug.form.clientID')
        "
        color="rgb(11, 189, 135)"
      />
      <vs-input
        v-model="clientSecret"
        :label-placeholder="
          this.$t('settings.integrations.moiKrug.form.clientSecret')
        "
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
      clientId: "",
      clientSecret: ""
    };
  },
  methods: {
    onSubmit() {
      axios
        .post("/settings/integrations/moi_krugs", {
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
.moi-krug-form {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 25px;
}
</style>
