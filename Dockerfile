FROM nikolaik/python-nodejs

WORKDIR /app
RUN mkdir -p /app/data

RUN pip3 install requests matplotlib geopy pillow

COPY package.json /app/package.json
COPY package-lock.json /app/package-lock.json

RUN npm install

COPY app.js /app/app.js
COPY views/ /app/views/ 
COPY getPM10.py /app/getPM10.py
COPY getStations.py /app/getStations.py
COPY getStatistics.py /app/getStatistics.py

COPY routes/ /app/routes/
COPY bin/www/ /app/bin/www
COPY ressources /app/ressources/

CMD [ "node", "bin/www" ]