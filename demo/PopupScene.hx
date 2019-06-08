import haxepunk.Scene;

import haxepunk.HXP;
import haxepunk.ui.Button;
import haxepunk.ui.layout.LayoutGroup;
import haxepunk.ui.MouseManager;

class PopupScene extends Scene
{
	public function new()
	{
		super();

		bgAlpha = 0.55;

		var mouseManager = new MouseManager();
		add(mouseManager);

		var parentLayout = new LayoutGroup(LayoutType.Horizontal);
		parentLayout.layoutData.anchorX = parentLayout.layoutData.anchorY = 0.25;
		// parentLayout.layoutData.offsetX = parentLayout.layoutData.offsetY = -256/2;
		
		var btn = new Button(0, 0, 256, 256, "Go Back", function() HXP.engine.popScene(), mouseManager);
		parentLayout.add(btn);
		
		add(parentLayout);
	}
}
