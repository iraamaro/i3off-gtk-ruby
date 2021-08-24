require 'gtk3'

app = Gtk::Application.new 'io.iraamaro.gtk-i3off', :flags_none

app.signal_connect :activate do |application|
  window = Gtk::ApplicationWindow.new(application)
  window.set_title 'i3off Dialog'
  window.present
end

puts app.run

