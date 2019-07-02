hugo --baseURL http://bluedskim.github.io
cp ../bluedskim.github.io/sitemap.xml ./
hugo
mv ./sitemap.xml ../bluedskim.github.io
