FROM archlinux

RUN pacman -Syu --noconfirm && \
    pacman -S ansible sudo --noconfirm


RUN echo "bastiaan ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN useradd -ms /bin/zsh bastiaan
# WORKDIR /usr/local/bin
WORKDIR /home/bastiaan
COPY . .
RUN chown -R 1000:1000 /home/bastiaan

USER bastiaan

CMD ["sh","-c","ansible-playbook local.yml"]
