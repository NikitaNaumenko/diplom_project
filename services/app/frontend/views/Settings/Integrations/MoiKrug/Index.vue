<template>
  <vs-row>
    <vs-col vs-type="flex" vs-justify="center" vs-align="center" vs-w="6">
      <vs-button
        v-if="isMoiKrugSettingExists"
        color="rgb(11, 189, 135)"
        type="flat"
        size="large"
        icon-pack="fas"
        icon="fa-plus-circle"
        @click="onClick"
        >{{ this.$t("buttons.authorization") }}</vs-button
      >
      <vs-button
        v-else
        color="rgb(11, 189, 135)"
        type="flat"
        size="large"
        icon-pack="fas"
        icon="fa-plus-circle"
        href="/settings/integrations/moi_krugs/new"
        >{{ this.$t("buttons.createIntegrationSettings") }}</vs-button
      >
    </vs-col>
    <vs-col vs-type="flex" vs-justify="center" vs-align="center" vs-w="6">
      <vs-button
        v-if="isMoiKrugTokenExists"
        color="rgb(11, 189, 135)"
        type="flat"
        size="large"
        icon-pack="fas"
        icon="fa-exchange-alt"
        @click="onPing"
        >{{ this.$t("buttons.ping") }}</vs-button
      >
    </vs-col>
  </vs-row>
</template>
<script>
import axios from "axios";

export default {
  props: {
    isMoiKrugSettingExists: Boolean,
    isMoiKrugTokenExists: Boolean
  },
  methods: {
    onClick() {
      const { hostname } = window.location;
      axios
        .post(`http://${hostname}:5000/moi_krugs/auth_urls`)
        .then(response => {
          const { uri } = response.data;
          window.open(uri);
        });
    },
    onPing() {
      axios.get("/moi_krugs/pings");
    }
  }
};
</script>
