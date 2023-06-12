import Vue from 'vue'
import Router from 'vue-router'
import { normalizeURL, decode } from 'ufo'
import { interopDefault } from './utils'
import scrollBehavior from './router.scrollBehavior.js'

const _14ee01bc = () => interopDefault(import('..\\pages\\login.vue' /* webpackChunkName: "pages/login" */))
const _b96c81fc = () => interopDefault(import('..\\pages\\mapa.vue' /* webpackChunkName: "pages/mapa" */))
const _5b6ceda0 = () => interopDefault(import('..\\pages\\register.vue' /* webpackChunkName: "pages/register" */))
const _c01f6362 = () => interopDefault(import('..\\pages\\tareas.vue' /* webpackChunkName: "pages/tareas" */))
const _4b465ea5 = () => interopDefault(import('..\\pages\\index.vue' /* webpackChunkName: "pages/index" */))

const emptyFn = () => {}

Vue.use(Router)

export const routerOptions = {
  mode: 'history',
  base: '/',
  linkActiveClass: 'nuxt-link-active',
  linkExactActiveClass: 'nuxt-link-exact-active',
  scrollBehavior,

  routes: [{
    path: "/login",
    component: _14ee01bc,
    name: "login"
  }, {
    path: "/mapa",
    component: _b96c81fc,
    name: "mapa"
  }, {
    path: "/register",
    component: _5b6ceda0,
    name: "register"
  }, {
    path: "/tareas",
    component: _c01f6362,
    name: "tareas"
  }, {
    path: "/",
    component: _4b465ea5,
    name: "index"
  }],

  fallback: false
}

export function createRouter (ssrContext, config) {
  const base = (config._app && config._app.basePath) || routerOptions.base
  const router = new Router({ ...routerOptions, base  })

  // TODO: remove in Nuxt 3
  const originalPush = router.push
  router.push = function push (location, onComplete = emptyFn, onAbort) {
    return originalPush.call(this, location, onComplete, onAbort)
  }

  const resolve = router.resolve.bind(router)
  router.resolve = (to, current, append) => {
    if (typeof to === 'string') {
      to = normalizeURL(to)
    }
    return resolve(to, current, append)
  }

  return router
}
