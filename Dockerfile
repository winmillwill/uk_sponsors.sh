FROM gliderlabs/alpine
RUN wget \
http://sourceforge.net/projects/videlibri/files/Xidel/Xidel%200.8.4/xidel-0.8.4.linux64.tar.gz/download \
  -O - | tar -xz \
  && mv /xidel /bin
RUN mkdir /lib64 && ln -s /lib/ld-musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
RUN apk update && apk add make g++ ca-certificates wget bash openssl-dev
RUN wget \
http://downloads.sourceforge.net/project/pdftohtml/Experimental%20Versions/pdftohtml%200.40/pdftohtml-0.40a.tar.gz \
  -O - | tar -xz \
  && cd pdftohtml-0.40a && sed -i -e 's:sys/\(unistd\):\1:' src/HtmlLinks.h && make && cp src/pdftohtml /bin
ADD uk_sponsors.sh /uk_sponsors.sh
CMD ./uk_sponsors.sh
