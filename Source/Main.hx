package;

import openfl.display.FPS;
import openfl.display.Sprite;
import display.ReelBlurs;
import display.ControlPanel;


class Main extends Sprite {

	public function new () {
		super ();
        stage.frameRate = 60;
        addChild (new ReelBlurs(stage));
        addChild (new ControlPanel());
        addChild (new FPS());
	}
}
