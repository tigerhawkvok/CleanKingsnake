String::toTitleCase = ->
  # From http://stackoverflow.com/a/6475125/1877527
  str =
    @replace /([^\W_]+[^\s-]*) */g, (txt) ->
      txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase()

  # Certain minor words should be left lowercase unless
  # they are the first or last words in the string
  lowers = [
    "A"
    "An"
    "The"
    "And"
    "But"
    "Or"
    "For"
    "Nor"
    "As"
    "At"
    "By"
    "For"
    "From"
    "In"
    "Into"
    "Near"
    "Of"
    "On"
    "Onto"
    "To"
    "With"
    ]
  for lower in lowers
    lowerRegEx = new RegExp("\\s#{lower}\\s","g")
    str = str.replace lowerRegEx, (txt) -> txt.toLowerCase()

  # Certain words such as initialisms or acronyms should be left
  # uppercase
  uppers = [
    "Id"
    "Tv"
    ]
  for upper in uppers
    upperRegEx = new RegExp("\\b#{upper}\\b","g")
    str = str.replace upperRegEx, upper.toUpperCase()
  str


bannerPoolAds = [
  "http://www.kingsnake.com/services/bannerpoolballpython.html"
  ]

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
  # Remove banner pool ads
  for url in bannerPoolAds
    $("a[href='#{url}']").each ->
      removeParentTable(this)
  $("a[href^='http://banner.kingsnake.com']").each ->
    removeParentTable(this)
  #$.each bannerPoolAds, (url) ->
  #  $("a[href='#{bannerPoolAds[url]}']").each ->
  #    removeParentTable(this)
  false


prettify = ->
  $("#container > table center + link + p + p + p + div + div").attr("id","main-listing-container")
  $("#main-listing-container > center > table").attr("id","main-listing")
  $("#main-listing-container").attr("style","")
  $("#main-listing")
  .attr("style","margin-left:-15px;")
  .addClass("table table-responsive")
  # document.querySelectorAll("#main-listing tr > td + td + td a")
  $("#main-listing tr > td + td + td  a").each ->
    # Fix retarded casing
    entry = $(this).text()
    $(this).text(entry.toTitleCase())
  $("#main-listing td").removeAttr("bgcolor")
  $("#main-listing tr").removeAttr("style")
  $("#main-listing tbody tr td[colspan]").each ->
    $(this).parent().remove()
  $("#container")
  .addClass("center-block container")
  .attr("style","overflow: hidden")
  $("#main-listing-container + p a").each ->
    $(this).addClass("btn")
  false

removeParentTable = (domElement) ->
  $(domElement).parents().each ->
    if $(this).is("table")
      $(this).remove()
      return false



helpers = ->
  $("#main-listing tr > td + td img").each ->
    # Link it to the real image
    href = $(this).parent().attr("href")
    $(this).parent().removeAttr("href")
    src = $(this).attr("src")
    path = src.split("/")
    if $.inArray("thumb",path) isnt -1
      img = path.pop()
      newPath = "image/#{img}"
      maxHeight = $("window").height() * .8;
      # Lightbox this image with a new link to the listing
      $(this).parent().click ->
        # Do lightbox
        html = "<div class='extension-lightbox-container'><div class='extension-lightbox center center-block'><img src='#{newPath}' class='center center-block center-text' alt=''/><br/><p><a href='#{href}'>Go to listing &#187;</a><br/><p>Tap the image to close the preview.</p></div></div>"
        $(this).after(html)

        $(".extension-lightbox img").click ->
          $(".extension-lightbox-container").remove()
      $(this).attr("title","Click to see listing picture")
  false



$ ->
  bootstrapCss = """
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
  """
  $("head").append(bootstrapCss)
  $("body")
  .attr("style","background-color: #333 !important")
  if window.location.search.indexOf("cat") isnt -1
    removeAds()
    prettify()
    helpers()
  else
    $("a[href^='http://banner.kingsnake.com']").each ->
      removeParentTable(this)
    $(".splashText").remove()
