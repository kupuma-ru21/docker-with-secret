# REF: https://www.googlecloudcommunity.com/gc/Community-Blogs/No-servers-no-problem-A-guide-to-deploying-your-React/ba-p/690760
# REF: https://pnpm.io/docker
# Before running "gcloud builds submit -t ...", you have to login using "gcloud auth login" and "gcloud config set project ..."

FROM node:20-slim AS base

ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"

RUN corepack enable
COPY . /app
WORKDIR /app

FROM base AS prod-deps
RUN pnpm install --prod

FROM base AS build
RUN pnpm install
RUN pnpm build

FROM base
COPY --from=prod-deps /app/node_modules /app/node_modules
COPY --from=build /app/dist /app/dist
EXPOSE 3000
CMD [ "pnpm", "preview" ]
