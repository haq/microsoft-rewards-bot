FROM python

# install google chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN apt update

# installing required packages
RUN apt install -y google-chrome-stable xvfb

# create the app directory
WORKDIR /app

# clone the project
RUN git clone https://github.com/charlesbel/Microsoft-Rewards-Farmer.git ./

# install dependencies
RUN pip install --root-user-action=ignore  -r requirements.txt

# copy over entrypoint script
COPY entrypoint.sh ./

#
ENTRYPOINT ["/app/entrypoint.sh"]

#
CMD ["python3", "main.py", "--visible"]
