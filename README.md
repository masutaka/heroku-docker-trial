# Heroku Docker Trial

This is a sample application for [Heroku Meetup #23 "Heroku Dynamite!!"](https://herokujp.doorkeeper.jp/events/82754).

You can run it in several ways.

## [Local Development with Docker Compose](https://devcenter.heroku.com/articles/local-development-with-docker-compose)

    $ docker-compose build
    $ docker-compose up -d
    $ open http://localhost:13000

Cleanup

    $ docker-compose down

## [Container Registry & Runtime (Docker Deploys)](https://devcenter.heroku.com/articles/container-registry-and-runtime)

    $ APP_NAME=masutaka-docker
    $ heroku container:login
    $ heroku create $APP_NAME
    $ git remote set-url heroku https://git.heroku.com/${APP_NAME}.git
    $ heroku config:set DESCRIPTION='This application is running using "heroku container:push web".'
    $ heroku container:push web
    $ heroku container:release web
    $ heroku open

Cleanup

    $ heroku destroy $APP_NAME

## [Building Docker Images with heroku.yml](https://devcenter.heroku.com/articles/build-docker-images-heroku-yml)

### without setup section

    $ APP_NAME=masutaka-heroku-yml
    $ heroku create --stack=container $APP_NAME
    $ git remote set-url heroku https://git.heroku.com/${APP_NAME}.git
    $ heroku config:set DESCRIPTION='This application is running using heroku.yml without setup section.'
    $ git push heroku master
    $ heroku open

Cleanup

    $ heroku destroy $APP_NAME

### with setup section

    $ APP_NAME=masutaka-heroku-yml-setup
    $ heroku update beta
    $ heroku plugins:install @heroku-cli/plugin-manifest
    $ sed -i '.bak' -e 's/^# //g' heroku.yml
    $ git diff
    $ git add heroku.yml
    $ git commit -m 'Enable setup section'
    $ heroku create --stack=container --manifest $APP_NAME
    $ git remote set-url heroku https://git.heroku.com/${APP_NAME}.git
    $ git push heroku master
    $ heroku open

Cleanup

    $ heroku destroy $APP_NAME
	$ heroku update stable
	$ heroku plugins:remove manifest
