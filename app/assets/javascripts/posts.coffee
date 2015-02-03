# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
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

  $('.searchbox').on 'keyup', (e) ->
    if e.keyCode is 13
      query = $(@).val()
      window.location.href = "/search/#{query}"
      # $.ajax
      #   method: "GET"
      #   url: "/search/#{query}"
      #   success: (data)->
      #     debugger
      #     $(".posts").html(data)
