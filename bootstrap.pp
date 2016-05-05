# Make the dotfiles symlinks so I don't have to copy files.

$dotfiles_path = '~/src/dotfiles'

$dotfiles = [
  '.aliases',
  '.bash_profile',
  '.bashrc',
  '.bash_prompt',
  '.exports',
  '.extra',
  '.functions',
  '.git_completion.bash',
  '.gitconfig',
  '.gitignore',
  '.hushlogin',
  '.inputrc',
  '.osx',
  '.screenrc',
  '.tmux.conf',
  '.vimrc',
]

$vim_dir = [ '.vim' ]

$dotfiles.each |String $dotfiles| {
  file { "~/${dotfiles}":
    ensure => link,
    target => "${dotfiles_path}/${dotfiles}",
  }
}
->
file { "~/${vim_dir}":
  ensure => link,
  target => "${dotfiles_path}/${vim_dir}",
}
~>
exec { 'source ~/.bash_profile': }
