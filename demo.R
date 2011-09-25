require('Rook')
TestApp <- Rook::Builder$new(
  Rook::App$new(function(env) {
    req <- Rook::Request$new(env)
    res <- Rook::Response$new()
    res$write("Ok, I heard you loud and clear") 
    res$finish()    
  })
)

rook <- Rhttpd$new()
rook$add(name="TestApp", app=TestApp)
rook$start(listen="0.0.0.0", port=as.numeric(Sys.getenv("PORT")))

while(T) {
  Sys.sleep(10000)
}

