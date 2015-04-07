#!/usr/bin/env ruby

git_bundles = [ 
  "git://github.com/astashov/vim-ruby-debugger.git",
  "git://github.com/garbas/vim-snipmate.git",
  "git://github.com/timcharper/textile.vim.git",
  "git://github.com/tpope/vim-fugitive.git",
  "git://github.com/tpope/vim-git.git",
  "git://github.com/tpope/vim-haml.git",
  "git://github.com/tpope/vim-markdown.git",
  "git://github.com/tpope/vim-rails.git",
  "git://github.com/tpope/vim-repeat.git",
  "git://github.com/tpope/vim-surround.git",
  "git://github.com/tpope/vim-vividchalk.git",
  "git://github.com/tsaleh/vim-align.git",
  "git://github.com/tsaleh/vim-shoulda.git",
  "git://github.com/ervandew/supertab.git",
  "git://github.com/tsaleh/vim-tcomment.git",
  "git://github.com/vim-ruby/vim-ruby.git",
  "git://github.com/hdima/python-syntax.git",
  "git://github.com/scrooloose/nerdtree.git",
  "git://github.com/yodiaditya/vim-pydjango.git",
  "git://github.com/mrchrisadams/vim-peepopen.git",
  "git://github.com/MarcWeber/vim-addon-mw-utils.git",
  "git://github.com/airblade/vim-rooter.git",
  "git://github.com/scrooloose/syntastic.git",
  "git://github.com/tomtom/tlib_vim.git",
]

vim_org_scripts = [
  ["IndexedSearch", "7062",  "plugin"],
  ["jquery",        "12107", "syntax"],
]

require 'fileutils'
require 'open-uri'

bundles_dir = File.join(File.dirname(__FILE__), "bundle")

FileUtils.cd(bundles_dir)

puts "Trashing everything (lookout!)"
Dir["*"].each {|d| FileUtils.rm_rf d }

git_bundles.each do |url|
  dir = url.split('/').last.sub(/\.git$/, '')
  puts "  Unpacking #{url} into #{dir}"
  `git clone #{url} #{dir}`
  FileUtils.rm_rf(File.join(dir, ".git"))
end

vim_org_scripts.each do |name, script_id, script_type|
  puts "  Downloading #{name}"
  local_file = File.join(name, script_type, "#{name}.vim")
  FileUtils.mkdir_p(File.dirname(local_file))
  File.open(local_file, "w") do |file|
    file << open("http://www.vim.org/scripts/download_script.php?src_id=#{script_id}").read
  end
end