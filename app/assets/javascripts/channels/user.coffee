App.user = App.cable.subscriptions.create 'UserChannel',
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log(data.id)
    $("#invite_menu").append('<li class="invite_element p-10 cursor-pointer"
                  value="'+data.id+'">
                  Invite to ' +data.room+'</li>')
    count = $('.invite-count')[0]
    count.textContent = parseInt(count.textContent)+1
