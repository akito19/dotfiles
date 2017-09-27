node.reverse_merge!(
  rbenv: {
    user: 'akito',
    global: '2.4.1',
    versions: %w[
      2.4.2
      2.3.3
    ],
  }
)

include_recipe "rbenv::user"
