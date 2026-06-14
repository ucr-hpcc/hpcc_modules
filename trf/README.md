Long filenames were crashing buffer overflow in trf so I forked a branch of this repo which already was dealing with switching from 32bit to 64bit length strings for large amphibian chromosomes which were not fitting in the char buffer memory.

My implementation further handled bug fix of snprintf to ensure buffer is not overrun and set the MAX_PATH variable to 2048 so there can be long path names now (esp important for long nextflow folder names + long full path names
https://github.com/hyphaltip/TRF-64bit/tree/master
