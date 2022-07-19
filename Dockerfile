FROM registry.access.redhat.com/ubi8/python-38
USER root
RUN dnf -y install mesa-libGL wget
RUN dnf -y install wget
#https://developer.download.nvidia.com/compute/cuda/11.0.3/local_installers/cuda-repo-rhel8-11-0-local-11.0.3_450.51.06-1.x86_64.rpm
COPY cuda-repo-rhel8-11-0-local-11.0.3_450.51.06-1.x86_64.rpm .
RUN rpm -i cuda-repo-rhel8-11-0-local-11.0.3_450.51.06-1.x86_64.rpm

# FIX IT
RUN dnf -y install cuda --nobest --skip-broken


USER 1001
RUN pip install tensorflow
WORKDIR /opt/app-root/src
COPY showgpu.py /opt/app-root/src/

CMD ["python", "/opt/app-root/src/showgpu.py"]
