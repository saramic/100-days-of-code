# Sidekiq Status

## TL;DR

Setup

```bash
make setup        # setup .session.key
make sidekiq-web  # run sidekiq web
make sidekiq      # run sidekiq

open http://localhost:9292
```

Run a long running job demo

```bash
make demo
make demo duration=15
```

in log or the sidekiq web you will see

```log
... tid=jkd class=Jobs::LongSteadyJob jid=92aab9af95b325593c0f2667 INFO: start
... tid=jdp class=Jobs::LongSteadyJob jid=ef7e01f1a2fe971132f7723a INFO: start
... tid=jdp class=Jobs::LongSteadyJob jid=ef7e01f1a2fe971132f7723a elapsed=15.042 INFO: done
... tid=jmp class=Jobs::LongSteadyJob jid=a3ceb16ef536326bbf171b51 elapsed=59.208 INFO: done
... tid=jkd class=Jobs::LongSteadyJob jid=92aab9af95b325593c0f2667 elapsed=59.215 INFO: done
```

where `make demo` is the `tid=jkd` finishing in 59.215 seconds and `make demo
duration=15` is the `tid=jdp` finishing in 15.042 seconds
