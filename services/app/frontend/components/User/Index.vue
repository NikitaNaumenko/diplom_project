<template lang="html">
  <div>
    <vs-table :data="users">
      <template slot="header">
        <div class="table-header"><h3>Users</h3></div>
      </template>
      <template slot="thead">
        <vs-th> {{ $t("message.hello") }}</vs-th>

        <vs-th> First Name </vs-th>

        <vs-th> Last Name </vs-th>

        <vs-th> Email </vs-th>
      </template>

      <template slot-scope="{ data }">
        <vs-tr v-for="(tr, indextr) in data" :key="indextr">
          <vs-td :data="data[indextr].id"> {{ data[indextr].id }} </vs-td>

          <vs-td :data="data[indextr].first_name">
            {{ data[indextr].first_name }}
          </vs-td>

          <vs-td :data="data[indextr].last_name">
            {{ data[indextr].last_name }}
          </vs-td>

          <vs-td :data="data[indextr].email">
            <vs-button
              line-origin="left"
              color="success"
              type="line"
              :href="/users/ + data[indextr].id"
              >{{ data[indextr].email }}</vs-button
            >
          </vs-td>
        </vs-tr>
      </template>
    </vs-table>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data: () => ({
    users: []
  }),
  created() {
    axios.get("/users").then(response => {
      this.users = response.data.users;
    });
  },
  methods: {
    createLink() {
      return `/users/new`;
    }
  }
};
</script>

<style scoped>
.table-header {
  padding: 10px;
}
</style>
