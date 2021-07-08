node.reverse_merge!(
  rbenv: {
    user: 'akito',
    global: '3.0.2',
    versions: %w[
      3.0.2
      2.7.4
    ],
  }
)

include_recipe "rbenv::user"

execute "bundler settings" do
  command "bundle config set path 'vendor/bundle'"
end
