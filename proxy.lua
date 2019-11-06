function handle_request(env)

local open = io.open

local function read_file(path)
    local file = open(path, "rb") -- r read mode and b binary mode
    if not file then return nil end
    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()
    return content
end

   local fileContent = read_file("/root/proxy.txt");
   uhttpd.send("Status: 200 OK\r\n")
   uhttpd.send("Content-Type: application/x-ns-proxy-autoconfig\r\n\r\n")
   uhttpd.send(fileContent)
end

