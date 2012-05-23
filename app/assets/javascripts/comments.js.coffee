$ ->
  pusher = new Pusher('da7fe637896df8660e7f');
  channel = pusher.subscribe('livecomments');

  channel.bind('new_message', (data) ->
    $('.table-striped').prepend("<tr><td>"+data.message+"</td><td>"+data.time+"</td><td><a href='/comments/"+data.id+"' class='btn btn-mini btn-danger' data-confirm='Are you sure?' data-method='delete' rel='nofollow'><span class='translation_missing' title='translation missing: en.helpers.links.destroy'>Destroy</span></a></td></tr>")
    #add new column
    $('#com_quantity').html(data.total_quantity)
    #update total quantity
    if data.total_quantity > 10
      $('.table-striped').find('tr:last').remove()
    #show only last 10 records
  )
