-- Copy selected text with Ctrl+C
local modes = require "modes"
modes.add_binds("normal", {
    { "<Control-c>", "Copy selected text.", function ()
        luakit.selection.clipboard = luakit.selection.primary
    end},
})

-- Handle custom links
local webview = require "webview"
webview.add_signal("init", function (view)
    view:add_signal("navigation-request", function (v, uri)
        if string.match(string.lower(uri), "^mailto:") then
            luakit.spawn(string.format("%s %q", "termite -t mutt -e mutt", uri))
            return false
        end
    end)
end)

webview.add_signal("init", function (view)
    view:add_signal("new-window-decision", function (v, uri, reason)
        local w = window.ancestor(v)
        w:new_tab(uri)
        return true
    end)
end)
