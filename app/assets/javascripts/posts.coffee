# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $('.more_comments').on 'click', ->
    post_id = @id
    $el = $(@)
    total_comments = parseInt $el.data('total-comments')
    if total_comments < 20 or $('.post').length is 1
      $.ajax
        method: "GET"
        url: "/posts/#{@id}/comments"
        # url: "/posts/#{@id}/comments.json"
        # dataType: 'json'
        success: (data)->
          $("##{post_id}").parent('.comments').html(data)
      return false

  $(document).on 'keyup', (e) ->
    if e.keyCode is 191
      $('.searchbox').select()

  $('.searchbox').on 'keyup', (e) ->
    if e.keyCode is 13
      query = $(@).val().trim()
      if query is ''
        return false
      else
        window.location.href = "/search/#{query}"

$(document).ready(ready)
$(document).on('page:load', ready)
