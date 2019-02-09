#!/bin/zsh

function symbolic_link_files()
{
  linked_to_home="\t linked to ~"
  red_="\e[91m"
  green_="\e[92m"
  yellow_="\e[93m"
  _end="\e[0m"

  echo -e "\e[1mSymlinking the following files:\e[0m"

  for file in $(ls -a)
  do
    case "$file" in
      ".") echo -e "$yellow_ $file:\t\t ignored  $_end";;
      "..") echo -e "$yellow_ $file:\t\t ignored $_end";;
      *.git) echo -e "$yellow_ $file:\t\t ignored $_end";;
      *.sh) echo -e "$yellow_ $file:\t\t ignored  $_end";;
      *.md) echo -e "$yellow_ $file:\t ignored $_end";;
      ".gitconfig") ln -sf ~/dot-files/.gitconfig ~ && echo -e "$green_ $file: $linked_to_home $_end";;
      ".tmux.conf") ln -sf ~/dot-files/.tmux.conf ~ && echo -e "$green_ $file: $linked_to_home $_end";;
      ".prettierrc.js") ln -sf ~/dot-files/.prettierrc.js  ~ && echo -e "$green_ $file: $linked_to_home $_end";;
      ".bash_profile") ln -sf ~/dot-files/.bash_profile ~ && echo -e "$green_ $file: $linked_to_home $_end";;
      ".editorconfig") ln -sf ~/dot-files/.editorconfig ~ && echo -e "$green_ $file: $linked_to_home $_end";;
      ".vimrc") ln -sf ~/dot-files/.vimrc ~/.vim && echo -e "$green_ $file: ~/.vim $_end";;
      "init.vim") ln -sf ~/dot-files/init.vim ~/.config/nvim && echo -e "$green_ $file: linked to ~/.config/nvim $_end";;
      *) echo -e "$red_$file: \t \e[5m Not sure what to do \e[0m"
    esac
  done
  return 0
}

symbolic_link_files
