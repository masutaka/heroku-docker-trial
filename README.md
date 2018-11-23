# Heroku Docker Trial

You can run this sample application in several ways.

## [Local Development with Docker Compose](https://devcenter.heroku.com/articles/local-development-with-docker-compose)

    $ docker-compose build
    $ docker-compose up
    $ open http://0.0.0.0:10080

## [Container Registry & Runtime (Docker Deploys)](https://devcenter.heroku.com/articles/container-registry-and-runtime)

    $ APP_NAME=masutaka-docker
    $ heroku container:login
    $ heroku create $APP_NAME
    $ heroku config:set DESCRIPTION='This application is running using "heroku container:push".'
    $ heroku container:push web
    $ heroku container:release web
    $ heroku open

Cleanup

    $ heroku destroy $APP_NAME

## [Building Docker Images with heroku.yml](https://devcenter.heroku.com/articles/build-docker-images-heroku-yml)

### without setup section

    $ APP_NAME=masutaka-heroku-yml
    $ heroku create $APP_NAME
    $ heroku config:set DESCRIPTION='This application is running using heroku.yml without setup section.'
    $ heroku stack:set container
    $ git push heroku master
    $ heroku open

Cleanup

    $ heroku destroy $APP_NAME

### with setup section

    $ APP_NAME=masutaka-heroku-yml-setup
    $ heroku update beta
    $ heroku plugins:install @heroku-cli/plugin-manifest
    $ heroku create $APP_NAME
    $ heroku stack:set container
    $ sed -i '.bak' -e 's/^# //g' heroku.yml
    $ git add heroku.yml
    $ git commit -m 'Enable setup section'
    $ git push heroku master
    $ heroku open

Cleanup

    $ heroku destroy $APP_NAME
	$ heroku update stable
	$ heroku plugins:remove manifest
