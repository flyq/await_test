actor Test2 {
    var a = 0;

    public func add2() : async Nat {
        a += 1;
        return a;
    };

    public func add2b() : async Nat {
        a += 1;
        assert(false);
        return a;
    };

    public query func get() : async Nat {
        return a;
    };
};