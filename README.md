# 42lab
This docker image contains required tools for developing and debuging your 42 projects, so that you don't have to push your projects with silly leaks.
*execpt graphical projects.

## ToolBox
The image has pretty much all you need in developing & debuging your 42 Projects.

|          TOOL         |  AVAILABLE  |
|-----------------------|-------------|
|   GCC                 |      ✅     |
|   CLANG               |      ✅     |
|   NORMINETTE          |      ✅     |
|   GDB                 |      ✅     |
|   LLDB                |      ✅     |
|   STRACE              |      ✅     |
|   LTRACE              |      ✅     |
|   VIM                 |      ✅     |
|   NEOVIM              |      ✅     |
|   MAKE                |      ✅     |
|   ZSH & OH MY ZSH     |      ✅     |

## Featues
- Auto import ssh keys out of host machine.
- More to come.

## Usage
DISCLAIMER: If you want to learn docker and how it works and all the fun stuff this is not the place to do so. check this out.

[Docker Tutorial for Beginners](https://www.youtube.com/watch?v=fqMOX6JJhGo).

### Downloading the image
The following command should download the image in your machine.
```sh
docker pull ayoubedd/42lab
```


### Checking the image
you can can check out if the image successfully downloaded by running this command.
```sh
docker images
```
you should see the name of the image among others if there is.


### Starting the container
Now that we have the image downloaded we can start the Container.
```sh
docker run -d -v "$HOME/.ssh/":/root/.ssh -v "$(PWD)":/src --name 42lab 42lab
```

*By running the provided command you are going to launch a new docker container named 42lab
and your current working directory is going to be auto mounted in your container so you can debug
your existing projects in your host machine.

if that doesn't suits you can made some changes to the command:
  - Change ``"$(PWD)"`` with the directory you need to be mounted in your container.
  - You can add more mount point's from your host machine to your container by simplt adding the following flag to each direcotry you want to add ``-v "path in your host mahine":"path in the container"``.
  - Change the name of the container ``--name 42lab`` to ``--name something``.
  - if you desn't need your ssh keys inside your container your simply remove the ``-v "$HOME/.ssh/":/root/.ssh`` out of the command.

now i assumre that you we have a up and running docker container.

### Attach to the Container
We can attach to the docker container by running the following command.
```sh
docker exec -it 42lab zsh
```
if your did change the name of the container in the previous step you need to change it here too. just by replacing ``42lab`` by your costum name.

now you realize that you are no longer in host mahine shell, but you are in the containers.

You can run the ``ls`` command to list all the files and directorys you choost to mount from your host machine.

### Exit the container
when ever you wan't to leave the container and go back to your host machine shell. simply run the exit command.

```sh
exit
```

### Stop the conatiner
if you exit the conatiner it doesn't mean that it is stopped. you can list the running container running the following command.
```sh
docker ps
```

## Congratulations
Contrags, now you have a great toolbox for developing and debuging your projects. you have no excuse to leave you programs leak.
