    require_relative 'webhoseio'

    webhoseio = Webhoseio.new('dd00ac5e-6554-42bc-a01f-183a16b98f47')
    query_params = {
	'q': "category:cartoons category:movies"
    }
    output = webhoseio.query('productFilter', query_params)
    puts output['products'][0]['name']
    puts output['products'][0]['price']

    
# Get the next batch of products

    output = webhoseio.get_next()
    puts output['products'][0]['description']
    
