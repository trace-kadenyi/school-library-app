require_relative 'app'
class Main
  def main
    launch = App.new
    launch.menu_options
  end

  def end_app
    puts 'Thank you for using this app!'
  end
end

main = Main.new
main.main
main.end_app
