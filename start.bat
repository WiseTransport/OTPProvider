SET BKK_KEY=your-token
java -Djavax.net.ssl.trustStore="C:/Program Files/Java/jre1.8.0_51/lib/security/cacerts" -Djavax.net.ssl.trustStorePassword=changeit  -Xmx2G -jar otp-2.6.0-shaded.jar --load resources
