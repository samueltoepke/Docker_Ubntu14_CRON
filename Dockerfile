## Copyright 2017 Samuel Lee Toepke
## 
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
## 
## http://www.apache.org/licenses/LICENSE-2.0
## 
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.
## 

# Samuel Lee Toepke
# samueltoepke@gmail.com
# Spring 2017
# Dockerfile, Ubuntu 14.04, CRON.
# $ systemctl start docker
# $ docker ps
# $ docker images -a
# $ docker rmi -f $(docker images -q) # Delete all images
# $ docker build -t ubuntu_14_cron .
# $ docker run -it ubuntu_14_cron

  # 0. Operating System, Set Variables
  FROM ubuntu:14.04
  ENV user newuser
  ENV user_pwd newuser789  
  ENV startup startup.sh
  ENV jobs jobs.txt

  # 1. Labels/Maintainer
  LABEL project="Docker Ubuntu 14.04 with CRON"
  LABEL release-date="2017-04-08"
  MAINTAINER Samuel Toepke, samueltoepke@gmail.com

  # 2. Start Firewall
  # Don't have to configure firewall, addressed by Docker daemon.

  # 3. Updates/CRON
  RUN apt-get update && \
      apt-get -y upgrade && \
      apt-get -y install --no-install-recommends cron && \
      apt-get clean

  # 4. Add Files, Set Permissions
  ADD ./${jobs} /home/${user}/${jobs}
  ADD ./${startup} /home/${user}/${startup}
  RUN chmod +x /home/${user}/${startup}
  
  # 5. New User Setup
  RUN useradd -ms /bin/bash ${user}
  RUN echo "${user}:${user_pwd}" | chpasswd
  RUN chown -R ${user}:${user} /home/${user}
  RUN echo "${user} ALL=(ALL) NOPASSWD: /usr/sbin/cron" >> /etc/sudoers.d/mysudoers

  # 6. Container Startup
  CMD /home/${user}/${startup}
  USER ${user}
  WORKDIR /home/${user}




