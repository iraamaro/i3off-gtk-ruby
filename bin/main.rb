
require 'libui'
UI = LibUI

UI.init

should_quit = proc do
  puts 'Bye Bye'
  UI.control_destroy(MAIN_WINDOW)
  UI.quit
  0
end

# File menu
menu = UI.new_menu('File')

UI.menu_append_quit_item(menu)
UI.on_should_quit(should_quit)

# Help menu
help_menu = UI.new_menu('Help')
UI.menu_append_item(help_menu, 'Help')
UI.menu_append_about_item(help_menu)

# Main Window
MAIN_WINDOW = UI.new_window('i3off GUI', 300, 50, 1)
UI.window_set_margined(MAIN_WINDOW, 1)
UI.window_on_closing(MAIN_WINDOW, should_quit)

vbox = UI.new_vertical_box
UI.window_set_child(MAIN_WINDOW, vbox)
hbox = UI.new_horizontal_box
UI.box_set_padded(vbox, 1)
UI.box_set_padded(hbox, 1)

UI.box_append(vbox, hbox, 1)

# Group - Basic Controls
group = UI.new_group('What do you wish?')
UI.group_set_margined(group, 1)
UI.box_append(hbox, group, 1) # OSX bug?

inner = UI.new_vertical_box
UI.box_set_padded(inner, 1)
UI.group_set_child(group, inner)

# Button1
button1 = UI.new_button('Suspend')
UI.button_on_clicked(button1) do
  UI.msg_box(MAIN_WINDOW, 'We will sleep ༼ง ◉_◉༽ง', 'i3lock will be executed.')
  system "sudo pm-suspend"
  system "i3lock --color=000000"
end

# Button2
button2 = UI.new_button('Shutdown')
UI.button_on_clicked(button2) do
  UI.msg_box(MAIN_WINDOW, 'Shutting down... ¯\_(ツ)_/¯', '(￣o￣) zzZZzzZZ')
  system "shutdown -t now"
end


UI.box_append(inner, button1, 0)
UI.box_append(inner, button2, 1)

UI.control_show(MAIN_WINDOW)

UI.main
UI.quit
