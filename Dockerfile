#Jenkins docker file
FROM jenkins/jenkins:lts-jdk11

# Switch to root to install .NET Core SDK
USER root

# Shows the distro information!
RUN uname -a && cat /etc/*release

# Download wget, add the Microsoft package signing key to your list of trusted keys and add the package repository
RUN apt update && \
    apt install wget && \ 
    wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    rm packages-microsoft-prod.deb

# Install the .NET SDK
RUN apt update && \
    apt install -y dotnet-sdk-6.0

# Switch to jenkins user
USER jenkins