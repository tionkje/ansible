FROM archlinux

ARG TAGS
WORKDIR /usr/local/bin
RUN pacman -Syu --noconfirm && \
    pacman -S ansible --noconfirm
COPY . .
CMD ["sh","-c","ansible-playbook $TAGS local.yaml"]
