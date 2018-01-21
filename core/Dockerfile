FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive \
	LANG=C.UTF-8 \
	LC_ALL=C.UTF-8

ARG UNAME=user
ARG UID=1000
ARG GNAME=user
ARG GID=1000
ARG HOME=/home/user

RUN apt-get update -qq \
 && apt-get install --no-install-recommends -y \
	sudo \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p ${HOME} \
 && echo "${UNAME}:x:${UID}:${GID}:${UNAME},,,:${HOME}:/bin/bash" >> /etc/passwd \
 && echo "${GNAME}:x:${GID}:" >> /etc/group \
 && echo "${UNAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/${UNAME} \
 && chmod 0440 /etc/sudoers.d/${UNAME} \
 && chown ${UID}:${GID} -R ${HOME}

# Add Tini
ARG TINI_VERSION="v0.16.1"
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/local/bin/tini
RUN chmod +x /usr/local/bin/tini
ENTRYPOINT ["tini", "--"]

USER ${UNAME}
ENV HOME=${HOME}
WORKDIR ${HOME}

CMD ["bash"]
