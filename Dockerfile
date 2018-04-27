FROM python:alpine3.7
 
RUN apk add --update \
            udev \
            ttf-freefont \
            chromium \
            openssl \
            chromium-chromedriver \
            gfortran \
            gcc \
            g++
 
RUN mkdir /noto
 
ADD https://noto-website.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip /noto
 
WORKDIR /noto
 
RUN unzip NotoSansCJKjp-hinted.zip && \
    mkdir -p /usr/share/fonts/noto && \
    cp *.otf /usr/share/fonts/noto && \
    chmod 644 -R /usr/share/fonts/noto/ && \
    fc-cache -fv
 
WORKDIR /
RUN rm -rf /noto
RUN pip install --upgrade pip
 
CMD ["python3"]
