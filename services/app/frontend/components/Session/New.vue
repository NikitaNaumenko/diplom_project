<template>
  <div class="registration-page--container">
    <vs-col
      vs-offset="0"
      v-tooltip="'col - 8'"
      vs-type="flex"
      vs-justify="center"
      vs-align="center"
      vs-w="8"
    >
      <form class="registration-page--form" @submit.prevent="onSubmit">
        <div class="centerx labelx">
          <div class="form-group">
            <vs-input
              v-model="email"
              color="rgb(11, 189, 135)"
              label-placeholder="Email"
              size="large"
            />
          </div>
          <div class="form-group">
            <vs-input
              v-model="password"
              type="password"
              label-placeholder="Password"
              size="large"
              color="rgb(11, 189, 135)"
            />
          </div>
        </div>
        <vs-button color="rgb(11, 189, 135) " type="filled">Login</vs-button>
      </form>
    </vs-col>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      email: "",
      password: ""
    };
  },
  methods: {
    onSubmit() {
      axios
        .post("/sessions", {
          email: this.email,
          password: this.password
        })
        .then(response => {
          window.location.href = response.data.redirect_path;
        });
    }
  }
};
</script>

<style scoped>
.registration-page {
  &--container {
    display: flex;
    background: rgb(200, 244, 219);
    height: 100%;
    justify-content: center;
    align-items: center;
  }
  &--form {
    background: #ffffff;
    width: 360px;
    z-index: 1;
    max-width: 360px;
    margin: auto;
    padding: 45px;
    text-align: center;
    box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
  }
}
.form-group {
  font-family: "Roboto", sans-serif;
  outline: 0;
  width: 100%;
  border: 0;
  padding: 10px;
  box-sizing: border-box;
  font-size: 14px;
}
.vs-con-input-label {
  width: 100%;
}
</style>
