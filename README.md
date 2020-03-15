# ASCAPI

A description of this package.
# ASCAPI

## Example Swift
```
import OpenCombine

var bag = [AnyCancellable]()

ASCAPI.instance
    .configure()
    .fetch(route: .apps)
    .value { print("\($0)") }
    .store(in: &bag)
```

## Example CURL
```
curl -v -H 'Authorization: Bearer <TOKEN>' "https://api.appstoreconnect.apple.com/v1/apps"
```