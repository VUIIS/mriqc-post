FROM ubuntu:22.04

RUN apt-get -y update && \
    apt-get -y install python && \
    apt-get clean

RUN pip install fpdf

COPY convert_outputs.py /opt/mriqc-post/
COPY mriqc_post.sh /opt/mriqc_post/

ENV PATH="/opt/mriqc-post:$PATH"
    
ENTRYPOINT ["mriqc_post.sh"]

