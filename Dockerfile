FROM python:3.9

WORKDIR /flask_project1
COPY . .

RUN pip3 install -r requirements.txt

CMD ["gunicorn", "-b", ":5000", "main:APP"]
