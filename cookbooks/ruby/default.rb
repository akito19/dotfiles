node.reverse_merge!(
  rbenv: {
    user: 'akito',
    global: '2.4.0',
    versions: %w[
      2.4.0
    ],
  }
)

include_recipe "rbenv::user"
