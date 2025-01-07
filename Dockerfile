FROM python

RUN apt update && apt install -y chromium chromium-driver xvfb

WORKDIR /app

RUN git clone -b develop https://github.com/klept0/MS-Rewards-Farmer.git ./
RUN pip install --root-user-action=ignore --no-cache-dir -r requirements.txt

COPY entrypoint.sh ./

ENTRYPOINT ["/app/entrypoint.sh"]

CMD ["python3", "main.py", "--visible", "--lang", "en"]
