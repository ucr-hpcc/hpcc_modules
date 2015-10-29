# capnproto

## Prep
```
cd $SRCDIR
curl -O https://capnproto.org/capnproto-c++-0.5.3.tar.gz
tar zxf capnproto-c++-0.5.3.tar.gz
cd capnproto-c++-0.5.3
```

## Compile
```
./configure --prefix=$PKFOLDER
make -j6 check
```

## Install
```
make install
```

## Cleanup
```
```

