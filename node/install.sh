if test ! $(which spoof)
then
  sudo npm install spoof -g
fi

if test ! $(which bower)
then
  echo "  Installing bower for you."
  npm install -g bower
fi
