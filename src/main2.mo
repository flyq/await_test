actor Test2 {
    var a = 0;

    public func add2() : async Nat {
        a += 1;
        return a;
    };

    public query func get() : async Nat {
        return a;
    };
};