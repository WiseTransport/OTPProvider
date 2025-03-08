## How to Use

### First time

If using windows, first [add ssl keys](https://stackoverflow.com/questions/25951602/adding-an-ssl-certificate-to-jre-in-order-to-access-https-sites) for following domains: `download.geofabrik.de`, `gtfs.kti.hu`, `go.bkk.hu`.\
[How to download website cert](https://www.instructables.com/How-to-Download-the-SSL-Certificate-From-a-Website/)


#### Then download OTP (v2.6.0)
```bash
curl -H "Accept: application/zip" https://repo1.maven.org/maven2/org/opentripplanner/otp/2.6.0/otp-2.6.0-shaded.jar -o otp-2.6.0-shaded.jar
```

#### Build the graph

```bash
java -Xmx6G -jar otp-2.6.0-shaded.jar --build --save resources
```

Have in mind, that for building the graph you need at least 5-6gb of RAM.

### Launch

Inside your corresponding `start` file (.bat for win and .sh for linux) set `BKK_KEY` env var to your key from `opendata.bkk.hu`. (the test key for NOIT is `ac84fd0b-c679-419b-935a-831744f6728c`) 

#### Windows
```bash
start.bat
```

#### Linux
```bash
chmod +x start.sh && ./start.sh
```