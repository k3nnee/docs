<template>
  <div class="canvas-container">
    <canvas class="canvas" id="canvas"></canvas>
  </div>
</template>

<script>
import { onMounted, ref } from 'vue'
import { keys } from '@/lib/library.js'
import { textBody, pointer } from '@/lib/state.js'

export default {
  name: 'Canvas',
  setup() {
    const renderDocument = (ctx) => {
      textBody.value.forEach((text, index) => {
        ctx.fillText(text, 10, (index + 1) * 20)
      })
    }

    const handleKeyPress = (ctx, event, width, height) => {
      const pointerValue = pointer.value

      const key = event.key

      switch (key) {
        case keys.BACKSPACE:
          if (textBody.value[pointerValue].length === 0 && textBody.value.length > 1) {
            textBody.value.splice(pointer.value, 1)
            pointer.value -= 1
          } else {
            textBody.value[pointerValue] = textBody.value[pointerValue].slice(
              0,
              textBody.value[pointerValue].length - 1,
            )
          }
          break
        case keys.ENTER:
          pointer.value += 1
          textBody.value[pointer.value] = ''
          break
        case keys.ARROWUP:
          event.preventDefault()
          if (pointerValue >= 1) {
            pointer.value -= 1
          }
          break
        case keys.SPACE:
          event.preventDefault()
          textBody.value[pointerValue] += key
          break
        case keys.ARROWDOWN:
          event.preventDefault()
          if (pointerValue < textBody.value.length) {
            pointer.value += 1
          }
          break
        default:
          if (key.length !== 1) {
            return
          }

          if (ctx.measureText(textBody.value[pointerValue]).width + 10 >= width - 25) {
            pointer.value += 1
          }

          if (!textBody.value[pointerValue]) {
            textBody.value[pointerValue] = key
          } else {
            textBody.value[pointerValue] += key
          }
      }

      ctx.clearRect(0, 0, width, height)
      renderDocument(ctx)
    }

    onMounted(() => {
      const canvas = document.getElementById('canvas')
      const ctx = canvas.getContext('2d')

      const scale = window.devicePixelRatio || 1

      canvas.width = 800 * scale
      canvas.height = 1000 * scale

      ctx.font = '15px Arial'
      renderDocument(ctx)

      document.addEventListener('keydown', (event) => {
        handleKeyPress(ctx, event, canvas.width, canvas.height)
      })
    })
  },
}
</script>

<style scoped>
.canvas {
  max-height: 1000px;
  max-width: 800px;
  min-height: 500px;
  min-width: 400px;

  border: 1px solid #e4e7e9;
  background-color: white;
}

.canvas-container {
  display: flex;
  justify-content: center;
}
</style>
