actor Test1 {
    var a = 0;

    public func add() : async Nat {
        a += 1 ;
        let temp : actor { add : () -> async Nat; } = actor("ryjl3-tyaaa-aaaaa-aaaba-cai");
        ignore await temp.add();
        assert(false);
        return a;
    };

    public query func get() : async Nat {
        return a;
    };
}