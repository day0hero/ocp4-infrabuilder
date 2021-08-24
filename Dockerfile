FROM registry.access.redhat.com/ubi8/ubi

RUN yum update -y && \
yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm && \
yum -y install git python2 python3 python3-pip podman unzip yum-utils bind-utils openssh openssh-clients && \
yum -y install jq && \
yum clean all && \
pip3 install --upgrade pip --no-cache-dir && \
pip3 install cryptography requests pyOpenSSL botocore passlib boto3 ansible==2.9.23 --no-cache-dir && \
(cd /tmp && curl -O https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/4.6.13/openshift-install-linux.tar.gz  && \
 curl -LfO https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/4.6.13/openshift-client-linux.tar.gz) && \
tar xvf /tmp/openshift-client-linux.tar.gz -C /usr/local/bin/ && \
tar xvf /tmp/openshift-install-linux.tar.gz -C /usr/local/bin && \
(cd /tmp && curl -fsSL -o helm-v3.4.1-linux-amd64.tar.gz https://get.helm.sh/helm-v3.4.1-linux-amd64.tar.gz ) && \
tar -zxvf /tmp/helm-v3.4.1-linux-amd64.tar.gz && chmod +x linux-amd64/helm && mv linux-amd64/helm /usr/local/bin/helm && \
(cd /tmp && curl -LfO https://releases.hashicorp.com/terraform/0.15.4/terraform_0.15.4_linux_amd64.zip) && \
unzip /tmp/terraform_0.15.4_linux_amd64.zip -d /usr/local/bin/ && \
rm -rf /tmp/* && \
rm -rf ~/.cache && \
mkdir -p /etc/ansible 

ADD ./ansible.cfg /etc/ansible/

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
unzip awscliv2.zip && \
./aws/install -i /usr/local/aws-cli -b /usr/local/bin/ && rm -rf *.zip

WORKDIR /openshift
