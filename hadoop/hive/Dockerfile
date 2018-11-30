FROM openjdk:8-jre

# Version
ENV HIVE_VERSION=2.8.3

# Set home
ENV HIVE_HOME=/usr/local/hive-$HIVE_VERSION

# Install dependencies
RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install \
    -yq --no-install-recommends netcat procps \
  && apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

# Install hive
RUN mkdir -p "${HIVE_HOME}" \
  && export ARCHIVE=hive-$HIVE_VERSION.tar.gz \
  && export DOWNLOAD_PATH=apache/hive/common/hive-$HADOOP_VERSION/$ARCHIVE \
  && curl -sSL https://mirrors.ocf.berkeley.edu/$DOWNLOAD_PATH | \
    tar -xz -C $HIVE_HOME --strip-components 1 \
  && rm -rf $ARCHIVE

# HDFS volume
VOLUME /opt/hdfs

# HDFS
EXPOSE 8020 9000 14000 50010 50020 50070 50075 50090 50470 50475
