## How to Use

### First time

If using windows, first [add ssl keys](https://stackoverflow.com/questions/25951602/adding-an-ssl-certificate-to-jre-in-order-to-access-https-sites) for following domains: `download.geofabrik.de`, `gtfs.kti.hu`, `go.bkk.hu`.\
[How to download website cert](https://www.instructables.com/How-to-Download-the-SSL-Certificate-From-a-Website/)

#### Windows
```bash
download_otp.sh
```

#### Linux
```bash
chmod +x download_otp.sh && ./download_otp.sh
```

### Build the graph

```bash
java -Xmx2G -jar otp-2.6.0-shaded.jar --build --save resources
```

### Launch

Run from the root directory.

#### Windows
```bash
start.bat
```

#### Linux
```bash
chmod +x start.sh && ./start.sh
```