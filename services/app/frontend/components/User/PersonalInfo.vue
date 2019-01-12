<template>
  <p>{{ user.first_name }}</p>
</template>
<script>
export default {
  props: {
    userAttributes: Object
  },
  data() {
    return {
      user: this.userAttributes
    };
  }
};
</script>
