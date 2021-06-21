# test_await
```
sudo dfx canister --no-wallet create --all
Creating canister "test1"...
"test1" canister was already created and has canister id: "rrkah-fqaaa-aaaaa-aaaaq-cai"
Creating canister "test2"...
"test2" canister was already created and has canister id: "ryjl3-tyaaa-aaaaa-aaaba-cai"


sudo dfx build
Building canisters...

sudo dfx canister --no-wallet install --all
Creating UI canister on the local network.
The UI canister on the "local" network is "rkp4c-7iaaa-aaaaa-aaaca-cai"
Installing code for canister test1, with canister_id rrkah-fqaaa-aaaaa-aaaaq-cai
Installing code for canister test2, with canister_id ryjl3-tyaaa-aaaaa-aaaba-cai

sudo dfx canister --no-wallet call test1 get
(0)

sudo dfx canister --no-wallet call test2 get
(0)

sudo dfx canister --no-wallet call test1 add
The Replica returned an error: code 5, message: "Canister rrkah-fqaaa-aaaaa-aaaaq-cai trapped explicitly: assertion failed at /Users/flyq/workspace/test/test_await/src/main1.mo:8.9-8.22"

sudo dfx canister --no-wallet call test1 get
(1)

sudo dfx canister --no-wallet call test2 get
(1)
```

