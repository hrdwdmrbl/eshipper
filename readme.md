# How to release

1. Bump the version in ./lib/eshipper/version.rb
2. Build: `$ gem build eshipper.gemspec`
3. Install: `gem install ./eshipper-X.X.X.gem`
4. Smoke test:
```
$ pry
pry > require 'eshipper'
pry > EShipper::Client.instance.username = "XXX"
pry > EShipper::Client.instance.password = "XXX"
pry > orders = EShipper::Order.search(carrierTrackingNumber: "XXX")
```
5. Push: `$ gem push eshipper-X.X.X.gem`
