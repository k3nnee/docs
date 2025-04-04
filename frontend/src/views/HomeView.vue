<template>
  <div class="container" v-if="metaData !== null">
    <Toolbelt :meta-data="metaData" />

    <Canvas />
  </div>
</template>

<script>
import Toolbelt from "@/components/Toolbelt.vue";
import {onMounted, ref} from "vue";
import {DocumentInformation} from "@/lib/library.js";
import Canvas from "@/components/Canvas.vue";

export default {
  name: "HomeView",
  components: {Canvas, Toolbelt},
  setup() {
    const metaData = ref(null);
    onMounted(() => {
      metaData.value = new DocumentInformation("Placeholder title", "Kenny Tang", new Date().toString());
    })

    return {
      metaData
    }
  }
}
</script>

<style scoped>
.container {
  padding: 10px;
}
</style>
