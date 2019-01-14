<template>
  <form @submit.prevent="onSubmit">
    <vs-button
      color="rgb(11, 189, 135)"
      type="flat"
      @click="onClick"
      icon-pack="fas"
      disabled
      id="update-user-btn"
      icon="fa-check"
      >{{ this.$t("buttons.update") }}</vs-button
    >
    <vs-row>
      <vs-col vs-type="flex" vs-justify="center" vs-align="center" vs-w="2">
        <vs-input
          :label="this.$t('users.card.personalInfo.firstName')"
          :placeholder="user.firstName"
          @input="onInputChange"
          color="rgb(11, 189, 135)"
          v-model="user.firstName"
        />
      </vs-col>
      <vs-col vs-type="flex" vs-justify="center" vs-align="center" vs-w="2">
        <vs-input
          :label="this.$t('users.card.personalInfo.lastName')"
          :placeholder="user.lastName"
          @input="onInputChange"
          color="rgb(11, 189, 135)"
          v-model="user.lastName"
        />
      </vs-col>
      <vs-col vs-type="flex" vs-justify="center" vs-align="center" vs-w="2">
        <vs-input
          :label="this.$t('users.card.personalInfo.patronymic')"
          :placeholder="user.patronymic"
          @input="onInputChange"
          color="rgb(11, 189, 135)"
          v-model="user.patronymic"
        />
      </vs-col>
      <vs-col vs-type="flex" vs-justify="center" vs-align="center" vs-w="2">
        <vs-input
          :label="this.$t('users.card.personalInfo.birthdate')"
          :placeholder="user.birthdate"
          @input="onInputChange"
          color="rgb(11, 189, 135)"
          v-model="user.birthdate"
        />
      </vs-col>

      <vs-col vs-type="flex" vs-justify="center" vs-align="center" vs-w="2">
        <vs-select
          :label="this.$t('users.card.personalInfo.workState')"
          color="#0bbd87"
          @change="onSelectChange"
          v-model="user.workState"
          icon-pack="fas"
          icon="fa-angle-down"
        >
          <vs-select-item
            :key="index"
            :value="item.value"
            :text="item.text"
            v-for="(item, index) in workStates"
          />
        </vs-select>
      </vs-col>
      <vs-col vs-type="flex" vs-justify="center" vs-align="center" vs-w="2">
        <vs-input
          :label="this.$t('users.card.personalInfo.employeeNumber')"
          :placeholder="user.employeeNumber"
          @input="onInputChange"
          color="#0bbd87"
          v-model="user.employeeNumber"
        />
      </vs-col>
    </vs-row>
    <vs-row>
      <vs-col vs-type="flex" vs-justify="center" vs-align="center" vs-w="4">
        <vs-select
          class="selectExample"
          color="#0bbd87"
          @change="onSelectChange"
          :label="this.$t('users.card.personalInfo.citizenship')"
          v-model="user.citizenship"
          icon-pack="fas"
          icon="fa-angle-down"
        >
          <vs-select-item
            :key="index"
            :value="item.value"
            :text="item.text"
            v-for="(item, index) in countries"
          />
        </vs-select>
      </vs-col>
      <vs-col vs-type="flex" vs-justify="center" vs-align="center" vs-w="4">
        <vs-input
          :label="this.$t('users.card.personalInfo.birthplace')"
          color="#0bbd87"
          @input="onInputChange"
          :placeholder="user.birthplace"
          v-model="user.birthplace"
        />
      </vs-col>
      <vs-col vs-type="flex" vs-justify="center" vs-align="center" vs-w="2">
        <vs-select
          class="selectExample"
          color="#0bbd87"
          :label="this.$t('users.card.personalInfo.gender')"
          v-model="user.gender"
          @change="onSelectChange"
          icon-pack="fas"
          icon="fa-angle-down"
        >
          <vs-select-item
            :key="index"
            :value="item.value"
            :text="item.text"
            v-for="(item, index) in genders"
          />
        </vs-select>
      </vs-col>
      <vs-col vs-type="flex" vs-justify="center" vs-align="center" vs-w="2">
        <vs-select
          class="selectExample"
          color="#0bbd87"
          @change="onSelectChange"
          :label="this.$t('users.card.personalInfo.maritalStatus')"
          v-model="user.maritalStatus"
          icon-pack="fas"
          icon="fa-angle-down"
        >
          <vs-select-item
            :key="index"
            :value="item.value"
            :text="item.text"
            v-for="(item, index) in maritalStatuses"
          />
        </vs-select>
      </vs-col>
    </vs-row>
  </form>
</template>
<script>
import axios from "axios";

export default {
  props: {
    userAttributes: Object
  },
  methods: {
    onClick() {
      console.log("123");
    },
    onSubmit() {
      axios
        .patch(`/users/${this.user.id}`, {
          first_name: this.user.firstName
        })
        .then(() => {
          this.$vs.notify({
            title: this.$t("users.update.success"),
            color: "rgb(11, 189, 135)",
            iconPack: "fas",
            icon: "fa-check",
            time: 50000,
            position: "top-right"
          });
        })
        .catch(error => {
          console.log(error.response);
        });
    },
    onSelectChange() {
      const updateBtn = document.getElementById("update-user-btn");
      updateBtn.disabled = false;
    },
    onInputChange() {
      const updateBtn = document.getElementById("update-user-btn");
      updateBtn.disabled = false;
    }
  },
  data() {
    return {
      user: this.userAttributes,
      workStates: [
        {
          text: this.$t("users.attributes.workState.works"),
          value: "works"
        },
        {
          text: this.$t("users.attributes.workState.doesntWork"),
          value: "doesnt_work"
        }
      ],
      countries: [],
      genders: [
        { text: this.$t("users.attributes.gender.male"), value: "male" },
        { text: this.$t("users.attributes.gender.female"), value: "female" }
      ],
      maritalStatuses: [
        {
          text: this.$t("users.attributes.maritalStatus.single"),
          value: "single"
        },
        {
          text: this.$t("users.attributes.maritalStatus.married"),
          value: "married"
        },
        {
          text: this.$t("users.attributes.maritalStatus.civilMarriage"),
          value: "civil_marriage"
        },
        {
          text: this.$t("users.attributes.maritalStatus.divorced"),
          value: "divorced"
        },
        {
          text: this.$t("users.attributes.maritalStatus.widowed"),
          value: "widowed"
        }
      ]
    };
  },
  created() {
    console.log(this.user);
  }
};
</script>
<style>
.con-select {
  margin-bottom: 10px;
  width: 100%;
}
.vs-input {
  width: 100%;
}
.vs-input--input {
  border-radius: 0px;
  border: 0px !important;
}
.vs-select--input {
  border-radius: 0px;
  padding: 6.5px;
  border: 0px !important;
}
.vs-input--label,
.vs-select--label {
  font-size: 0.9rem;
  display: block;
  background-color: #0bbd87;
  color: #ffffff;
}
</style>
