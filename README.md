# Docker_Ubuntu14_CRON
This repository holds all files needed to create a Docker container based on Ubuntu 14.04, that can run CRON jobs as a non-privileged user.

Creating a Linux container to run CRON jobs is straightforward, with information [here](http://unix.stackexchange.com/questions/280224/how-to-build-a-cron-docker-image-properly) and [here](http://stackoverflow.com/questions/37458287/how-to-run-a-cron-job-inside-a-docker-container). However, per Docker's [best practices](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/), configuring the container to run CRON jobs as a non-privileged user is more challenging. 

The project assumes Docker is properly configured/installed on the user's system, with "$ docker -v" functioning properly from the command line.

These files show how to create a Docker container with:
* Ubuntu 14.04
* All updates/upgrades/cron installed.
* Jobs/startup scripts properly configured/copied.
* New, non-privileged user added with single sudoers entry to run cron.
* A single job, running every minute and writing to a log file.

<h3>SOFTWARE:</h3>
* Docker Versions 17.03.1-ce

<h3>EXECUTION:</h3>
Useful commands are shown in the comments section at the top of "./Dockerfile".

