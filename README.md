# Build Jenkins docker image with  .NET SDK 

### Build a docker image from Dockerfile
`docker build -t jenkins-net:latest .`

### Run Jenkins docker image
`docker run -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins-net:latest`
