<template>
  <form @submit.prevent="onSubmit">
    <vs-row vs-justify="center">
      <vs-col vs-type="flex" vs-justify="center" vs-align="center" vs-w="3">
        <vs-input
          :label="this.$t('users.card.personalInfo.firstName')"
          :placeholder="user.firstName"
          @input="onInputChange"
          color="rgb(11, 189, 135)"
          v-model="user.firstName"
        />
      </vs-col>
      <vs-col vs-type="flex" vs-justify="center" vs-align="center" vs-w="3">
        <vs-input
          :label="this.$t('users.card.personalInfo.lastName')"
          :placeholder="user.lastName"
          @input="onInputChange"
          color="rgb(11, 189, 135)"
          v-model="user.lastName"
        />
      </vs-col>
      <vs-col vs-type="flex" vs-justify="center" vs-align="center" vs-w="3">
        <vs-input
          :label="this.$t('users.card.personalInfo.patronymic')"
          :placeholder="user.patronymic"
          @input="onInputChange"
          color="rgb(11, 189, 135)"
          v-model="user.patronymic"
        />
      </vs-col>
      <vs-col vs-type="flex" vs-justify="center" vs-align="center" vs-w="3">
        <vs-input
          :label="this.$t('users.card.personalInfo.birthdate')"
          :placeholder="user.birthdate"
          @input="onInputChange"
          color="rgb(11, 189, 135)"
          v-model="user.birthdate"
        />
      </vs-col>
    </vs-row>
    <vs-row vs-justify="center">
      <vs-col vs-type="flex" vs-justify="center" vs-align="center" vs-w="3">
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
      <vs-col vs-type="flex" vs-justify="center" vs-align="center" vs-w="3">
        <vs-input
          :label="this.$t('users.card.personalInfo.employeeNumber')"
          :placeholder="user.employeeNumber"
          @input="onInputChange"
          color="#0bbd87"
          v-model="user.employeeNumber"
        />
      </vs-col>
      <vs-col vs-type="flex" vs-justify="center" vs-align="center" vs-w="3">
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
      <vs-col vs-type="flex" vs-justify="center" vs-align="center" vs-w="3">
        <vs-input
          :label="this.$t('users.card.personalInfo.birthplace')"
          color="#0bbd87"
          @input="onInputChange"
          :placeholder="user.birthplace"
          v-model="user.birthplace"
        />
      </vs-col>
    </vs-row>
    <vs-row vs-justify="center">
      <vs-col vs-type="flex" vs-justify="center" vs-align="center" vs-w="3">
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
      <vs-col vs-type="flex" vs-justify="center" vs-align="center" vs-w="3">
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
    <vs-row vs-justify="center">
      <div class="m20">
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
      </div>
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
          first_name: this.user.firstName,
          last_name: this.user.lastName,
          patronymic: this.user.patronymic,
          birthdate: this.user.birthdate,
          work_state: this.user.workState,
          employee_number: this.user.employeeNumber,
          citizenship: this.user.citizenship,
          birthplace: this.user.birthplace,
          gender: this.user.gender,
          marital_status: this.user.maritalStatus
        })
        .then(() => {
          this.$vs.notify({
            title: this.$t("users.update.success"),
            color: "rgb(11, 189, 135)",
            time: 50000,
            position: "top-right"
          });
        })
        .catch(error => {
          this.$vs.notify({
            title: this.$t("users.update.failure"),
            color: "danger",
            time: 50000,
            position: "top-right"
          });
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
  width: 90%;
}
.vs-input {
  width: 90%;
}
</style>
