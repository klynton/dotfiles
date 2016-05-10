# Make the dotfiles symlinks so I don't have to copy files.

$dotfiles_path = '/Users/klynton/src/dotfiles'
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

$vim_dir = '.vim'

$dotfiles.each |String $dotfile| {
  file { "/Users/klynton/${dotfile}":
    ensure => link,
    target => "${dotfiles_path}/${dotfile}",
  }
}

file { "/Users/klynton/${vim_dir}":
  ensure => link,
  target => "${dotfiles_path}/${vim_dir}",
}
