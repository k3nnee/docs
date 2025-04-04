export class DocumentInformation {
  constructor(title, author, createdAt, textBody = [""]) {
    this.title = title
    this.author = author
    this.createdAt = createdAt
    this.textBody = textBody
  }
}

export const keys = {
  TAB: "Tab",
  ENTER: "Enter",
  BACKSPACE: "Backspace",
  ARROWUP: "ArrowUp",
  ARROWDOWN: "ArrowDown",
  SPACE: " ",
}


