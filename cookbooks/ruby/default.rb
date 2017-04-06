node.reverse_merge!(
  rbenv: {
    user: 'akito',
    global: '2.4.0',
    versions: %w[
      2.4.1
      2.3.3
      2.3.1
    ],
  }
)

include_recipe "rbenv::user"
