# Stage 1: fetch & build graph
FROM openjdk:21-jdk-slim AS builder
WORKDIR /build

# BKK_KEY is needed by the otp build
ARG BKK_KEY

# download curl
RUN apt update && apt upgrade -y && apt install -y curl

# download OTP jar
ARG OTP_VERSION=2.6.0
RUN curl -fSL \
      "https://repo1.maven.org/maven2/org/opentripplanner/otp/${OTP_VERSION}/otp-${OTP_VERSION}-shaded.jar" \
      -o otp.jar

# copy resources & build graph
COPY resources/ /build/resources/
RUN java -Xmx10G -jar otp.jar \
      --build \
      --save /build/resources

# Stage 2: runtime
FROM eclipse-temurin:21-jre
WORKDIR /app

# copy only built graph + jar
COPY --from=builder /build/otp.jar    /app/otp.jar
COPY --from=builder /build/resources/ /app/resources/

# use a non-root user
RUN addgroup --system otp && adduser --system --ingroup otp otp
USER otp

EXPOSE 8080
ENTRYPOINT ["java","-Xmx4G","-jar","/app/otp.jar","--load","/app/resources"]
