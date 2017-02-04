MItamae::RecipeContext.class_eval do
  def include_cookbook(name)
    root_dir = File.expand_path('..', __FILE__)
    include_recipe File.join(root_dir, 'cookbooks', name, 'default')
  end

  def include_role(name)
    root_dir = File.expand_path('..', __FILE__)
    include_recipe File.join(root_dir, 'roles', name, 'default')
  end

  def ask(params)
    puts "Do you #{params}? [y/N]"
    loop do
      answer = gets.chomp.to_s
      case answer
      when 'y', 'yes'
        return true
      when 'N', 'no'
        return false
      else
        puts "Try again because you input incorrect letter. Do you #{params}? [y/N]"
        redo
      end
    end
  end
end

include_role node[:platform]
