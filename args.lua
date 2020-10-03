do
    local params = arg
    arg = nil
    local args = {}
    local options = {}
    local doneWithOptions = false
    for i = 1, #params do
        local param = params[i]
        if not doneWithOptions then
            if param == "--" then
                doneWithOptions = true
            elseif param:sub(1, 2) == "--" then
                local valuePos = param:find("=", 3, true)
                if valuePos then
                    options[param:sub(3, valuePos - 1)] = param:sub(valuePos + 1)
                else
                    options[param:sub(3)] = true
                end
            elseif param:sub(1, 1) == "-" and param ~= "-" then
                for j = 2, #param do
                    options[param:sub(j, j)] = true
                end
            else
                args[#args+1] = param
            end
        else
            args[#args+1] = param
        end
    end
    
    _G.args, _G.options = args, options
end