$(document).on "page:change", ->
  $('#sidebar-link').click ->
    $('.sidebar-container').fadeToggle()
