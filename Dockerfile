FROM node:14
WORKDIR /app
COPY package*.json ./
RUN npm install
# RUN npm run build
# RUN npm build
COPY . .
EXPOSE 3000
CMD ["npm", "start"]