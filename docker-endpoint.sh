cp -R /root/project/* /documents/
cp -R /root/project/.bundle /documents/
cd /documents
exec bundle exec asciidoctor-revealjs *.adoc
