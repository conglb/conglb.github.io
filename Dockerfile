FROM jekyll/jekyll:2

COPY --chown=jekyll:jekyll Gemfile .
COPY --chown=jekyll:jekyll Gemfile.lock .

RUN bundle install --quiet --clean

CMD ["jekyll", "serve"]