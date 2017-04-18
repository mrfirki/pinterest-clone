$(document).on('turbolinks:load', function(){
	$('#new_user').on('submit', function(event){
		event.preventDefault()
		data = $('#new_user').serializeArray()
		$.ajax({
			url: "/users",
			method: "POST",
			data: data,
			success: function(response){
				pTag = document.createElement("p")
				pTag.innerText = $(response)[1]
				pTag.style.color = "red";
				submitButton = $('input[type="submit"]')[0]
				errorMessage = $(submitButton).parent()
				$(errorMessage).prepend(pTag) 
			}
		})
	})
})