<template lang="html">
  <div>
    <vs-table :data="skills">
      <template slot="header">
        <div class="table-header">
          <h3 class="table-header--name">
            {{ this.$t("settings.skills.table.title") }}
          </h3>

          <vs-button
            @click="redirectTo"
            radius
            color="rgb(11, 189, 135)"
            type="flat"
            icon-pack="fas"
            icon="fa-plus-circle"
            :href="newLink()"
          ></vs-button>
        </div>
      </template>
      <template slot="thead">
        <vs-th>{{ this.$t("settings.skills.table.id") }}</vs-th>

        <vs-th>{{ this.$t("settings.skills.table.code") }}</vs-th>

        <vs-th>{{ this.$t("settings.skills.table.name") }}</vs-th>

        <vs-th>{{ this.$t("settings.skills.table.description") }}</vs-th>
        <vs-th></vs-th>
      </template>

      <template slot-scope="{ data }">
        <vs-tr v-for="(tr, indextr) in data" :key="indextr">
          <vs-td :data="data[indextr].id"> {{ data[indextr].id }} </vs-td>

          <vs-td :data="data[indextr].code"> {{ data[indextr].code }} </vs-td>

          <vs-td :data="data[indextr].name"> {{ data[indextr].name }} </vs-td>

          <vs-td :data="data[indextr].description">
            {{ data[indextr].description }}
          </vs-td>
          <vs-td>Edit</vs-td>
        </vs-tr>
      </template>
    </vs-table>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data: () => ({
    skills: []
  }),
  created() {
    axios.get("/settings/skills").then(response => {
      this.skills = response.data.skills;
    });
  },
  methods: {
    newLink() {
      return `/settings/skills/new`;
    }
  }
};
</script>

<style scoped>
.table-header {
  padding: 10px;

  &--name {
    display: inline-block;
  }
}

>>> .header-table {
  span {
    display: block;
    width: 100%;
  }
  .vs-button {
    float: right;
  }
}
</style>
