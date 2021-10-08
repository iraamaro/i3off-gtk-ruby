require 'glimmer-dsl-libui'

include Glimmer

menu('File') {
  quit_menu_item
}

menu('Help') {
  menu_item('Help')
  
  about_menu_item
}

window('i3off GUI', 300, 50) {
  margined true
  
  vertical_box {
    horizontal_box {
      group('What do you wish?') {
        vertical_box {
          button('Suspend') {
            stretchy false
            
            on_clicked do
              msg_box('We will sleep ༼ง ◉_◉༽ง', 'i3lock will be executed.')
              system "i3lock --color=000000 && sudo pm-suspend"
            end
          }
          
          button('Shutdown') {
            on_clicked do
              msg_box('Shutting down... ¯\_(ツ)_/¯', '(￣o￣) zzZZzzZZ')
              system "sudo shutdown -t now"
            end
          }
        }
      }
    }
  }
}.show
