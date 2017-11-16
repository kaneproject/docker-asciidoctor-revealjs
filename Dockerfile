FROM asciidoctor/docker-asciidoctor

RUN gem install --no-document bundler
RUN mkdir /root/project
COPY Gemfile /root/project
WORKDIR /root/project
RUN bundle config --local github.https true
RUN bundle --path=.bundle/gems --binstubs=.bundle/.bin
RUN apk update
RUN apk add git
RUN git clone -b 3.3.0 --depth 1 https://github.com/hakimel/reveal.js.git
RUN apk del -r --no-cache
COPY docker-endpoint.sh /
RUN chmod u+x /docker-endpoint.sh
WORKDIR /documents
CMD /docker-endpoint.sh
