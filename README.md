# 42lab

This docker image contains required tools for developing and debugging your 42 projects, so that you don't have to push your projects with silly leaks.
\*except graphical projects.

## Toolbox 🧰

The image has pretty much all you need in developing & debugging your 42 Projects.

| TOOL            | AVAILABLE |
| --------------- | --------- |
| GCC             | ✅        |
| CLANG           | ✅        |
| NORMINETTE      | ✅        |
| GDB             | ✅        |
| LLDB            | ✅        |
| VALGRIND        | ✅        |
| STRACE          | ✅        |
| LTRACE          | ✅        |
| VIM             | ✅        |
| NEOVIM          | ✅        |
| MAKE            | ✅        |
| ZSH & OH MY ZSH | ✅        |

## Features

- Auto import ssh keys out of host machine.
- More to come.

## Usage

DISCLAIMER: If you want to learn docker and how it works and all the fun stuff, this is not the place to do so. Check this out.

[Docker Tutorial for Beginners](https://www.youtube.com/watch?v=fqMOX6JJhGo).

### Downloading the image

The following command should download the image in your machine.

```sh
docker pull ayoubedd/42lab
```

### Checking the image

you can check out if the image successfully downloaded by running this command.

```sh
docker images
```

You should see the name of the image among others if there is.

### Starting the container

Now that we have the image downloaded, we can start the Container.

```sh
docker run -d -v "$HOME/.ssh/":/root/.ssh -v "$(PWD)":/src --name 42lab ayoubedd/42lab
```

\*By running the provided command you are going to launch a new docker container named 42lab and your current working directory is going to be auto mounted in your container, so you can debug your existing projects in your host machine.

If that doesn't suit, you can make some changes to the command:

- Change `"$(PWD)"` with the directory you need to be mounted in your container.
- You can add more mount point's from your host machine to your container by simply adding the following flag to each directory you want to add `-v "path in your host mahine":"path in the container"`.
- Change the name of the container `--name 42lab` to `--name something`.
- If you don't need your ssh keys inside your container, you can simply remove the -v "$HOME/.ssh/":/root/.ssh out of the command

Now, I assume that you have an up and running docker container.

### Attach to the Container

We can attach to the docker container by running the following command.

```sh
docker exec -it 42lab zsh
```

If you did change the name of the container in the previous step, you need to change it here too. Just by replacing `42lab` by your custom name.

Now you realize that you are no longer in the host machine shell, but you are in the containers.

You can run the `ls` command to list all the files and directories you choose to mount from your host machine.

### Exit the container

When ever you want to leave the container and go back to your host machine shell. Simply run the exit command.

```sh
exit
```

### Stop the container

if you exit the container, it doesn't mean that it is stopped. You can list the running container running the following command.

```sh
docker ps
```
to stop the container you need to run the following command.

```sh
docker stop 42lab
```
*change the name of the container if you did so when you were creating the container.


### Removing the container

If you done with this crappy conatiner and you wan't to get rid of it. you can run the following command.

```sh
docker container rm 42lab
```

## Congratulations 🎉🎉

Congrats, now you have a great toolbox for developing and debugging your projects. You have no excuse to leave your programs leak.
