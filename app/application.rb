class Application
   
   @@items = []
   
   def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

     if req.path.match(/items/)
       @@items.each do |item|
         resp.write "{item.price}/n"
       end 
    else 
          resp.status = 400
          resp.write "Item not found"
        end
   elsif 
      resp.status = 404
      resp.write "Route not found"
    end 
    resp.finish
end
end 