package haxepunk.ui.skins;


// import flash.display.BitmapData

import haxepunk.math.Rectangle;
import haxepunk.graphics.text.TextAlignType;
import haxepunk.HXP;
import haxepunk.Graphic;
// import haxepunk.RenderMode;


import haxepunk.assets.AssetCache;
import haxepunk.graphics.atlas.AtlasData;
import haxepunk.graphics.Image;

import haxepunk.ui.skin.SkinButtonElement;
import haxepunk.ui.skin.SkinLabelElement;
import haxepunk.ui.skin.Skin;
import haxepunk.ui.skin.SkinImage;
import haxepunk.ui.skin.SkinHasLabelElement;
import haxepunk.ui.skin.SkinToggleButtonElement;
import haxepunk.ui.skin.SkinWindowElement;

@:enum
abstract ImageStyle(Int) from Int to Int
{
	var Zero = 0;
	var One = 1;
	var Two = 2;
}

/**
 * Yellow After Life skin definition
 */
class YellowAfterlife extends Skin
{
	static inline var img:String = "skins/yellowafterlife.png";

	/**
	 * Constructor.
	 * @param	roundedButtons If using rounded buttons
	 * @param	passwordField defines which image style is used for the Password Field
	 * @param	textArea defines which image style is used for the Text Area
	 * @param	textField defines which image style is used for the Text Field
	 * @param	windowCaption defines which image style is used for the Window Caption
	 * @param	windowBody defines which image style is used for the Window Body
	 */
	public function new(roundedButtons:Bool = true, passwordFieldStyle:ImageStyle = 2, textAreaStyle:ImageStyle = 0, textFieldStyle:ImageStyle = 1, windowCaptionStyle:ImageStyle = 0, windowBodyStyle:ImageStyle = 0)
	{
		super();

		var by:Int = (roundedButtons) ? 16:0;
		button = new SkinButtonElement(gy(0, by), gy(16, by), gy(32, by), gy(16, by), {
			color:0xFF3366,
			size:16,
		});

		toggleButton = new SkinToggleButtonElement(gn(0, 64), gn(16, 64), gn(32, 64), gn(16, 64), gn(0, 80), gn(16, 80), gn(32, 80), gn(16, 80), {
			color:0xFF3366,
			size:16,
			x:16,
		});
		radioButton = new SkinToggleButtonElement(gn(0, 96), gn(16, 96), gn(32, 96), gn(16, 96), gn(0, 112), gn(16, 112), gn(32, 112), gn(16, 112), {
			color:0xFF3366,
			size:16,
			x:16,
		});

		label = new SkinHasLabelElement({
			color:0xFF3366,
			size:16,
		});
		textArea = new SkinLabelElement({
			color:0xFF3366,
			size:16,
		}, gy(64 + (16 * textAreaStyle), 0));
		textField = new SkinLabelElement({
			color:0xFF3366,
			size:16,
		}, gy(64 + (16 * textFieldStyle), 16));
		passwordField = new SkinLabelElement({
			color:0xFF3366,
			size:16,
		}, gy(16 * passwordFieldStyle, 48));

		window = new SkinWindowElement(gy(64 + (16 * windowCaptionStyle), 33, 16, 15), gy(64 + (16 * windowBodyStyle), 47, 16, 17), {
			color:0xFF3366,
			size:16,
			x:2,
			y:-1,
		});
	}

	/**
	 * Returns the portion of the skin image as a SkinImage object in a 9-Slice format
	 * @param	x X-Coordinate for the image offset
	 * @param	y Y-Coordinate for the image offset
	 * @param	w Width of the image sub-section
	 * @param	h Height of the image sub-section
	 * @return SkinImage for the image sub-section requested in 9-Slice format
	 */
	function gy(x:Int, y:Int, w:Int = 16, h:Int = 16):SkinImage
	{
		return new SkinImage(gi(x, y, w, h), true, 4, 4, 4, 4);
	}

	/**
	 * Returns the portion of the skin image as a SkinImage object in a non 9-Sliced format
	 * @param	x X-Coordinate for the image offset
	 * @param	y Y-Coordinate for the image offset
	 * @param	w Width of the image sub-section
	 * @param	h Height of the image sub-section
	 * @return SkinImage for the image sub-section requested in a non 9-Sliced format
	 */
	function gn(x:Int, y:Int, w:Int = 16, h:Int = 16):SkinImage
	{
		return new SkinImage(gi(x, y, w, h), false);
	}

	/**
	 * Returns the portion of the skin image requested as a BitmapData object
	 * @param	x X-Coordinate for the image offset
	 * @param	y Y-Coordinate for the image offset
	 * @param	w Width of the image sub-section
	 * @param	h Height of the image sub-section
	 * @return ImageType for the image sub-section requested
	 */
	function gi(x:Int, y:Int, w:Int = 16, h:Int = 16):ImageType
	{
		_r.x = x;
		_r.y = y;
		_r.width = w;
		_r.height = h;

		// if (HXP.renderMode == RenderMode.BUFFER)
		// {
		// 	var b:BitmapData = new BitmapData(w, h, true, 0);
		// 	b.copyPixels(openfl.Assets.getBitmapData(img), _r, HXP.zero, null, null, true);
		// 	return b;
		// }
		// else
		// {
			// return AtlasData.getAtlasDataByName(img, true).createRegion(_r);
			return AssetCache.global.getAtlasData(img, true).createRegion(_r);
		// }
	}

	var _r:Rectangle = new Rectangle();
}
