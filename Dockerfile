FROM node:18.16.0 AS builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

# FROM node:18.16.0 AS builder
# WORKDIR /app
# COPY package.json .
# RUN npm install
# COPY . .
# RUN npm run build
# CMD ["bash"]