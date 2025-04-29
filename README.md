# Easy Minecraft Bedrock Server
A sample Minecraft Bedrock edition server with Portainer GUI to manage it.

## Getting started
```shell
wget -O https://github.com/Tillman32/minecraft-bedrock-server/raw/refs/heads/main/boostrap.sh && \
chmod +x bootstrap.sh && \
./bootstrap.sh
```
Optionally, you can copy the `.env.example` into a new file `.env` and modify the defaults before running `./bootstrap.sh`.
```shell
git clone https://github.com/Tillman32/minecraft-bedrock-server.git
cd minecraft-bedrock-server
cp .env.example .env
nano .env # Make edits if desired
./bootstrap.sh
```
## Managing the container 
Navigate to `https://host:9443` to manage the docker container using Portainer. 