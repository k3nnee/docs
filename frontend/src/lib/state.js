import { reactive, ref } from 'vue'
import { DocumentInformation } from '@/lib/library.js'

export const textBody = ref([''])
export const pointer = ref(0)
export const documentList = {}
export const currentDocument = reactive(
  new DocumentInformation('Placeholder title', 'Kenny Tang', new Date().toString()),
)
