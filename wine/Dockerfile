FROM okwrtdsh/core:latest

ARG UNAME=user
ARG BUILD_DEPENDENCIES=' \
	software-properties-common \
	apt-transport-https \
'
ARG WINE_DEPENDENCIES=' \
	wget \
	unzip \
	cabextract \
	p7zip \
	zenity \
'
ENV WINEARCH=win32

USER root
WORKDIR /tmp/build
RUN apt-get update -qq \
 && apt-get install --no-install-recommends -y \
	$BUILD_DEPENDENCIES \
	$WINE_DEPENDENCIES \
 && dpkg --add-architecture i386 \
 && wget -nc https://dl.winehq.org/wine-builds/Release.key \
 && apt-key add Release.key \
 && apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/ \
 && apt-get update -qq \
 && apt-get install --no-install-recommends -y \
	winehq-stable \
 && wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks \
 && chmod +x winetricks \
 && mv winetricks /usr/local/bin \
 && rm -rf /tmp/* \
 && apt-get remove --purge -y \
	$BUILD_DEPENDENCIES \
 && rm -rf /var/lib/apt/lists/*

USER ${UNAME}
WORKDIR ${HOME}
CMD ["bash"]

