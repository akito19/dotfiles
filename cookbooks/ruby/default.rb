node.reverse_merge!(
  rbenv: {
    user: 'akito',
    global: '2.3.3',
    versions: %w[
      2.3.3
      2.3.1
      2.3.0
    ],
  }
)

include_recipe "rbenv::user"
