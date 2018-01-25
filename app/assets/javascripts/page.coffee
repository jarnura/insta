class Images
	this.ic = (data) ->
		$('#messages').empty()
		data = sortJ(data)
		for image in data
			if image.id <= 9
				image.id = "00"+image.id
			else if image.id <= 99
				image.id = "0"+image.id

			row = "http://localhost:3000/system/images/pics/000/000/" + image.id + "/medium/" + image.pic_file_name
			li = "http://localhost:3000/users/" + image.user_id

			pic = "<a href=#{li} ><img src=#{row} class='img-fluid' style='padding: 2% 2% 2% 2%;'></a>"
			$('#messages').append(pic)

sortJ = (data) ->
	data.sort (a,b ) ->
		x=a.id
		y=b.id
		if x > y then -1 else if x < y then 1 else 0
$ ->
	$.ajax 'images' , 
  		type: "GET",
  		dataType: "JSON",
  		asnyc: false,
  		success: (data) ->
    		Images.ic(data)
App.room = App.cable.subscriptions.create "WebNotificationsChannel",
  received: (data) ->
  	 $.ajax 'images' , 
  		type: "GET",
  		dataType: "JSON",
  		asnyc: false,
  		success: (data) ->
    		Images.ic(data)

