FROM ruby:2.5.5-alpine

RUN apk update && apk add \
    qt5-qtbase-dev \
    fftw-dev \
    cmake \
    pkgconfig \
    build-base \
    gcc \
    g++ \
    git \
    make \
    automake \
    autoconf \
    nodejs \
    tzdata

WORKDIR /opt/liquid

RUN git clone https://github.com/jgaeddert/liquid-dsp.git . && \
    sh ./bootstrap.sh && \
    sh ./configure --prefix=/usr && \
    make && \
    make install

WORKDIR /opt/inpsectrum

RUN git clone https://github.com/miek/inspectrum . && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    make install

WORKDIR /opt/DSpectrumGUI

COPY . .

RUN gem install nokogiri -v '1.10.3' &&\
    gem install bundler && \
    bundle config build.nokogiri --use-system-libraries && \
    bundle && \
    rake db:setup && rake db:migrate && rake db:seed

EXPOSE 3001

CMD rails s -p 3001 --binding 0.0.0.0