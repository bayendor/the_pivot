function lendNow(event) {
  var value = $(event.target)
  $.ajax({
    url: "/cart",
    type: "post"
  })
}
