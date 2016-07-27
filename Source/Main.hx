package;

import openfl.display.FPS;
import openfl.display.Sprite;
import view.TileFactory;
import view.Reels;
import view.ReelBlurs;
import view.ControlPanel;
import view.ControlPanelArt;
import view.Gutters;
import view.RedHand;

class Main extends Sprite {

    public function new () {
        super();
        stage.frameRate = 60;
        TileFactory.init(stage);
        addChild(TileFactory.tilemap);
        new ReelBlurs();
        new Reels();
        new ControlPanelArt();
        new RedHand();
        new Gutters();
        addChild(new ControlPanel());
        addChild(new FPS());
    }
}
