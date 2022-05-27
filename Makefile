.PHONY: all
all:
	# TODO: implement this
	echo noop


ci: roles/*
	for dir in $^ ;\
	do $(MAKE) $(MFLAGS) -C $${dir} ci ; done
