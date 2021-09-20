# OCP4 Infrastructure Utility Container
The general purpose behind this image is to provide the tools needed to deploy
cloud environments and then ultimately openshift. There are a number of tools
built into the image to simplify the deployment workflow. Ideally, this image would be used
with a continuous integration tool.

- terraform (0.15.4)
- helm3
- oc (4.6.13)
- openshift-install (4.6.13)

pip libraries:
- ansible
- boto3
- botocore
- pyOpenSSL
- passlib

Cloud CLI:
- AWS
- Azure
