FROM alpine:3.18

# install required pacakges
RUN apk --no-cache add \
    chromium \
    chromium-chromedriver \
    git \
    python3 \
    python3-tkinter \
    py3-pip \
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
CMD ["python3", "ms_rewards_farmer.py", "--no-images", "--dont-check-for-updates", "--fast", "--skip-unusual", "--no-webdriver-manager", "--on-finish", "exit"]
