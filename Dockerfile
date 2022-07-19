#FROM registry.access.redhat.com/ubi8/python-38
FROM  quay.io/ml-aml-workshop/tensorflow-gpu

USER 1001
#RUN pip install tensorflow
WORKDIR /opt/app-root/src
COPY showgpu.py /opt/app-root/src/

CMD ["python", "/opt/app-root/src/showgpu.py"]
