FROM archlinux:latest

RUN pacman -Syu	--noconfirm neovim \
							vim \
							zsh \
							bash \
							git \
							tree \
							curl \
							wget \
							bear \
							make \
							sudo \
							github-cli \
							gcc \
							clang \
							gdb \
							lldb \
							strace \
							ltrace \
							valgrind \
							rust \
							go \
							python \
							python-pip \
							openssh
RUN pip3 install norminette c-formatter-42
ENV USER user42
RUN useradd -mU $USER
RUN usermod -aG wheel $USER
RUN echo "$USER:toor" | chpasswd
RUN echo "root:toor" | chpasswd
RUN chsh -s /bin/zsh $USER
USER user42
COPY src/loop4ever src/initlab /usr/bin/

WORKDIR /home/user42/

CMD ["loop4ever"]
