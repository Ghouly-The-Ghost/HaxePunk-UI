package haxepunk.ui;

import haxepunk.graphics.text.TextOptions;

typedef LabelOptions =
{
	> TextOptions,
	@:optional var x:Float;
	@:optional var y:Float;
	@:optional var width:Float;
	@:optional var height:Float;
}
