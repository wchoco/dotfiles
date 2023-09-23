source /root/.gdbinit-gef.py
source /root/tools/ctxer/gdbinit.py

python
import ctxer
main = ctxer.CTXer()
main.right(gdbcmd="ctx", title="context")
ip = main.above(cmd="ipython3", size="40%", title="ipython")
# ip.below(cmd="nc localhost 11111", size="50%")
ip.below(cmd='python3 exploit.py', size="50%", title="exploit")

m1 = main.session("monitor", title="m1", delete=False)
m3 = m1.below(size="50%", title="m3")
m1.below(size="50%", title="m2")
m3.below(size="50%", title="m4")

main.build()
end

pane set m1 i b
pane set m2 flags -v
