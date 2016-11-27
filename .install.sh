#!/bin/bash
SYSTEM=`uname`
ROOT_DIR=`pwd`

copy_git(){
	cd ~
	home_dir=`pwd`
	if [ "$ROOT_DIR" == "$home_dir" ]; then
		return 0;
	fi
	echo ">>> copy work-every-where to $HOME"
	sudo cp -R ./ ~/

	if type brew >/dev/null 2>&1; then
		echo "brew has installed"
	else
		echo ">>> install homebrew"
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi

	if type wget >/dev/null 2>&1; then
		echo ">>> wget has installed"
	else
		echo ">>> install wget"
		brew install wget
	fi
}

install_zsh(){
	if type zsh >/dev/null 2>&1; then
		echo ">>> zsh has installed"
	else
		if [ "$SYSTEM" = "Darwin" ]; then
			echo "!!! install zsh first"
		else
			sudo apt-get install zsh
		fi
	fi

	if [ -d ~/.oh-my-zsh ];then
		echo ">>> oh-my-zsh has installed"
	else
		echo ">>> install oh-my-zsh"
		sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	fi
	sudo chmod 777 ~/.zsh*
	sudo chmod 777 ~/.zcomp*

	has_set_plugin=`cat ~/.zshrc | grep "custom plugins"
	if [ ! "$has_set_plugin" ]; then
		echo "" >> ~/.zshrc
		echo "# custom plugins" >> ~/.zshrc
		echo "plugins=($plugins osx autojump copydir adb)" >> ~/.zshrc
	fi

	has_set_theme=`cat ~/.zshrc | grep "custom theme"
	if [ ! "$has_set_theme" ]; then
		echo "" >> ~/.zshrc
		echo "# custom theme" >> ~/.zshrc
		echo "ZSH_THEME=\"gallois\"" >> ~/.zshrc
	fi
}

install_sh_user(){
	has_sh_user=`cat ~/.zshrc | grep sh_user`
	if [ ! "$has_sh_user" ]; then
		echo ">>> config sh_user"
		echo "" >> ~/.zshrc
		echo "# source .sh_user" >> ~/.zshrc
		echo "test -e ~/.sh_user && source ~/.sh_user" >> ~/.zshrc
	fi
}

install_shell_integration(){
	has_iterm2=`cat ~/.zshrc | grep iterm2`
	if [ ! "$has_iterm2" ]; then
		echo ">>> install shell integration"
		echo "" >> ~/.zshrc
		echo "# iterm2" >> ~/.zshrc
		curl -L https://iterm2.com/misc/install_shell_integration.sh | bash
	fi
}

config_git(){
	echo ">>> config git"
	git config --global user.name $username
	git config --global user.email $email
	echo ">>> Current git config:"
	git config --global user.name
	git config --global user.email
	echo ""
}

config_vim(){
	if type vim >/dev/null 2>&1; then
		echo ">>> vim has installed"
		if [ "$SYSTEM" = "Darwin" ]; then
			if ! type mvim >/dev/null 2>&1; then
				brew install macvim --with-override-system-vim
				# brew linkapps
			fi
		fi
	else
		echo "install vim ..."
		sudo apt-get install vim;
	fi

	echo ">>> config vim"
	if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
		git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	fi

    vim +PluginInstall +qall	

	cd ~/.vim/bundle/YouCompleteMe
	./install.py --clang-completer

	cd $ROOT_DIR
}

setup_zlv_me(){
	if -d ~/zlv.me; then
		echo ">>> zlv.me has setup"
		return;
	fi
	
	echo ""
	echo ">>> setup zlv.me"
	git clone git@github.com:JeremyHe-cn/JeremyHe-cn.github.io.git -b source-hexo ~/Zlv.me
	if ! type npm >dev/null 2>&1; then
		echo ">>> install npm: https://nodejs.org/en/"
		exit 1;
	fi

	cd ~/Zlv.me
	npm install hexo-cli -g
	npm install	
	if [ ! -d ./themes ]; then 
		mkdir themes
	fi
	npm install --save hexo-renderer-jade hexo-generator-feed hexo-generator-sitemap hexo-browsersync hexo-generator-archive
	git clone git@github.com:JeremyHe-cn/hexo-theme-apollo.git themes/apollo
}

# main
read -p "Enter ur name(JeremyHe): " username
if [ ! "$username" ]; then
	username="JeremyHe"
fi

read -p "Enter ur email(jeremyhe.cn@gmail.com): " email
if [ ! "$email" ]; then
	email="jeremyhe.cn@gmail.com"
fi

sudo echo ">> start install"
copy_git;
install_sh_user;
install_shell_integration;
config_git;
config_vim;
setup_zlv_me;
echo ">> install finish"


