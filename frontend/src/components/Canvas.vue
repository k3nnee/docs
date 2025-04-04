<template>
  <div class="canvas-container">
    <canvas class="canvas" id="canvas"></canvas>
  </div>
</template>

<script>
import {onMounted, ref} from "vue";
import {keys} from "@/lib/library.js";

export default {
  name: "Canvas",
  setup() {
    const textBody = ref([""]);
    const pointer = ref(0);

    const handleKeyPress = (ctx, key, width, height) => {
      const pointerValue = pointer.value;

      console.log(pointer.value, textBody.value);

      switch(key) {
        case keys.BACKSPACE:
          if (textBody.value[pointerValue].length === 0 && textBody.value.length > 1) {
            textBody.value.pop();
            pointer.value -= 1;
          } else {
            textBody.value[pointerValue] = textBody.value[pointerValue].slice(0, textBody.value[pointerValue].length-1);
          }
          break;
        case keys.ENTER:
          pointer.value += 1;
          textBody.value[pointer.value] = "";
          break;
        default:
          if (key.length !== 1){
            return;
          }

          if (!textBody.value[pointerValue]) {
            textBody.value[pointerValue] = key;
          } else {
            textBody.value[pointerValue] += key;
          }
      }

      ctx.clearRect(0, 0,  width, height);
      textBody.value.forEach((text, index) => {
        ctx.fillText(text, 10, (index+1) * 20);
      })
    }

    onMounted(() => {
      const canvas = document.getElementById("canvas");
      const ctx = canvas.getContext("2d");

      const scale = window.devicePixelRatio || 1;

      canvas.width = 800 * scale;
      canvas.height = 1000 * scale;

      ctx.font = "15px Arial";
      ctx.fillText(textBody.value, 10, 20);

      document.addEventListener("keydown", (event) => {
        event.preventDefault();
        handleKeyPress(ctx, event.key, canvas.width, canvas.height);
      })
    })
  }
}
</script>

<style scoped>
.canvas {
  max-height: 1000px;
  max-width: 800px;
  min-height: 500px;
  min-width: 400px;

  border: 1px solid #E4E7E9;
  background-color: white;
}

.canvas-container {
  display: flex;
  justify-content: center;
}
</style>
