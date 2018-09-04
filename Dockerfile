FROM python:3.6

ADD requirements.txt /jqueuer_manager/requirements.txt
ADD experiment.py /jqueuer_manager/experiment.py
ADD job_manager.py /jqueuer_manager/job_manager.py
ADD job_operations.py /jqueuer_manager/job_operations.py
ADD experiment_receiver.py /jqueuer_manager/experiment_receiver.py
ADD jqueuer_manager.py /jqueuer_manager/jqueuer_manager.py
ADD parameters.py /jqueuer_manager/parameters.py
ADD monitoring.py /jqueuer_manager/monitoring.py
ADD index.html /jqueuer_manager/index.html
ADD base-tosca.yaml /jqueuer_manager/base-tosca.yaml
WORKDIR /jqueuer_manager/
RUN mkdir log
RUN mkdir data
RUN pip install -r requirements.txt
RUN pip install -U "celery[redis]"
ENTRYPOINT python3 jqueuer_manager.py