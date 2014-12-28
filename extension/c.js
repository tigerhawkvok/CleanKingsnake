var prettify, removeAds;

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
  return false;
};

$(function() {
  removeAds();
  return prettify();
});

//# sourceMappingURL=../coffee/maps/c.js.map
