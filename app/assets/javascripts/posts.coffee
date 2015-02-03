# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.more_comments').on 'click', ->
    post_id = @id
    $el = $(@)
    $.ajax
      method: "GET"
      url: "/posts/#{@id}/comments"
      # url: "/posts/#{@id}/comments.json"
      # dataType: 'json'
      success: (data)->
        $("##{post_id}").parent('.comments').html(data)
