-- Print all wifi's on range
function callback(t)
    for k,v in pairs(t) do
        print(k.." : "..v)
    end
end

wifi.sta.getap(callback)
