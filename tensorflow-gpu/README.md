Notes on compiling TensorFlow
Please update as needed

# Install

- Upgrade Bazel, if necessary

- Load necessary modules:
    module load cuda/8.0
    module load cuDNN/6.0
    module load bazel

- Prepare Python virtualenv:
    module unload python
    module load python/2.7.13-venv
    cd /opt/linux/centos/7.x/x86_64/pkgs/python/2.7.13-venv
    virtualenv --system-site-packages tensorflow-1.3.0

- Activate the tensorflow venv:
    module unload python
    source /opt/linux/centos/7.x/x86_64/pkgs/python/2.7.13-venv/tensorflow-1.3.0/bin/activate

- Verify that you're using the venv python, pip, wheel:
    for p in python pip wheel; do which $p && head -1 $(which $p); done

- Install Python prereqs
    pip install six numpy

- Request a job on the GPU partion and become root (need to run ldconfig)

- Switch to the TensorFlow source directory
    cd /opt/linux/centos/7.x/x86_64/src/tensorflow-1.3.0

- Run the configure script
    ./configure
    
    Use the following answers if requested:
    optimization: -march=native -O3
    OpenCL support: N
    CUDA support: Y
    CUDA version: 8.0
    CUDA location: /opt/linux/centos/7.x/x86_64/pkgs/cuda/8.0
    cuDNN version: 6.0
    cuDNN location: /opt/linux/centos/7.x/x86_64/pkgs/cuDNN/6.0
    Compute capability: 3.7 (for Tesla K80)
    MPI location: /opt/linux/centos/7.x/x86_64/pkgs/openmpi/2.0.1-slurm-16.05.4

- Build TensorFlow
    bazel build --config=opt --config=cuda //tensorflow/tools/pip_package:build_pip_package
    bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg/

- Become pkgadmin, you no longer need root

- Install TensorFlow into its venv:
    pip install /tmp/tensorflow_pkg/tensorflow-1.3.0-cp27-cp27m-linux_x86_64.whl

# Issues
Currenlt it seems as though there is an optimization issue.
You will see many warnings containing "[...] requires compiling with optimization (-O)".
Try using "-march=native -O3" during configuration and make sure it is passed to the auto build process.

