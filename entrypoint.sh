#!/usr/bin/env sh
set -e

# echo "→ Graph built ⇒ launching OTP API (loading /app/resources)…"
exec java -Xmx4G -jar /app/otp.jar \
     --load /app/resources
