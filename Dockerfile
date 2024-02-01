# Use an official Ubuntu base image
FROM ubuntu:latest

# Set environment variables to non-interactive (this prevents some prompts)
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Download and install Anaconda
ENV ANACONDA_VERSION=2023.09-0
RUN wget https://repo.anaconda.com/archive/Anaconda3-${ANACONDA_VERSION}-Linux-x86_64.sh && \
    bash Anaconda3-${ANACONDA_VERSION}-Linux-x86_64.sh -b -p /opt/conda && \
    rm Anaconda3-${ANACONDA_VERSION}-Linux-x86_64.sh

# Add Conda to PATH
ENV PATH=/opt/conda/bin:$PATH

# Set up the working directory
WORKDIR /workspace

# Expose the port Jupyter will run on
EXPOSE 8888

# Update Conda, and install JupyterLab and PyTorch packages
RUN conda update -n base -c defaults conda && \
    conda install -c conda-forge jupyterlab && \
    conda install pytorch torchvision torchaudio cpuonly -c pytorch

# Install JupyterLab Vim extension (didn't feel right to develop without it)
RUN pip install jupyterlab-vim

# Run Jupyter Notebook or Lab (uncomment whichever one you prefer)
#CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]
