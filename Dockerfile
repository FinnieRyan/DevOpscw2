FROM node:14

WORKDIR /usr/myapp

COPY server.js .

EXPOSE 8080 	

ENV NAME CW2

CMD ["node", "server.js"]
