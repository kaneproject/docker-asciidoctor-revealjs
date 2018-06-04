FROM asciidoctor/docker-asciidoctor
RUN gem install mathematical
RUN gem install asciidoctor-mathematical
RUN gem install --no-document bundler
RUN mkdir /root/project
COPY Gemfile /root/project
WORKDIR /root/project
RUN bundle config --local github.https true
RUN bundle --path=.bundle/gems --binstubs=.bundle/.bin
RUN apk update && \
    apk add git && \
    git clone -b 3.3.0 --depth 1 https://github.com/hakimel/reveal.js.git && \
    apk del -r --no-cache
COPY docker-endpoint.sh /
RUN chmod u+x /docker-endpoint.sh
WORKDIR /documents
CMD /docker-endpoint.sh
