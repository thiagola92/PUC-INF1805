-- For more help about the topic: http://nodemcu.readthedocs.io/en/master/en/modules/mqtt/

-- Creating your client object
-- The first argument is your client ID,
-- is a string to identify this mqtt connection
-- The second argument is a delay between "keepalive" message,
-- a "keepalive" message is one simple message to tell
-- the server that you are alive, if you stop sending you probably
-- closed the connection
local client = mqtt.Client("thiagola92", 120)

function novaInscricao (c)
  local msgsrec = 0
  function novamsg (c, t, m)
    print ("mensagem ".. msgsrec .. ", topico: ".. t .. ", dados: " .. m)
    msgsrec = msgsrec + 1
  end
  c:on("message", novamsg)
end

-- This function will be called when the connection is made
-- How you can have more then 1 client, you need to know the client that connected
-- (you can create many clients with "mqtt.Client()")
-- Importante: How you can never know if your client connected or not,
-- you shouldn't write your code out of the callback connected
function connected_callback (client)
  print("connected_callback")
  client:publish("puc-rio-inf1805","hello word",0,0,
            function(client) print("mandou!") end)
  client:subscribe("puc-rio-inf18055", 0, novaInscricao)
end

-- This function will be called when you are unable to connect to the server
-- The first argument is the client that didn't connected
-- How you can have more then 1 client, you need to know the client with problems
-- in the connection
-- (you can create many clients with "mqtt.Client()")
-- The second argument is the reason, for this you may want to look each reason at:
-- http://nodemcu.readthedocs.io/en/master/en/modules/mqtt/#connection-failure-callback-reason-codes
function failed_callback(client, reason)
  print("failed_callback(" .. reason .. ")")
end

-- Connect to the server
-- server ip, server port, secure mode,
-- callback when the connection is made,
-- callback when the connection failed
client:connect("test.mosquitto.org", 1883, 0, connected_callback, failed_callback)
