# tmux

## Prep
tmux depends on [libevent 2.x](http://libevent.org/), this guide assumes [libevent version 2.0.22](../libevent/) is already installed and configured.
```
SRCDIR=/opt/linux/centos/7.x/x86_64/src
PKGDIR=/opt/linux/centos/7.x/x86_64/pkgs
LIBEV_DIR=libevent/2.0.22
cd $SRCDIR
wget https://github.com/tmux/tmux/releases/download/2.2/tmux-2.2.tar.gz
tar -zxvf tmux-2.2.tar.gz
cd tmux-2.2
mkdir $PKGDIR/tmux $PKGDIR/tmux/2.2
```

## Compile
```
./configure CFLAGS="-I$PKGDIR/$LIBEV_DIR/include" LDFLAGS="-L$PKGDIR/$LIBEV_DIR/lib -L$PKGDIR/$LIBEV_DIR/include"
CPPFLAGS="-I$PKGDIR/$LIBEV_DIR/include" LDFLAGS="-static -L$PKGDIR/$LIBEV_DIR/include -L$PKGDIR/$LIBEV_DIR/lib" make
```

## Install
```
cp tmux $PKGDIR/tmux/2.2
```

## Cleanup
```
cd $SRCDIR
[ -d tmux ] || mkdir tmux
mv tmux-2.2/ tmux-2.2.tar.gz tmux/
```
