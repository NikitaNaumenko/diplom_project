<template lang="html">
  <div>
    <vs-row>
      <vs-col vs-type="flex" vs-align="center" vs-w="9">
        <vs-avatar
          size="120px"
          src="https://pp.userapi.com/c840533/v840533023/600dc/7LYQ3Qd0Tl0.jpg"
        />

        <div class="user-card--badge">
          <h2>{{ `${user.firstName} ${user.lastName}` }}</h2>
          <span class="user-card--badge__position"> Web developer </span>
        </div>
      </vs-col>
      <vs-col vs-type="flex" vs-justify="flex-end" vs-align="center" vs-w="3">
      </vs-col>
    </vs-row>
    <vs-row>
      <vs-tabs vs-position="left" color="rgb(11, 189, 135)">
        <vs-tab :vs-label="this.$t('users.card.general.title')">
          <general-info v-bind:userAttributes="user"></general-info>
        </vs-tab>
        <vs-tab :vs-label="this.$t('users.card.workInfo.title')">
          <work-info></work-info>
        </vs-tab>
        <vs-tab :vs-label="this.$t('users.card.personalInfo.title')">
          <personal-info v-bind:userAttributes="user"></personal-info>
        </vs-tab>
      </vs-tabs>
    </vs-row>
  </div>
</template>

<script>
import axios from "axios";
import _ from "lodash";
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
  beforeCreate() {
    axios.get(window.location.pathname).then(response => {
      this.user = _.transform(
        response.data.data.attributes,
        (result, value, key) => {
          const camelCaseKey = _.camelCase(key);
          const resultObject = result;
          resultObject[camelCaseKey] = value;
          return result;
        },
        {}
      );
    });
  }
};
</script>

<style scoped>
.vs-row {
  padding-bottom: 25px;
  margin-bottom: 25px;
}
>>> .con-slot-tabs {
  width: 100%;
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
