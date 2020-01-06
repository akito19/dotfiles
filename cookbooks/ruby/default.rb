node.reverse_merge!(
  rbenv: {
    user: 'akito',
    global: '2.7.0',
    versions: %w[
      2.7.0
      2.6.4
    ],
  }
)

include_recipe "rbenv::user"
