FROM java:8

RUN \
        mkdir -p /opt/lib && \
        cd /opt/lib && \
        wget https://fastroutedata.blob.core.windows.net/optaplanner/optaplanner-tsp-1.0-rel.zip && \
        unzip optaplanner-tsp-1.0-rel.zip 

WORKDIR /opt/lib/optaplanner-tsp-1.0

ENV TSP_SAS_KEY=""
ENV TSP_SB_NS="sb://routing.servicebus.windows.net/"
ENV OSRM_URL="http://osrm-server:5000"

ENTRYPOINT ["java", "-Xmx512M", "-Djava.net.preferIPv4Stack=true"]
CMD ["-jar", "optaplanner-tsp.jar"]
