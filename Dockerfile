# KLAI Issam 2019

FROM ubuntu:trusty

EXPOSE 80 5000
# Set DEBIAN_FRONTEND to avoid warning like "debconf: (TERM is not set, so the dialog frontend is not usable.)"
ENV DEBIAN_FRONTEND="noninteractive"
# Install Docker
RUN apt-get update; apt-get install python ; apt-add-repository ppa:ansible/ansible \
    apt-get update; \
    apt-get install ansible 



# Setup devstack user
RUN mkdir -p /opt; \
    useradd -m -s /bin/bash -d /opt/klai klai 


# Install devstack scripts
RUN git clone https://github.com/openstack-dev/devstack /devstack

# python-pip just became collatoral damage.  reinstall it.
RUN apt-get install -q -y python-pip

# Install Flask
RUN pip install Flask
RUN FLASK_APP=hello.py flask run




#CMD ["/opt/dockenstack/bin/start"]
