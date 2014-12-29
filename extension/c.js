var helpers, prettify, removeAds;

removeAds = function() {
  $(".splashText").remove();
  $("#headerContainer + center").remove();
  $("#container > table center + link + table").remove();
  $("div.medtext").remove();
  $("#footer").remove();
  $("body > center").remove();
  $(".tabbertab").remove();
  return false;
};

prettify = function() {
  $("#container > table center + link + p + p + p + div + div").attr("id", "main-listing-container");
  $("#main-listing-container > center > table").attr("id", "main-listing");
  $("#main-listing-container").attr("style", "");
  $("#main-listing td").removeAttr("bgcolor");
  $("#main-listing tr").removeAttr("style");
  $("#main-listing tbody tr td[colspan]").each(function() {
    return $(this).parent().remove();
  });
  return false;
};

helpers = function() {
  $("#main-listing tr > td + td img").each(function() {
    var href, img, maxHeight, newPath, path, src;
    href = $(this).parent().attr("href");
    $(this).parent().removeAttr("href");
    src = $(this).attr("src");
    path = src.split("/");
    img = path.pop();
    newPath = "image/" + img;
    maxHeight = $("window").height() * .8;
    $(this).parent().click(function() {
      var html;
      html = "<div class='extension-lightbox-container'><div class='extension-lightbox center center-block'><img src='" + newPath + "' class='center center-block center-text' alt=''/><br/><p><a href='" + href + "'>Go to listing &#187;</a><br/><p>Tap the image to close the preview.</p></div></div>";
      $(this).after(html);
      return $(".extension-lightbox img").click(function() {
        return $(".extension-lightbox-container").remove();
      });
    });
    return $(this).attr("title", "Click to see listing picture");
  });
  return false;
};

$(function() {
  removeAds();
  prettify();
  return helpers();
});

//# sourceMappingURL=../coffee/maps/c.js.map
