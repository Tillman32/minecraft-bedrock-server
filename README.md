# Easy Minecraft Bedrock Server
A sample Minecraft Bedrock edition server with Portainer GUI to manage it.

![Minecraft Bedrock Server](https://raw.githubusercontent.com/Tillman32/minecraft-bedrock-server/refs/heads/main/header.png)

## Getting started
```shell
wget -O boostrap.sh https://raw.githubusercontent.com/Tillman32/minecraft-bedrock-server/refs/heads/main/boostrap.sh && \
chmod +x boostrap.sh && \
./boostrap.sh
```
Optionally, you can copy the `.env.example` into a new file `.env` and modify the defaults before running `./boostrap.sh`.
```shell
git clone https://github.com/Tillman32/minecraft-bedrock-server.git
cd minecraft-bedrock-server
cp .env.example .env
nano .env # Make edits if desired
./boostrap.sh
```
## Managing the container 
Navigate to `https://host:9443` to manage the docker container using Portainer. 