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

# install dependencies
RUN pip install -r requirements.txt

# copy over entrypoint script
COPY entrypoint.sh ./

#
ENTRYPOINT ["/app/entrypoint.sh"]

#
CMD ["python3", "ms_rewards_farmer.py", "--fast", "--autoexit"]
