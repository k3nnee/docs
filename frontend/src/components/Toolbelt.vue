<template>
  <div class="container">
    <div class="pb-2">
      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
        <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 14.25v-2.625a3.375 3.375 0 0 0-3.375-3.375h-1.5A1.125 1.125 0 0 1 13.5 7.125v-1.5a3.375 3.375 0 0 0-3.375-3.375H8.25m2.25 0H5.625c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 0 0-9-9Z" />
      </svg>
    </div>

    <!-- Metadata -->
    <div>
      <div class="text-l"> {{this.metaData.title}} </div>

      <div class="belt-data-container">
        <div class="text-sm">
          <p class="m-0"> {{this.metaData.author}} </p>
          <p class="m-0"> {{this.metaData.createdAt}} </p>
        </div>
      </div>
    </div>
  </div>

  <!-- Toolbelt -->
  <div class="belt-button-container text-sm mx-1">
    <div class="text-button"> File </div>
    <div class="text-button"> Edit </div>
    <div class="text-button"> Save </div>
  </div>
</template>

<script>
import {DocumentInformation} from "@/lib/library.js";
import {ref} from "vue";

export default {
  name: "Toolbelt",
  props: {
    metaData: {
      type: DocumentInformation,
        required: true
    },
  },
  setup() {
    const isSidebarDisplayed = ref(false);

    const toggleSidebar = () => {
      isSidebarDisplayed.value = !isSidebarDisplayed.value;
    }

    return {
      isSidebarDisplayed,
      toggleSidebar
    }
  }
}
</script>

<style scoped>
  .belt-data-container {
    margin: 0 0 10px 0;
    display: flex;
    align-items: center;
  }

  .belt-button-container {
    background-color: #F0F0F0;
    border-radius: 15px;
    display: flex;
    gap: 8px;
    padding: 10px;
    margin-bottom: 10px;
  }

  .container {
    display: flex;
    gap: 10px;
    align-items: center;
  }
</style>
