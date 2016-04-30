$(document).on "page:change", ->
  $('#sidebar-link').click ->
    $('.sidebar-container').fadeToggle()
  $('.close-sidebar').click ->
    $('.sidebar-container').fadeToggle()
