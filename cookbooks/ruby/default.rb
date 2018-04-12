node.reverse_merge!(
  rbenv: {
    user: 'akito',
    global: '2.5.1',
    versions: %w[
      2.5.1
      2.4.2
    ],
  }
)

include_recipe "rbenv::user"
