
# je genere le dossier public
FROM node as build

# je dit quel directory de travail
WORKDIR app/

# je copy les fichiers source vers l'image
COPY . .

# j'install npm
RUN npm install

# j'install gatsby-cli
RUN npm install -g gatsby-cli

RUN gatsby build

# CMD gatsby develop --host=0.0.0.0 --port=8000
# ENTRYPOINT ["gatsby", "develop", "-H", "0.0.0.0"]

FROM nginx

RUN rm /usr/share/nginx/html/index.html

COPY --from=build /app/public /usr/share/nginx/html
