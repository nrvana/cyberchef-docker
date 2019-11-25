FROM httpd

LABEL version="9.11.7"

ENV HTTPD_PREFIX /usr/local/apache2
ENV PATH $HTTPD_PREFIX/bin:$PATH

WORKDIR $HTTPD_PREFIX

RUN apt-get update && \
    apt-get install wget curl -y && \
    curl -s https://api.github.com/repos/gchq/CyberChef/releases/latest | grep "browser_download_url" | grep "htm" | cut -d : -f 2,3 | tr -d \" | wget -qi - -O /usr/local/apache2/htdocs/index.html

EXPOSE 80

CMD ["httpd-foreground"]
