FROM amarinboonkirt/php72-fpm-stretch

WORKDIR "/var/www"

ARG DEBIAN_FRONTEND=noninteractive
ARG TZ=Asia/Bangkok
ARG LOCALE=th_TH
ARG WEB_UID=1000
ARG WEB_GID=1000

RUN sed -i "s/#\ ${LOCALE}\.UTF-8\ UTF-8/${LOCALE}.UTF-8\ UTF-8/g" /etc/locale.gen
RUN locale-gen

RUN usermod -u ${WEB_UID} www-data
RUN groupmod -g ${WEB_GID} www-data

ADD ./shell ./shell_conf
RUN cat ./shell_conf/.bashrc > /root/.bashrc
RUN cat ./shell_conf/.bashrc > /var/www/.bashrc

RUN chown -R ${WEB_GID}:${WEB_UID} /var/www

ENV LC_ALL ${LOCALE}.UTF-8
ENV TZ=${TZ}
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

CMD ["php-fpm"]