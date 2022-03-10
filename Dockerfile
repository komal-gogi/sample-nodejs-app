FROM mhart/alpine-node:12 as development

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install

# Bundle app source
COPY . .

EXPOSE 8080
CMD [ "node", "server.js" ]

FROM mhart/alpine-node:12 as test
WORKDIR /usr/src/app
COPY --from=development /usr/src/app/ .
RUN ["npm", "run", "test"]
