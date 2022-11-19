#!/bin/zsh
#!/Users/hdoo/goinfre/homebrew/bin/fish

if [[ ! -e $HOME/clang-15.0.3 ]]; then
	CLANG_SIZE=1524600
	DISK_AVAILABLE=`df | grep Users | awk '{print $4}'`
	if [[ DISK_AVAILABLE -gt CLANG_SIZE ]]; then
		echo "Do you wish to download clang-15?"
		select yn in "Yes" "No"; do
    		case $yn in
        		Yes )
				cd ~/goinfre && pwd \
					&& curl -OL https://github.com/llvm/llvm-project/releases/download/llvmorg-15.0.3/clang+llvm-15.0.3-x86_64-apple-darwin.tar.xz \
					&& tar -xf clang+llvm-15.0.3-x86_64-apple-darwin.tar.xz \
					&& rm clang+llvm-15.0.3-x86_64-apple-darwin.tar.xz

				echo "Do you wish to remove programs that not related to clang?"
				select yn in "Yes" "No"; do
    				case $yn in
        				Yes ) cd clang+llvm-15.0.3-x86_64-apple-darwin && pwd \
							&& cd bin \
							&& ls | grep -v clang | xargs rm \
							&& ls | grep -v clang-15 | grep -E "clang[-d]" | xargs rm; break;;
        				No ) exit;;
    				esac
				done

				echo "Do you wish to remove library that not related to clang?"
				select yn in "Yes" "No"; do
    				case $yn in
        				Yes ) cd ~/goinfre/clang+llvm-15.0.3-x86_64-apple-darwin/lib && pwd \
							&& ls | grep -v clang | xargs rm -rf; break;;
        				No ) exit;;
    				esac
				done

				echo "Do you wish to remove include that not related to clang?"
				select yn in "Yes" "No"; do
    				case $yn in
        				Yes )  cd ~/goinfre/clang+llvm-15.0.3-x86_64-apple-darwin/include && pwd \
							&& ls | grep -v clang | grep -v c++ | xargs rm -rf; break;;
        				No ) exit;;
    				esac
				done

				echo "Move to $HOME/clang-15.0.3"
				cd ~/goinfre && pwd
            	mv -v clang+llvm-15.0.3-x86_64-apple-darwin clang-15.0.3
            	mv -v ~/goinfre/clang-15.0.3 ~/

				echo "Add path"
				echo "export PATH=$HOME/clang-15.0.3/bin/:$PATH" >> ~/.zshrc && source ~/.zshrc
				break;;

    			No ) exit;;
			esac
		done	
	else
		echo "Not enough disk space"
		exit 1
	fi
	echo Install clang-15 successed
else
	echo clang-15 already installed
fi
clang -v
