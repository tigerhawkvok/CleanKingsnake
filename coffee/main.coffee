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
  # We know which page we're on. Really. We can read.
  $(".tabbertab").remove()
  false


prettify = ->
  $("#container > table center + link + p + p + p + div + div").attr("id","main-listing-container")
  $("#main-listing-container > center > table").attr("id","main-listing")
  $("#main-listing-container").attr("style","")
  $("#main-listing td").removeAttr("bgcolor")
  $("#main-listing tr").removeAttr("style")
  $("#main-listing tbody tr td[colspan]").each ->
    $(this).parent().remove()
  false

helpers = ->
  $("#main-listing td img").each ->
    # Link it to the real image
    href = $(this).parent().attr("href")
    $(this).parent().removeAttr("href")
    src = $(this).attr("src")
    path = src.split("/")
    img = path.pop()
    newPath = "images/#{img}"
    # Lightbox this image with a new link to the listing
    $(this).parent().click ->
      # Do lightbox
      html = "<div class='extension-lightbox'><img src='#{newPath}' alt=''/><br/><p><a href='#{href}'>Go to listing &#187;</a></div>"
      $(this).after(html)
      $(".extension-lightbox img").click ->
        $(".extension-lightbox").remove()
    $(this).attr("title","Click to see listing picture")
  false

$ ->
  removeAds()
  prettify()
