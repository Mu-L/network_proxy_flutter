import 'dart:io';

import 'package:basic_utils/basic_utils.dart';

void main() {
  String privateKey = """-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAlCIfnwcgTVYKHAMyFbUhFogR+R9S8g3wh12zbc/9vcZN7dM7
aZdYrpatdqRl7fbfExumHOdSGthy/8KPGr8D3r1u5xbanUpOXkvpsJrB2Urf01pK
7Ei9SBOv+JZKRTnA1C689BrJQCXnFbHTKoM9XVAhoOaJSqxB6HVePjV3h405C5pj
N/g0/7HE2YGHVDQhSTEaIsQtyz5eNVijXmLfq/qBA/9HdMKAslkYszaxy1gwz5iW
1i0PFjXFL6PygsLVPUgAAVr/k7T4XuX0UY78OKLyiL93Q4JhwrE5KMSeWx6P+usb
ymEHhv6rfZH2/Hh+SAsmUE+qSDmAwZePk+TvVQIDAQABAoIBACZgrNaTjw/aMaZO
QaSUF61xtU5YijHB4MYBRaI2l6OaA8iQyDy0BDq/ONObBflf0y1tJV0ppQDlgO24
J0EjqcoEQ/5E0oCbprARdMrXXU+BcXmdU/nhYoCQ8S8zKKzEqKuQLE4FvowLBdJ+
DppeBADv6LZ546nf9PdXqQHu8jfAvrrtlC88wBJ6EaHY7vV/iFI5pQXTHpLjwzGz
GsuAktXFa7ZRmuWyV9Wq5b7Du8OdVlkGjs/i5e6aipVfUH1KywIEC7W0KXTQk3+K
gPP48OW4Qp489S5Ou9ypdEKMU3ZJWJqVPlEa1ocQIDSFS5pmXMXnOmcu/bG+nCFC
G7tGu+UCgYEAy+lQaROz9cLDtWgYDGDT40KjHl7HK32tM15k3XEt/S6e8F6ozk2p
BN5i2RHoB7dqscZMtGsJLDEYApNB2O5nbl8OhEdKA8eQsQHdnWjnMtkhIYyFNWfS
cjJeRklhgkvDDpZYkcETTHv8Z+7j6PZMAarIPpmEXt127LgturzHK2MCgYEAufk6
ec4hTtMdQEe24DBygPkfAnuo3u5gyFTreRzn9Fnr/A+/6BaKd1HVHf9WjpYetagM
XZg2Bve+rdID5eo/vsmc5J/ZPWZWmkHogOhLj1Cfjx6UlHankLSgMREp/v8bWkC8
UgDXxS0x1EaplwmYzPFku/u1Csiz/DV3U2y84+cCgYEAxiYqSoGn/ejOj4jg3Z52
KMBHjKqjNsMAvQs8Tue9vetA7em+dgOHfECyo6e/50e4OZquTSA6IKRwZYg9k5VQ
EzPyAl7YMMYL98YNWfpnuMTAaj6H77a9DNWfQQPr6la+7HzzAmgx3cAaLdE5zdcR
UwlnX1WFCT6CY1Qys+TgUmsCgYEArT8b1nTMWp4Y1dT47Ai14qgw1yNTwbnXt0hE
xGLFQsCyMfKKGC9HdrhpDLTdcZ8vpJKUUmyFiCArJcpLj1eVYqp22hR/T8+SRcm4
Sr4cBbpZqf4W8+dFWmyp/ou6z63fUUiVJt9aInljvhjFy8pI6kLGUMi/cvhdk0pL
iw/1N2kCgYBk7YjhJmJ7BKvCqePlqKrb1x6u87Fjd9h5ESpCQo5YQtBfNnVsuvql
WFcIz87DXjxSZxwytAEzwN32pzL/dX0EcCyHHmjBxYV2yt0hZ+KGW3bzIc5tWJzB
imLV4LxA95UoKv+Y00uCXPuxQAQUpQd/ABXG8DBScUi3aO3O5osuJg==
-----END RSA PRIVATE KEY-----
""";

  String certificate = """-----BEGIN CERTIFICATE-----
MIIEQzCCAyugAwIBAgIQw/uIMhw3sMSX9DSQTZXJjDANBgkqhkiG9w0BAQsFADCB
nzEzMDEGA1UEAxMqUHJveHltYW4gUm9vdCBDQSAoSnVsIDE5IDIwMjQsIHdhbmdo
b25nZW4pMQswCQYDVQQGEwJVUzERMA8GA1UECBMIRGVsYXdhcmUxEzARBgNVBAcT
CldpbG1pbmd0b24xFTATBgNVBAoTDFByb3h5bWFuIExMQzEcMBoGA1UECxMTaHR0
cHM6Ly9wcm94eW1hbi5pbzAeFw0yNDA3MTgxNDM0MTNaFw0yNjA3MTkxNDM0MTNa
MIGfMTMwMQYDVQQDEypQcm94eW1hbiBSb290IENBIChKdWwgMTkgMjAyNCwgd2Fu
Z2hvbmdlbikxCzAJBgNVBAYTAlVTMREwDwYDVQQIEwhEZWxhd2FyZTETMBEGA1UE
BxMKV2lsbWluZ3RvbjEVMBMGA1UEChMMUHJveHltYW4gTExDMRwwGgYDVQQLExNo
dHRwczovL3Byb3h5bWFuLmlvMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAlCIfnwcgTVYKHAMyFbUhFogR+R9S8g3wh12zbc/9vcZN7dM7aZdYrpatdqRl
7fbfExumHOdSGthy/8KPGr8D3r1u5xbanUpOXkvpsJrB2Urf01pK7Ei9SBOv+JZK
RTnA1C689BrJQCXnFbHTKoM9XVAhoOaJSqxB6HVePjV3h405C5pjN/g0/7HE2YGH
VDQhSTEaIsQtyz5eNVijXmLfq/qBA/9HdMKAslkYszaxy1gwz5iW1i0PFjXFL6Py
gsLVPUgAAVr/k7T4XuX0UY78OKLyiL93Q4JhwrE5KMSeWx6P+usbymEHhv6rfZH2
/Hh+SAsmUE+qSDmAwZePk+TvVQIDAQABo3kwdzAMBgNVHRMEBTADAQH/MAsGA1Ud
DwQEAwIC9DA7BgNVHSUENDAyBggrBgEFBQcDAQYIKwYBBQUHAwIGCCsGAQUFBwMD
BggrBgEFBQcDBAYIKwYBBQUHAwgwHQYDVR0OBBYEFNXT15qqJC05+DUPrS5GFkaj
MJwtMA0GCSqGSIb3DQEBCwUAA4IBAQAHpplrxc222BtIT2X3jRqOvMpJR1vIyjOg
4pkJ6yMWPLJh0xVc9OI3YDNVrt1DKmHhFH4QivKFfhOp+WVREEcv1uthwxUI5yqC
ub/i17aFUzZLj5RpU76ijt08SRAq+VZ7JxD0ksLUV8uHdnwKY7hvGxsg16XifxdM
M4pLD1D+DIuIAtMTs0YYE+WKXXnzNTh3pzx0mq061BTFV9tUQz5G2SVuJfOXwAje
cQKEbRl0N5sre8QfEj93yPvzvvtZZl4Q+GgLFkhkRF8/1QbRljo6AX5R4bkur/SM
e13IfQ29+2KHNtz43MoJfNeixUqdD2dW+lmOeh5dxqOdAR/NvIy4
-----END CERTIFICATE-----""";
  var p12Bytes = Pkcs12Utils.generatePkcs12(privateKey, [certificate], password: '123');
  File('server.p12').writeAsBytesSync(p12Bytes);

  var decodePkcs12 = Pkcs12Utils.parsePkcs12(p12Bytes, password: '123');

  print(decodePkcs12[0]);
  var rsaPrivateKeyFromPem = CryptoUtils.rsaPrivateKeyFromPem(decodePkcs12[0]);
  print(rsaPrivateKeyFromPem);
  print(CryptoUtils.encodeRSAPrivateKeyToPemPkcs1(rsaPrivateKeyFromPem));
  print(CryptoUtils.encodeRSAPrivateKeyToPem(rsaPrivateKeyFromPem));
}
