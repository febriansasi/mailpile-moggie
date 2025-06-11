FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    git gnupg2 curl build-essential libssl-dev \
    libffi-dev python3-dev libsasl2-dev libldap2-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN git clone -b dev https://github.com/mailpile/Mailpile.git /opt/mailpile
WORKDIR /opt/mailpile

RUN pip install --upgrade pip \
    && pip install -r requirements.txt

RUN python setup.py build

EXPOSE 33411

CMD ["python", "mp"]
