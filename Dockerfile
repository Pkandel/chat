  
#take default image of node
FROM node:12

#create app directory in container
RUN mkdir -p /app

#set app directory as default working directory
WORKDIR /app

#copy all fies from current directory to /app container
COPY package.json /app

RUN npm install
RUN npm install babel-cli -g

# copy rest of the project
COPY . /app
RUN npm run build

#expose port 4000 to outside world
EXPOSE 3000
 
#cmd to start 
CMD ["npm", "start"]