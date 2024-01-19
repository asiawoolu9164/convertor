extends Node
class_name Converter

# 10 -> 2
static func ConverBase10To2Base(arg: String) -> String:
	var num = arg.to_int()
	var binary = ""
	while num > 0:
		binary = str(num % 2) + binary
		num = num / 2
	return binary

# 10 -> 16
static func ConverBase10To16Base(arg: String) -> String:
	var num = arg.to_int()
	var hex = ""
	while num > 0:
		hex = str("0123456789ABCDEF"[num % 16]) + hex
		num = num / 16
	return hex

# 2 -> 10
static func ConverBase2To10Base(arg: String) -> String:
	var length = len(arg) - 1
	var decimal = 0
	for x in arg:
		var bit = x.to_int()
		decimal += (bit * (2 ** length))  
		length -= 1          
	return str(decimal)         

# 2 -> 16
static func ConverBase2To16Base(arg: String) -> String:
	var decimal = Converter.ConverBase2To10Base(arg)
	var hex = Converter.ConverBase10To16Base(decimal)
	return hex

# 16 -> 2
static func ConverBase16To2Base(arg: String) -> String:
	var decimal = Converter.ConverBase16To10Base(arg)
	var binary = Converter.ConverBase10To2Base(decimal)
	return binary

# 16 -> 10
static func ConverBase16To10Base(arg: String) -> String:
	for item in arg:
		match item:
			"a", "b", "c", "d", "e", "f", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
				print("Character is between \'a\' and \'f\'")
			_:
				return "Error! Input is not between \'a\' and \'f\'"

	var decimal =0
	var length = len(arg) - 1
	var hexToDec = {
		'0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
		'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
	}
	for i in range(0, len(arg)):
		var hex : String = arg.substr(i, 1)
		decimal += hexToDec[hex.to_upper()] * pow(16, length)  # Use pow function for non-integer exponent
		length -= 1
	return str(decimal)
