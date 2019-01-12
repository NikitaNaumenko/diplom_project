<template lang="html">
  <div>
    <vs-row>
      <vs-col vs-type="flex" vs-align="center" vs-w="9">
        <vs-avatar
          size="120px"
          src="https://avatars2.githubusercontent.com/u/31676496?s=460&v=4"
        />

        <div class="user-card--badge">
          <h2>{{ `${user.first_name} ${user.last_name}` }}</h2>
          <span class="user-card--badge__position"> Web developer </span>
        </div>
      </vs-col>
      <vs-col vs-type="flex" vs-justify="flex-end" vs-align="center" vs-w="3">
        <vs-button
          color="dark"
          type="line"
          icon-pack="far"
          icon="fa-edit"
          :href="editLink()"
        />
      </vs-col>
    </vs-row>
    <vs-row>
      <vs-tabs vs-position="left" color="rgb(11, 189, 135)">
        <vs-tab :vs-label="this.$t('users.card.general.title')">
          <general-info></general-info>
        </vs-tab>
        <vs-tab :vs-label="this.$t('users.card.workInfo.title')">
          <work-info></work-info>
        </vs-tab>
        <vs-tab :vs-label="this.$t('users.card.familyInfo.title')">
          <personal-info v-bind:userAttributes="user"></personal-info>
        </vs-tab>
      </vs-tabs>
    </vs-row>
  </div>
</template>

<script>
import axios from "axios";
import GeneralInfo from "./GeneralInfo.vue";
import PersonalInfo from "./PersonalInfo.vue";
import WorkInfo from "./WorkInfo.vue";

export default {
  data: () => ({
    user: {}
  }),
  components: {
    GeneralInfo,
    PersonalInfo,
    WorkInfo
  },
  created() {
    axios.get(window.location.pathname).then(response => {
      this.user = response.data.data.attributes;
    });
  },
  methods: {
    editLink() {
      return `${window.location.pathname}/edit`;
    }
  }
};
</script>

<style scoped>
.vs-row {
  padding-bottom: 25px;
  margin-bottom: 25px;
}
.user-card {
  &--badge {
    display: flex;
    flex-direction: column;
    margin-left: 25px;

    &__position {
      margin-top: 15px;
      font-size: 16px;
    }
  }
}
</style>
