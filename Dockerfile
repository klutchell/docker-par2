FROM alpine
RUN apk update && \
	apk add --no-cache make g++ ca-certificates wget automake autoconf && \
	update-ca-certificates
RUN wget https://github.com/Parchive/par2cmdline/archive/v0.6.13.tar.gz && \
	tar -xzvf v0.6.13.tar.gz && \
	cd par2cmdline-0.6.13 && \
	aclocal && \
	automake --add-missing && \
	autoconf && \
	./configure && \
	make && \
	make install
ENTRYPOINT ["par2"]
