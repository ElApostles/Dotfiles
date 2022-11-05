#!/bin/bash

echo "Do you wish to download clang-15?"
select yn in "Yes" "No"; do
    case $yn in
        Yes )
			cd ~/goinfre \
				&& curl -OL https://github.com/llvm/llvm-project/releases/download/llvmorg-15.0.3/clang+llvm-15.0.3-x86_64-apple-darwin.tar.xz \
				&& tar -xf clang+llvm-15.0.3-x86_64-apple-darwin.tar.xz \
				&& rm clang+llvm-15.0.3-x86_64-apple-darwin.tar.xz
			
			echo "Do you wish to remove programs that not related to clang?"
			select yn in "Yes" "No"; do
    			case $yn in
        			Yes ) cd clang+llvm-15.0.3-x86_64-apple-darwin \
						&& cd bin \
						&& ls | grep -v clang | xargs rm \
						&& ls | grep -v clang-15 | grep -E clang[-d] | xargs rm; break;;
        			No ) exit;;
    			esac
			done
			echo "Do you wish to remove library that not related to clang?"
			select yn in "Yes" "No"; do
    			case $yn in
        			Yes ) cd ../lib \
						&& ls | grep -v clang | xargs rm -rf; break;;
        			No ) exit;;
    			esac
			done
			echo "Do you wish to remove library that not related to clang?"
			select yn in "Yes" "No"; do
    			case $yn in
        			Yes )  cd ../include \
						&& ls | grep -v clang | grep -v c++ | xargs rm -rf; break;;
        			No ) exit;;
    			esac
			done

			echo "Add path"
			echo "PATH=$HOME/clang-15.0.3/bin/:$PATH" >> ~/.zshrc \
				&& source ~/.zshrc
			break;;
    	No ) exit;;
	esac
done	

if [[ ! -e $HOME/clang-15.0.3 ]]; then
	cd ~/goinfre \
		&& curl -OL https://github.com/llvm/llvm-project/releases/download/llvmorg-15.0.3/clang+llvm-15.0.3-x86_64-apple-darwin.tar.xz \
		&& tar -xzf clang+llvm-15.0.3-x86_64-apple-darwin.tar.xz \
		&& rm clang+llvm-15.0.3-x86_64-apple-darwin.tar.xz \
		&& cd clang+llvm-15.0.3-x86_64-apple-darwin \
		&& cd bin \
		&& ls | grep -v clang | xargs rm \
		&& ls | grep -v clang-15 | grep -E clang[-d] | xargs rm \
		&& cd ../lib \
		&& ls | grep -v clang | xargs rm -rf \
		&& cd ../include \
		&& ls | grep -v clang | grep -v c++ | xargs rm -rf \
		&& echo "PATH=$HOME/clang-15.0.3/bin/:$PATH" >> ~/.zshrc \
		&& source ~/.zshrc
fi
