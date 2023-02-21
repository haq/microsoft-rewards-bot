FROM python:alpine

# install required pacakges
RUN apk --no-cache add \
    chromium-chromedriver \
    git \
    xvfb

# create the app directory
WORKDIR /app

# clone the project
RUN git clone https://github.com/farshadz1997/Microsoft-Rewards-bot.git ./

# copy over entrypoint script
COPY entrypoint.sh ./

# install dependencies
RUN pip install -r requirements.txt

#
ENTRYPOINT ["/app/entrypoint.sh"]
