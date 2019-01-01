<template>
  <sidebar-menu :menu="menu" :collapsed="collapsed" @collapse="onCollapse" />
</template>

<script>
export default {
  data() {
    return {
      menu: [
        {
          title: this.$t("sidebar.my_information"),
          icon: "fas fa-user-circle",
          href: "/users/"
        },

        {
          title: this.$t("sidebar.users.title"),
          icon: "fas fa-users",
          child: [
            {
              href: "/users",
              icon: "fas fa-users",
              title: this.$t("sidebar.users.list")
            },
            {
              href: "/users/new",
              icon: "fas fa-user-plus",
              title: this.$t("sidebar.users.newUser")
            }
          ]
        },
        {
          title: this.$t("sidebar.settings.title"),
          icon: "fas fa-cogs",
          child: [
            {
              icon: "far fa-list-alt",
              title: this.$t("sidebar.settings.catalogs.title"),
              child: [
                {
                  icon: "fas fa-screwdriver",
                  title: this.$t("sidebar.settings.catalogs.skills"),
                  href: "/settings/catalogs/skills"
                },
                {
                  icon: "fas fa-graduation-cap",
                  title: this.$t("sidebar.settings.catalogs.educations"),
                  href: "/settings/catalogs/educations"
                }
              ]
            },
            {
              title: this.$t("sidebar.integrations.title"),
              icon: "fa fa-hammer",
              child: [
                {
                  href: "/settings/integrations/moi_krugs",
                  icon: "fa fa-users",
                  title: this.$t("sidebar.integrations.moi_krug")
                }
              ]
            }
          ]
        },

        {
          title: this.$t("sidebar.logout"),
          icon: "fas fa-sign-out-alt",
          href: "/logout"
        }
      ],
      collapsed: false
    };
  },
  methods: {
    onCollapse(val) {
      this.collapsed = val;

      const app = document.querySelector("#app");
      if (this.collapsed) {
        app.classList.add("collapsed");
      } else {
        app.classList.remove("collapsed");
      }
    }
  }
};
</script>
