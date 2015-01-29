# CHANGELOG

## master

## v0.3.0

Improvement

* Handle malformed response from Apple's server.
* Remove external dependencies (Oj and HTTPClient).

## v0.2.0

Fix

* Fixes OpenSSL::SSL::SSLError [#1](https://github.com/linjunpop/iap_verifier/pull/1)

Improvement

* curb is not thread-safe, [httpclient](https://github.com/nahi/httpclient) does.

## v0.1.0

Improvement

* Use [oj](https://github.com/ohler55/oj) to load JSON.
* Use [curb](https://github.com/taf2/curb) as http client.
* Support ruby 1.9 & 2.0.

## v0.0.1

* Initial release.
