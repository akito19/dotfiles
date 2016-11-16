define :ln do
  dotfile = File.join(ENV['HOME'], params[:name])
  link dotfile do
    to File.expand_path("../../../config/#{params[:name]}", __FILE__)
  end
end
