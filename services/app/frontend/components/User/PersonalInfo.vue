<template>
  <form>
    <vs-row>
      <vs-col vs-type="flex" vs-justify="center" vs-align="center" vs-w="3">
        <vs-input
          :label="this.$t('users.card.personalInfo.firstName')"
          :placeholder="user.firstName"
          color="rgb(11, 189, 135)"
          v-model="user.firstName"
        />
      </vs-col>
      <vs-col vs-type="flex" vs-justify="center" vs-align="center" vs-w="3">
        <vs-input
          :label="this.$t('users.card.personalInfo.lastName')"
          :placeholder="user.lastName"
          color="rgb(11, 189, 135)"
          v-model="user.lastName"
        />
      </vs-col>
      <vs-col vs-type="flex" vs-justify="center" vs-align="center" vs-w="3">
        <vs-input
          :label="this.$t('users.card.personalInfo.patronymic')"
          :placeholder="user.patronymic"
          color="rgb(11, 189, 135)"
          v-model="user.patronymic"
        />
      </vs-col>
      <vs-col vs-type="flex" vs-justify="center" vs-align="center" vs-w="3">
        <vs-input
          :label="this.$t('users.card.personalInfo.birthdate')"
          :placeholder="user.birthdate"
          color="rgb(11, 189, 135)"
          v-model="user.birthdate"
        />
      </vs-col>
    </vs-row>
    <vs-row>
      <vs-col vs-type="flex" vs-justify="center" vs-align="center" vs-w="4">
        <vs-select
          :label="this.$t('users.card.personalInfo.workState')"
          color="#0bbd87"
          v-model="user.workState"
          icon-pack="fas"
          icon="fa-arrow-down"
        >
          <vs-select-item
            :key="index"
            :value="item.value"
            :text="item.text"
            v-for="(item, index) in workStates"
          />
        </vs-select>
      </vs-col>
      <vs-col vs-type="flex" vs-justify="center" vs-align="center" vs-w="4">
        <vs-input
          :label="this.$t('users.card.personalInfo.employeeNumber')"
          :placeholder="user.employeeNumber"
          color="#0bbd87"
          v-model="user.employeeNumber"
        />
      </vs-col>
      <vs-col vs-type="flex" vs-justify="center" vs-align="center" vs-w="4">
        <vs-select
          class="selectExample"
          color="#0bbd87"
          :label="this.$t('users.card.personalInfo.citizenship')"
          v-model="user.citizenship"
          icon-pack="fas"
          icon="fa-arrow-down"
        >
          <vs-select-item
            :key="index"
            :value="item.value"
            :text="item.text"
            v-for="(item, index) in countries"
          />
        </vs-select>
      </vs-col>
    </vs-row>
    <vs-row>
      <vs-col vs-type="flex" vs-justify="center" vs-align="center" vs-w="4">
        <vs-input
          :label="this.$t('users.card.personalInfo.birthplace')"
          color="#0bbd87"
          :placeholder="user.birthplace"
          v-model="user.birthplace"
        />
      </vs-col>
      <vs-col vs-type="flex" vs-justify="center" vs-align="center" vs-w="4">
        <vs-select
          class="selectExample"
          color="#0bbd87"
          :label="this.$t('users.card.personalInfo.gender')"
          v-model="user.gender"
          icon-pack="fas"
          icon="fa-arrow-down"
        >
          <vs-select-item
            :key="index"
            :value="item.value"
            :text="item.text"
            v-for="(item, index) in genders"
          />
        </vs-select>
      </vs-col>
      <vs-col vs-type="flex" vs-justify="center" vs-align="center" vs-w="4">
        <vs-select
          class="selectExample"
          color="#0bbd87"
          :label="this.$t('users.card.personalInfo.maritalStatus')"
          v-model="user.maritalStatus"
          icon-pack="fas"
          icon="fa-arrow-down"
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
export default {
  props: {
    userAttributes: Object
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
