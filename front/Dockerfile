FROM node:20 as build

WORKDIR /app

COPY ./source /app

RUN npm ci && npm run build

FROM nginx:1.25.5-alpine

COPY --from=build /app/dist /usr/share/nginx/html
COPY --from=build /app/public /usr/share/nginx/html/public
COPY template.conf /etc/nginx/template/template.conf
COPY nginx.conf /etc/nginx/nginx.conf

ENV API_URL=http://jlog-back:8080

RUN envsubst < /etc/nginx/template/template.conf > /etc/nginx/conf.d/default.conf

EXPOSE 3000
ENTRYPOINT [ "nginx" ]
CMD [ "-g", "daemon off;" ]

