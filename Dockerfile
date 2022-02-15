FROM ubuntu:latest

RUN apt update && apt upgrade -y
RUN ln -fs /usr/share/zoneinfo/Africa/Casablanca /etc/localtime
RUN apt install zsh \
								git \
								vim \
								neovim \
								python3 \
								python3-pip \
								curl \
								wget \
								clang \
								gdb \
								lldb \
								valgrind \
								strace \
								ltrace -y
RUN pip3 install norminette c-formatter-42
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
RUN curl https://get.volta.sh | bash
RUN /root/.volta/bin/volta install node
RUN chsh -s /bin/zsh
RUN git clone https://github.com/zsh-users/zsh-autosuggestions.git /root/.oh-my-zsh/plugins/zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /root/.oh-my-zsh/plugins/zsh-syntax-highlighting
WORKDIR /usr/bin
COPY init .

WORKDIR /app

CMD ["initlab"]
