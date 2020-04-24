# nanoplish

## Prep
First go to GitHub and copy hash for version:
```
https://github.com/jts/nanopolish/tags
```

Then copy repo and check out specific version:
```
git clone --recursive https://github.com/jts/nanopolish.git nanopolish-0.13.1
cd nanopolish-0.13.1
git checkout 2202318e5aed7e26c069f118be3bf94566619eeb # Use hash for version 0.13.1
```

## Compile
```
make all
```

## Install
```
mv nanopolish-0.13.1 ${HPCC_MODULES}/nanopolish/0.13.1
```

