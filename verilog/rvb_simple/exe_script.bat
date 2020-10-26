rem 若没有设置路径到PATH则关闭以下注释
 set iverilog_path=D:\software\iverilog\bin;
 set gtkwave_path=D:\software\iverilog\gtkwave\bin;
 set path=%iverilog_path%%gtkwave_path%%path%

set testbentch_module=shift_test

set source_module=rvb_simple
set testbentch_module=testbench

iverilog -o "%testbentch_module%.vvp" -s testbench -DTESTDATA='"testdata_0.hex"' -DENABLE_64BIT %source_module%.v %testbentch_module%.v
vvp -n "%testbentch_module%.vvp"

set gtkw_file="%testbentch_module%.gtkw"
if exist %gtkw_file% (gtkwave %gtkw_file%) else (gtkwave "%testbentch_module%.vcd")

pause



