FROM node:15.7.0-alpine3.12 AS BUILD

WORKDIR /src
COPY . /src

RUN yarn && yarn run build


FROM node:15.7.0-alpine3.12 AS FINAL

WORKDIR /app
COPY --from=BUILD /src/dist/ /app

RUN yarn global add serve

ENTRYPOINT ["serve"]