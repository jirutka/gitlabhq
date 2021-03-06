import Vue from 'vue';
import Vuex from 'vuex';
import state from './state';
import * as actions from './actions';
import * as getters from './getters';
import mutations from './mutations';
import commitModule from './modules/commit';
import pipelines from './modules/pipelines';
import mergeRequests from './modules/merge_requests';
import branches from './modules/branches';
import fileTemplates from './modules/file_templates';

Vue.use(Vuex);

export const createStore = () =>
  new Vuex.Store({
    state: state(),
    actions,
    mutations,
    getters,
    modules: {
      commit: commitModule,
      pipelines,
      mergeRequests,
      branches,
      fileTemplates: fileTemplates(),
    },
  });

export default createStore();
