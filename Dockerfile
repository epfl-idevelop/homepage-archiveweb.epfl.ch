# (c) ECOLE POLYTECHNIQUE FEDERALE DE LAUSANNE, Switzerland, VPSI, 2019-2020.
# See the LICENSE file for more details.

FROM httpd

ENV TZ=Europe/Zurich
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY docker/docker-archiveweb-httpd.conf /usr/local/apache2/conf/httpd.conf
COPY homepage/index.html /usr/local/apache2/htdocs/
COPY homepage/index.fr.html /usr/local/apache2/htdocs/
COPY homepage/archived-websites.js /usr/local/apache2/htdocs/

RUN apt-get update && apt-get install -y wget

COPY docker/docker-dev-init.sh /
RUN chmod 755 /docker-dev-init.sh

ENTRYPOINT /docker-dev-init.sh
