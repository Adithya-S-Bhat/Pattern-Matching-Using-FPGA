regex.vcd: regex
	vvp regex

regex: regex.v tb_regex.v lib.v
	iverilog $^ -o $@

clean:
	${RM} regex *.vcd

.PHONY: clean
