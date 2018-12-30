/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb
// })
import Vue from "vue/dist/vue.esm";
import VueResource from "vue-resource";
import VueSidebarMenu from "vue-sidebar-menu";
import Vuesax from "vuesax";
import VueFormGenerator from "vue-form-generator";
import axios from "axios";
import "vuesax/dist/vuesax.css";

import "./application.css";

import { library } from "@fortawesome/fontawesome-svg-core";
import { faCoffee } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import VueI18n from "vue-i18n";
import translations from "../config/locales/translations";

import MoiKrugPage from "../components/MoiKrugPage.vue";
import Sidebar from "../components/Sidebar.vue";
import MoiKrugForm from "../components/MoiKrugForm.vue";
import UsersPage from "../components/User/Index.vue";
import UserPage from "../components/User/Show.vue";
import UserForm from "../components/User/Form.vue";
import SessionNew from "../components/Session/New.vue";
import SettingsSkillsIndex from "../views/Settings/Skills/Index.vue";
import SettingsSkillsNew from "../views/Settings/Skills/New.vue";

library.add(faCoffee);

Vue.component("font-awesome-icon", FontAwesomeIcon);

Vue.use(Vuesax);
Vue.use(VueFormGenerator);
Vue.use(VueI18n);
Vue.use(VueResource);
Vue.use(VueSidebarMenu);

Vue.component("sidebar", Sidebar);
Vue.component("moi-krug-page", MoiKrugPage);
Vue.component("moi-krug-form", MoiKrugForm);
Vue.component("users-page", UsersPage);
Vue.component("user-page", UserPage);
Vue.component("user-form", UserForm);
Vue.component("session-new", SessionNew);
Vue.component("settings-skill-index", SettingsSkillsIndex);
Vue.component("settings-skill-new", SettingsSkillsNew);

const token = document
  .getElementsByName("csrf-token")[0]
  .getAttribute("content");
axios.defaults.headers.common["X-CSRF-Token"] = token;
axios.defaults.headers.common.Accept = "application/json";

const i18n = new VueI18n({
  locale: "ru", // set locale
  messages: translations // set locale messages
});

document.addEventListener("DOMContentLoaded", () => {
  Vue.http.headers.common["X-CSRF-Token"] = document
    .querySelector('meta[name="csrf-token"]')
    .getAttribute("content");
  const element = document.querySelector("#app");
  const app = new Vue({
    el: element,
    i18n
  });
});
