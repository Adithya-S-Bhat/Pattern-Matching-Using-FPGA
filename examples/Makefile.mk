all: zero_bar_one zero_dot_one one_star zero_bar_one_star_zero_dot_one

zero_bar_one_star_zero_dot_one: zero_bar_one_star_zero_dot_one.v tb_regex.v lib.v
	iverilog $^ -o $@

zero_bar_one: zero_bar_one.v tb_regex.v lib.v
	iverilog $^ -o $@

zero_dot_one: zero_dot_one.v tb_regex.v lib.v
	iverilog $^ -o $@

one_star: one_star.v tb_regex.v lib.v
	iverilog $^ -o $@

clean:
	${RM} zero_bar_one zero_dot_one one_star zero_bar_one_star_zero_dot_one *.vcd

.PHONY: all clean
