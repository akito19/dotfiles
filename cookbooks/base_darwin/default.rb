def ask(params)
  puts "Do you #{params}? [y/n]"
  loop do
    answer = gets.chomp.to_s
    case answer
    when 'y'
      return true
    when 'n'
      return false
    else
      puts "Try again because you input incorrect letter. Do you #{params}? [y/n]"
      redo
    end
  end
end

if ask("get Xcode lisence")
  execute "xcode lisence" do
    command "xcode-select --install"
  end
end

if ask("install Homebrew")
  execute "install Homebrew" do
    command 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
  end
end
