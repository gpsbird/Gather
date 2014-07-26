CSRF_TOKEN = ''
 
configureCSRF = ()->
    $.ajax {
        type: 'GET', url: '/csrf_token',
        async: false,
        cache: false,
        success: (data, textStatus, jqXHR)->
            CSRF_TOKEN = data.csrf
        fail: (data, textStatus, jqXHR)-> 
        	console.log("fail")
        }

self.user = {
	login: ->
		$("#login-form").submit (e)->
			e.preventDefault()
			b64 = new Base64()
			data_array = {
				method: "in",
				username: $("#login-username")[0].value,
				password: $("#login-password")[0].value
			}
			data = b64.encode(JSON.stringify data_array)
			configureCSRF()
			console.log data
			$.post "/sign", {j: data, authenticity_token: CSRF_TOKEN}, (result)->
				console.log(result)
	signup: ->
		$("#signup-form").submit (e)->
			e.preventDefault()
			b64 = new Base64()
			data_array = {
				method: "up",
				username: $("#signup-username")[0].value,
				password: $("#signup-password")[0].value,
				email: $("#signup-email")[0].value
			}
			data = b64.encode(JSON.stringify data_array)
			configureCSRF()
			console.log data
			$.post "/sign", {j: data, authenticity_token: CSRF_TOKEN}, (result)->
				console.log(result)
}