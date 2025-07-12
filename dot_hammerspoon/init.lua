-- Open Safari or Chrome
hs.hotkey.bind({"cmd"}, "2", function()
  hs.application.launchOrFocus("Firefox")  -- or "Safari"
end)

-- Open Ghostty (or iTerm, etc.)
hs.hotkey.bind({"cmd"}, "1", function()
  hs.application.launchOrFocus("Ghostty")  -- or "iTerm"
end)
