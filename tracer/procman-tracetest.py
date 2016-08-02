#!/usr/bin/env python
# FIXME: ptrace not packaged for python3

import ptrace.debugger
import sys

if len(sys.argv) != 2:
	print >>sys.stderr, "Syntax: tracer <pid>"
	sys.exit(1)
pid = int(sys.argv[1])

debugger = ptrace.debugger.PtraceDebugger()
debugger.traceFork()
process = debugger.addProcess(pid, False)

proclist = [process]
while True:
	print proclist
	for p in proclist[:]:
		#process.singleStep()
		try:
			p.cont()
		except:
			print p, "br0ke"
			#proclist.remove(p)
			pass
	# FIXME: difference between those two not clear
	event = debugger.waitProcessEvent()
	#event = process.waitEvent()
	print event, type(event)
	if type(event) == ptrace.debugger.process_event.NewProcessEvent:
		proclist.append(event.process)

# FIXME: since traceFork() was added, this tracer regularly just hangs
