-- MS Teams on Linux doesn't show the window decorations, let's fix that
-- drop this in your devilspie2 folder, typically ~/.config/devilspie2 and start devilspie2

if string.match(get_window_name(), "Microsoft Teams") then
  decorate_window();
  pin_window();
  make_always_on_top();
end
