## INSTALL

Download and convert the docker image to singularity.

```bash
sudo -i bash -c "module load singularity; singularity build /scratch/mycontainer.img docker://chloroextractorteam/chloroextractor"
mkdir /opt/linux/centos/7.x/x86_64/pkgs/chloroextractor/1.0.5/
mv /scratch/mycontainer.img /opt/linux/centos/7.x/x86_64/pkgs/chloroextractor/1.0.5/chloroextractorteam_chloroextractor-2018-07-11-d50410d78bf9.img
```

Create wrapper script
*name it /opt/linux/centos/7.x/x86_64/pkgs/chloroextractor/1.0.5/ptx*
``` bash
#!/bin/bash -l

module load singularity


singularity run -B /bigdata /opt/linux/centos/7.x/x86_64/pkgs/chloroextractor/1.0.5/chloroextractorteam_chloroextractor-2018-07-11-d50410d78bf9.img $@
```

## Running Chloroextractor

```bash
module load chloroextractor/1.0.5
ptx [<OPTIONS>] -1 <FQ_1> -2 <FQ_2> -d <OUTPUT-DIRECTORY>
```

example:
```bash
module load chloroextractor/1.0.5
ptx -1 SRR5216995_1M_1.fastq -2 SRR5216995_1M_2.fastq -d my-out-put-dir (this assumes the fastq files are in the current dir)
```

example bash submission script:
```bash
#!/bin/bash -l

#SBATCH --nodes=1
#SBATCH --ntasks=16 
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1G
#SBATCH --time=0-02:00:00     # 0 day and 15 minutes
#SBATCH --job-name="chloroextractor"
#SBATCH -p short,batch,intel 

module load chloroextractor/1.0.5
ptx -1 SRR5216995_1M_1.fastq -2 SRR5216995_1M_2.fastq -d output
```

# test
