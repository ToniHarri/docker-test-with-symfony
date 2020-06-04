# Simple Docker test project with Symfony framework

Simple test project to test out docker functionality. Includes Nginx,
Php7.2-fpm, MariaDb10.5, PhpMyadmin, and a mailcatcher.

Goal of this little setup was to learn and understand the Docker environment a
bit better. Idea was to have a somewhat common project setup running inside
docker in a controlled environment. Nginx to run the web content, php for the
business logic, database to store and fetch data, and phpmyadmin to visually
inspect the database.
Also as a cherry on top, a mailcatcher to peek at the sent emails. Note that you
can see the sent emails in the debug toolbar, and at the time of writing this,
the web profiler intercept_redirects is on, which means that you will always see
the emails, even if you redirect after sending it. But the mailcatcher was just
a neat experiment.

Docker ports are configured in a way that they shouldn't conflict with your
local ports if you have for instance Nginx already running in the background.

---

:bangbang:

IMPORTANT NOTE:

DO NOT USE THIS IN PRODUCTION! IT'S NOT SAFE!

:bangbang:

---

FUTURE TODO:
- Php-fpm via unix socket instead of tcp port.
- Webpack and NPM for front development.
