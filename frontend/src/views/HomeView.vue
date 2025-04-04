<template>
  <div class="container" v-if="currentDocument">
    <Toolbelt />
    <Canvas />
  </div>
</template>

<script>
import Toolbelt from '@/components/Toolbelt.vue'
import Canvas from '@/components/Canvas.vue'
import { currentDocument } from '@/lib/state.js'

export default {
  name: 'HomeView',
  components: { Canvas, Toolbelt },
  setup() {
    console.log(currentDocument)

    return {
      currentDocument,
    }
  },
}
</script>

<style scoped>
.container {
  padding: 10px;
}
</style>
