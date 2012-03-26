$(document).ready ->
  $('.rating').bind 'click', (event) ->
    rating = $(this).attr('rel')
    id = $(this).attr('id')
    elem = $(this)
    
    $.get "/tours/update_rating/#{id}", { "rating": rating }, (data) -> 
      elem.parent().html("<b>Rating:</b> #{rating}") 
    return false