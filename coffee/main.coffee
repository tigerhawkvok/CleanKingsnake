removeAds = ->
  # Splash text
  $(".splashText").remove()
  # Irritating scroll nonsense
  $("#headerContainer + center").remove()
  # Banner ad above listings
  $("#container > table center + link + table").remove()
  # No, I don't want to follow anything
  $("div.medtext").remove()
  # The footer is nothing but crap
  $("#footer").remove()
  # No, I don't need to know about your mobile stuff
  $("body > center").remove()
  false


prettify = ->
  false

$ ->
  removeAds()
  prettify()
