FROM ubuntu:22.04

RUN apt-get -y update && \
    apt-get -y install python-is-python3 pip && \
    apt-get clean

RUN pip install fpdf

RUN mkdir /opt/mriqc-post
COPY convert_outputs.py /opt/mriqc-post
COPY mriqc_post.sh /opt/mriqc-post

ENV PATH="/opt/mriqc-post:$PATH"
    
ENTRYPOINT ["mriqc_post.sh"]

