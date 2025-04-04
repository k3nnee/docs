<template>
<!--  <header>-->
<!--    <nav>-->
<!--      <Navbar />-->
<!--    </nav>-->
<!--  </header>-->
  <RouterView />
</template>

<script setup>
import { RouterView } from 'vue-router'
import Navbar from "@/components/Navbar.vue";
</script>

<style>
body {
  font-family: sans-serif;
  margin: 0;
  background-color: #f9fbfd;
}
</style>
