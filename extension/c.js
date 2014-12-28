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
  $("#main-listing td img").each(function() {
    var href, img, newPath, path, src;
    href = $(this).parent().attr("href");
    $(this).parent().removeAttr("href");
    src = $(this).attr("src");
    path = src.split("/");
    img = path.pop();
    newPath = "images/" + img;
    $(this).parent().click(function() {
      var html;
      html = "<div class='extension-lightbox'><img src='" + newPath + "' alt=''/><br/><p><a href='" + href + "'>Go to listing &#187;</a></div>";
      $(this).after(html);
      return $(".extension-lightbox img").click(function() {
        return $(".extension-lightbox").remove();
      });
    });
    return $(this).attr("title", "Click to see listing picture");
  });
  return false;
};

$(function() {
  removeAds();
  return prettify();
});

//# sourceMappingURL=../coffee/maps/c.js.map
