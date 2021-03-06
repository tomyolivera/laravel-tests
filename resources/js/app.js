require('./bootstrap');

window.Vue = require('vue').default;

Vue.component('example-component', require('./components/ExampleComponent.vue').default);
Vue.component('main-component', require('./components/Main.vue').default);
Vue.component('user-component', require('./components/User.vue').default);

const app = new Vue({
    el: '#app',
});