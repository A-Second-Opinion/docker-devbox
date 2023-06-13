# A Second Opinion Docker Devbox
## Built with Docker Compose

## Installation

- Clone this repository on your local computer
- Update env file and run the `docker-compose up -d`.

```shell
git clone https://github.com/A-Second-Opinion/docker-devbox.git
cd docker-devbox/
cp local.env .env
docker-compose up -d
```

Our A2O stack is now ready.




## Setup Projects

For projects like street2fleet.
Clone the repo at /docker-devbox/www/apps.
```shell
git clone git@a2opinion.git.beanstalkapp.com:/a2opinion/street2fleet.git
```

#### Connect via SSH (Web Server)

Run this in docker-devbox folder
```shell
docker-compose exec webserver bash
```

For composer installation and database migration/seeder.
Run this in webserver.
```shell
cd /var/www/apps/street2fleet
cp docker.env .env
composer update
php artisan migrate
php artisan db:seed
```

For NPM, just go to the project folder docker-devbox/www/apps/street2fleet.
Then run.
```shell
npm install
npm run build
```

Optional. Update your etc hosts.
- Windows: C:\Windows\System32\drivers\etc\hosts
- Linux: /etc/hosts

Just add this line
```shell
127.0.0.1 street2fleet.test
```


All set!! Access it via `http://street2fleet.test`.

