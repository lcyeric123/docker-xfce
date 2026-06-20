FROM debian:bullseye
ENV DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386

RUN apt update && apt install -y \
    tigervnc-standalone-server \
    xfce4 \
    xfce4-goodies \
    xorg \
    dbus-x11 \
    sudo \
    curl \
    wget \
    nano \
    net-tools \
    policykit-1 \
    pulseaudio \
    pulseaudio-utils \
    wine \
    wine32 \
    firefox-esr \
    && apt clean && rm -rf /var/lib/apt/lists/*

RUN echo "root:root" | chpasswd

RUN sed -i 's/^allowed_users=.*/allowed_users=anybody/' /etc/X11/Xwrapper.config || echo "allowed_users=anybody" >> /etc/X11/Xwrapper.config

RUN echo "startxfce4" > /root/.xsession && chmod 700 /root/.xsession

RUN mkdir -p /var/run/dbus && dbus-uuidgen > /var/lib/dbus/machine-id

EXPOSE 5901

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
