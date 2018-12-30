<template lang="html">
  <div>
    <vs-row>
      <vs-col vs-type="flex" vs-justify="center" vs-align="center" vs-w="9">
        <h3>{{ `${user.first_name} ${user.last_name}` }}</h3>
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
      <vs-col
        :key="index"
        vs-type="flex"
        vs-justify="center"
        vs-align="center"
        vs-w="6"
      >
        {{ user.email }}
      </vs-col>
      <vs-col
        :key="index"
        vs-type="flex"
        vs-justify="center"
        vs-align="center"
        vs-w="6"
      >
        {{ user.email }}
      </vs-col>
    </vs-row>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data: () => ({
    user: {}
  }),
  created() {
    axios.get(window.location.pathname).then(response => {
      this.user = response.data.user;
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
  border-bottom: 1px solid rgb(36, 33, 69);
}
</style>
