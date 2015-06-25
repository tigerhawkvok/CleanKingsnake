var bannerPoolAds, helpers, prettify, removeAds, removeParentTable;

String.prototype.toTitleCase = function() {
  var lower, lowerRegEx, lowers, str, upper, upperRegEx, uppers, _i, _j, _len, _len1;
  str = this.replace(/([^\W_]+[^\s-]*) */g, function(txt) {
    return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
  });
  lowers = ["A", "An", "The", "And", "But", "Or", "For", "Nor", "As", "At", "By", "For", "From", "In", "Into", "Near", "Of", "On", "Onto", "To", "With"];
  for (_i = 0, _len = lowers.length; _i < _len; _i++) {
    lower = lowers[_i];
    lowerRegEx = new RegExp("\\s" + lower + "\\s", "g");
    str = str.replace(lowerRegEx, function(txt) {
      return txt.toLowerCase();
    });
  }
  uppers = ["Id", "Tv"];
  for (_j = 0, _len1 = uppers.length; _j < _len1; _j++) {
    upper = uppers[_j];
    upperRegEx = new RegExp("\\b" + upper + "\\b", "g");
    str = str.replace(upperRegEx, upper.toUpperCase());
  }
  return str;
};

bannerPoolAds = ["http://www.kingsnake.com/services/bannerpoolballpython.html"];

removeAds = function() {
  var url, _i, _len;
  $(".splashText").remove();
  $("#headerContainer + center").remove();
  $("#container > table center + link + table").remove();
  $("div.medtext").remove();
  $("#footer").remove();
  $("body > center").remove();
  $(".tabbertab").remove();
  for (_i = 0, _len = bannerPoolAds.length; _i < _len; _i++) {
    url = bannerPoolAds[_i];
    $("a[href='" + url + "']").each(function() {
      return removeParentTable(this);
    });
  }
  $("a[href^='http://banner.kingsnake.com']").each(function() {
    return removeParentTable(this);
  });
  return false;
};

prettify = function() {
  $("#container > table center + link + p + p + p + div + div").attr("id", "main-listing-container");
  $("#main-listing-container > center > table").attr("id", "main-listing");
  $("#main-listing-container").attr("style", "");
  $("#main-listing").attr("style", "margin-left:-15px;").addClass("table table-responsive");
  $("#main-listing tr > td + td + td  a").each(function() {
    var entry;
    entry = $(this).text();
    return $(this).text(entry.toTitleCase());
  });
  $("#main-listing td").removeAttr("bgcolor");
  $("#main-listing tr").removeAttr("style");
  $("#main-listing tbody tr td[colspan]").each(function() {
    return $(this).parent().remove();
  });
  $("#container").addClass("center-block container").attr("style", "overflow: hidden");
  $("#main-listing-container + p a").each(function() {
    return $(this).addClass("btn");
  });
  return false;
};

removeParentTable = function(domElement) {
  return $(domElement).parents().each(function() {
    if ($(this).is("table")) {
      $(this).remove();
      return false;
    }
  });
};

helpers = function() {
  $("#main-listing tr > td + td img").each(function() {
    var href, img, maxHeight, newPath, path, src;
    href = $(this).parent().attr("href");
    $(this).parent().removeAttr("href");
    src = $(this).attr("src");
    path = src.split("/");
    if ($.inArray("thumb", path) !== -1) {
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
    }
  });
  return false;
};

$(function() {
  var bootstrapCss;
  bootstrapCss = "<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css\" />";
  $("head").append(bootstrapCss);
  $("body").attr("style", "background-color: #333 !important");
  if (window.location.search.indexOf("cat") !== -1) {
    removeAds();
    prettify();
    return helpers();
  } else {
    $("a[href^='http://banner.kingsnake.com']").each(function() {
      return removeParentTable(this);
    });
    return $(".splashText").remove();
  }
});

//# sourceMappingURL=../coffee/maps/c.js.map
