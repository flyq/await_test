// https://sdk.dfinity.org/docs/language-guide/actors-async.html#_traps_and_commit_points
actor Test1 {
    var a = 0;

    // trapped expliccitly, 失败，并且状态变量都没变化，因为没有 await，一直没提交，就不会更改。
    public func adda() : async Nat {
        a += 1 ;
        let temp : actor { add2 : () -> async Nat; add2b : () -> async Nat;} = actor("rrkah-fqaaa-aaaaa-aaaaq-cai");
        ignore temp.add2();
        assert(false);
        return a;
    };

    // trapped explicitly，失败，但是状态变量都更新了，体现为都 +1；原因是 await 前的逻辑，包括 await 调用的，都提交上去了（即已经更改），
    // 后面的 assert 在模拟执行节点就停了，后一段的逻辑没提交，不会改变状态。
    public func addb() : async Nat {
        a += 1 ;
        let temp : actor { add2 : () -> async Nat; } = actor("rrkah-fqaaa-aaaaa-aaaaq-cai");
        ignore await temp.add2();
        a += 1;
        assert(false);
        return a;
    };

    // 成功执行，都从 0，0 变成了 1，1
    public func addc() : async Nat {
        a += 1 ;
        let temp : actor { add2 : () -> async Nat; } = actor("rrkah-fqaaa-aaaaa-aaaaq-cai");
        ignore temp.add2();
        return a;
    };

    // 成功执行，本 canister 的 a 状态 +1，对方那个 canister 状态不变。因为虽然在 temp.add2b() 时，对方会 trapped
    // 但是本 canister 不会管，因为没有 await。
    public func addd() : async Nat {
        a += 1 ;
        let temp : actor { add2 : () -> async Nat; add2b : () -> async Nat;} = actor("rrkah-fqaaa-aaaaa-aaaaq-cai");
        ignore temp.add2b();
        return a;
    };

    public query func get() : async Nat {
        return a;
    };
};