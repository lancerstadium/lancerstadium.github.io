# TLA

>参考资料：
>
>- [Index of /tlatoolbox/ci/products (inria.fr)](https://tla.msr-inria.inria.fr/tlatoolbox/ci/products/)
>
>- [Learn TLA+ — Learn TLA+](https://learntla.com/)



## 概念

想象一下，我们正在为一家银行构建电汇服务。用户可以向其他用户进行转移。作为一项要求，我们不允许任何会透支用户帐户或使其低于零美元的电汇：如果您尝试转移超过您拥有的金额，警卫会阻止您。

```python
def transfer(from, to, amount)
	if (from.balance >= amount) # guard
		from.balance -= amount;   # withdraw
		to.balance += amount;     # deposit
```



现在考虑两个变化：

1. 用户可以一次启动多个传输；
2. 转移步骤是非原子的。一个转移可以开始并（可能）完成，而另一个转移正在进行。



```tla
---- MODULE wire ----
(* 导入模块 *)
EXTENDS TLC, Integers

(* People 和 Money 是集合：唯一、无序 *)
People == {"alice", "bob"}
Money == 1..10
NumTransfers == 2

(* --algorithm wire

(* [People -> Money] 也是一个集合 
    变量 acct 不是一个固定值，它是 100 个不同值之一
*)
variables
    acct \in [Perople -> Money];

(* NoOverdrafts 是一个量词：
如果每个帐户都是 >= 0，则为 true，否则为 false
*)
define
    NoOverdrafts ==
        \A p \in People:
            acct[p] >= 0
end define;

(* 使用 NumTransfers == 2：
两个 wire 进程同时运行
*)
process wire \in 1..NumTransfers
variable
    amnt \in 1..5;
    from \in People;
    to \in People
begin
    Check:
        if acct[from] >= amnt then
            Withdraw:
                acct[from] := acct[from] -amnt;
            Deposit:
                acct[to] := acct[to] + amnt;
        end if;
end process;
end algorithm; *)

====
```





