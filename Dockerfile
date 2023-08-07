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
RUN git clone https://gitlab.com/farshadzargary1997/Microsoft-Rewards-bot.git ./

# install dependencies
RUN pip install -r requirements.txt

# copy over entrypoint script
COPY entrypoint.sh ./
RUN chmod +x entrypoint.sh

# copy run farmer script
COPY run-farmer.sh ./
RUN chmod +x run-farmer.sh

#
ENTRYPOINT ["/app/entrypoint.sh"]

#
CMD ["/app/run-farmer.sh"]
