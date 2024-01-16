#ARG URCAPX_DEV_IMAGE_VERSION
FROM universalrobots/ursim_e-series 
    #:$URCAPX_DEV_IMAGE_VERSION
#ARG URCAPX_DEV_IMAGE_VERSION
#ENV URCAPX_DEV_IMAGE_VERSION=$URCAPX_DEV_IMAGE_VERSION
# Setting the ENTRYPOINT to docker-init.sh will configure non-root access to
# the Docker socket if "overrideCommand": false is set in devcontainer.json. 
# The script will also execute CMD if you need to alter startup behaviors.
#ENTRYPOINT [ "/usr/local/share/docker-init.sh" ]
#CMD [ "sleep", "infinity" ]

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

RUN apt-get update && \
    apt-get -y install --no-install-recommends netcat-traditional && \
    apt-get -y install git

# Make it possible for polyscope to find uradmin scripts
ENV PATH "$PATH:/ursim/usr/bin"

# Make it possible to execute C++ daemons
ENV LD_LIBRARY_PATH "$LD_LIBRARY_PATH:/opt/urtool-3.0/lib"

# Copy entrypoint script
#COPY entrypoint.sh /entrypoint.sh
#RUN chmod +x entrypoint.sh


# Modbus Port
EXPOSE 502
# Web browser VNC viewer
#EXPOSE 6080
# VNC viewer
#EXPOSE 5900
# Interface Ports
EXPOSE 29999
EXPOSE 30001-30004
# Interpreter mode
EXPOSE 30020
# Github driver ports
EXPOSE 50001-50003

# This will start the simulator
#ENTRYPOINT ["/entrypoint.sh"]

RUN runsvdir=$(find /etc/service/ -name "runsvdir*") && \
    run_file="$runsvdir/run" && \
    mkdir -p /home/root/service && \
    sed -i 's|/ursim/service|/home/root/service|g' $run_file && \
    chmod +x $run_file

ENV runsvdir $runsvdir && \
    runfile $runfile


RUN rm /entrypoint.sh
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh


# find path to daemon run file
#runsvdir=$(find /etc/service/ -name "runsvdir*")
#run_file="$runsvdir/run"

# Correct path in run file and make executable
#mkdir -p /home/root/service
#sed -i 's|/ursim/service|/home/root/service|g' $run_file
#chmod +x $run_file

# Run daemon service
#runsv $runsvdir/ &
#rm -r /ursim/service