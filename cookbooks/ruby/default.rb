node.reverse_merge!(
  rbenv: {
    user: 'akito',
    global: '2.6.4',
    versions: %w[
      2.6.4
      2.5.1
    ],
  }
)

include_recipe "rbenv::user"
