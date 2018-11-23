# Heroku Docker Trial

This is a sample application for [Heroku Meetup #23 "Heroku Dynamite!!"](https://herokujp.doorkeeper.jp/events/82754).

You can run it in several ways.

## 1. [Local Development with Docker Compose](https://devcenter.heroku.com/articles/local-development-with-docker-compose)

    $ docker-compose build
    $ docker-compose up -d
    $ open http://localhost:13000

Cleanup

    $ docker-compose down

## 2. [Container Registry & Runtime (Docker Deploys)](https://devcenter.heroku.com/articles/container-registry-and-runtime)

Create and open App

    $ heroku container:login
    $ heroku create masutaka-docker
    $ open https://dashboard.heroku.com/apps/masutaka-docker/settings
    $ git remote set-url heroku https://git.heroku.com/masutaka-docker.git
    $ heroku config:set DESCRIPTION='This application is running using "heroku container:push web".'
    $ heroku container:push web
    $ heroku container:release web
    $ heroku open

Cleanup

    $ heroku destroy masutaka-docker

## 3. [Building Docker Images with heroku.yml](https://devcenter.heroku.com/articles/build-docker-images-heroku-yml)

### 3.1. without setup section

Prepare

    $ mv heroku.yml.bak heroku.yml
    $ git add heroku.yml heroku.yml.bak
    $ git commit -m '$ mv heroku.yml.bak heroku.yml'

Create and open App

    $ heroku create --stack=container masutaka-heroku-yml
    $ open https://dashboard.heroku.com/apps/masutaka-heroku-yml/settings
    $ git remote set-url heroku https://git.heroku.com/masutaka-heroku-yml.git
    $ heroku config:set DESCRIPTION='This application is running using heroku.yml without setup section.'
    $ git push heroku master
    $ heroku open

Cleanup

    $ heroku destroy masutaka-heroku-yml

### 3.2. with setup section

Prepare

    $ heroku update beta
    $ heroku plugins:install @heroku-cli/plugin-manifest
    $ sed -i '.bak' -e 's/^# //g' heroku.yml
    $ git diff
    $ git add heroku.yml
    $ git commit -m 'Enable setup section'

Create and open App

    $ heroku create --stack=container --manifest masutaka-heroku-yml-setup
    $ open https://dashboard.heroku.com/apps/masutaka-heroku-yml-setup/settings
    $ git remote set-url heroku https://git.heroku.com/masutaka-heroku-yml-setup.git
    $ git push heroku master
    $ heroku open

Cleanup

    $ heroku destroy masutaka-heroku-yml-setup
    $ heroku update stable
    $ heroku plugins:remove manifest
