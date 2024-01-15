import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="theme-toggle"
export default class extends Controller {
  connect() {
    this.initTheme();
  }

  initTheme() {
    const cookie = this.cookie
    console.log(cookie)
  }


  toggle() {
    console.log("toggle")
    if (this.theme === "light") {
      this.theme = "dark"
    } else {
      this.theme = "light"
    }

    console.log(this.theme)

    this.cookie = this.theme
  }

  get cookie() {
    const c =  document.cookie.split(";").find((cookie) => cookie.includes("theme="))
    if (c) {
      return c.split("=")[1]
    } else {
      // create cookie
      return document.cookie = "theme=light"
    }
  }

  set cookie(value) {
    document.cookie = `theme=${value}`
  }

  get theme() {
    const root = document.documentElement

    return root.classList.contains("dark") ? "dark" : "light"
  }

  set theme(value) {
    if (!value) return

    document.documentElement.classList.remove("dark", "light")
    document.documentElement.classList.add(value)
  }
}
