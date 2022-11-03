# Web Scraper Jobs

use Sidekiq Jobs to perform distributed scraping of a site

```
make

make sidekiq-web
open http://localhost:9292

make sidekiq

make demo processor=Processors::BsbNumbers
```

## TODO

- [ ] throttle requests
- [ ] cache requests that have already happend
- [ ] store the output in a log or some kind of JSON data store