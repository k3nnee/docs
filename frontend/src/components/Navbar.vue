<template>
  <div class="navbar text-sm">
    <router-link class="nav-item" to="/"> Home </router-link>
    <router-link class="nav-item" to="/about"> About </router-link>
  </div>
</template>

<script>
export default {
  name: "Navbar",

}
</script>

<style scoped>
.navbar {
  background-color: #f0f4f9;
  padding: 10px;
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 10px;
}

.nav-item{
  text-decoration: none;
  color: #2B2A2A;
}
.nav-item:hover {
  color: black;
  cursor: pointer;
  transition: .25s;
}

.router-link-active {
  color: black;
}
</style>
