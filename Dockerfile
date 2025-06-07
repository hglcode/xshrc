FROM archlinux
WORKDIR /app
RUN echo 'Server = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist && \
    echo '[archlinuxcn]' >> /etc/pacman.conf && \
    echo 'Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch' >> /etc/pacman.conf && \
    pacman-key --init && \
    pacman-key --populate archlinux && \
    pacman -Syu --noconfirm
CMD ["bash"]
