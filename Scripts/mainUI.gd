extends Control
class_name MainUI


@onready var option_obtn = %option_obtn;
@onready var result_l = $MarginContainer/VBoxContainer/result_l;
@onready var input_le = %input_le;
@onready var open_btn = %openbtn;
@onready var close_btn = %exitBtn;

func _on_convert_btn_pressed():
	var opt_id : int = option_obtn.get_selected_id();
	var input :String = readInput();
	var result: String;
	print(opt_id)
	
	match opt_id:
		0: #10 -> 2
			result = Converter.ConverBase10To2Base(input);
		1: #10 -> 16
			result = Converter.ConverBase10To16Base(input)
		2: #2 -> 10
			result = Converter.ConverBase2To10Base(input);
		3: #2 -> 16
			result = Converter.ConverBase2To16Base(input);
		4: #16 -> 2
			result = Converter.ConverBase16To2Base(input);
		5: #16 -> 10
			result = Converter.ConverBase16To10Base(input);
		_:
			return;
	
	updateUI(input,result)

func readInput() -> String:
	var text = input_le.text
	return text;

func updateUI(text1: String,text2: String):
	var temp : String = "From: {a}\nTo: {b}"
	result_l.text = temp.format({"a":text1,"b":text2});


func _on_option_obtn_item_selected(index):
	input_le.clear()
	result_l.text = "Result:"


func _on_openbtn_pressed():
	close_btn.get_parent().visible = true;


func _on_exit_btn_pressed():
	close_btn.get_parent().visible = false;
