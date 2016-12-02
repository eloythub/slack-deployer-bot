FROM asia.gcr.io/eloyt-149708/deployer-bot

MAINTAINER Mahan Hazrati<eng.mahan.hazrati@gmail.com>

RUN npm install hubot-slack --save
RUN npm install hubot-redis-brain --save

#ENV HUBOT_SLACK_TOKEN xxxxxxxxxxxxxxxxx
#ENV HUBOT_SLACK_TEAM "Eloyt"
#ENV HUBOT_SLACK_BOTNAME "el-bot"

ENTRYPOINT bin/hubot -a slack