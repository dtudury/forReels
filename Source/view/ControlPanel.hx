package view;

import openfl.display.Sprite;
import openfl.events.MouseEvent;
import controller.ButtonLogic;
import model.Machine.Button;
import view.TileFactory;

// positioning element to hold the controls

class ControlPanel extends Sprite {
    public function new () {
        super();
        TileFactory.add_redrawer(redraw);
        redraw();
        addChild(new LinesText());
        addChild(new WagerText());
        addChild(new TotalWagerText());
        addChild(new BalanceText());
        addChild(new WinningsText());
        TileFactory.stage.addEventListener(MouseEvent.MOUSE_DOWN, handle_click);
        TileFactory.stage.addEventListener(MouseEvent.MOUSE_MOVE, handle_move);
    }
    public function redraw():Void {
        x = Std.int((TileFactory.stage.stageWidth - TileFactory.SSIZE * 4) / 2);
    }
    private function isOver(mouseEvent:MouseEvent, x:Int, y:Int, r:Int):Bool {
        var d2 = Math.pow(mouseEvent.localX - x - this.x, 2) + Math.pow(mouseEvent.localY - y, 2);
        return d2 < Math.pow(r, 2);
    }
    private function getWhichButton(mouseEvent:MouseEvent):Button {
        if (isOver(mouseEvent, 400 + 48, 400 + 48, 48)) return Button.Spin;
        if (isOver(mouseEvent, 8 + 16, 400 + 16, 16)) return Button.WagerDown;
        if (isOver(mouseEvent, 88 + 16, 400 + 16, 16)) return Button.WagerUp;
        if (isOver(mouseEvent, 136 + 16, 400 + 16, 16)) return Button.LineDown;
        if (isOver(mouseEvent, 216 + 16, 400 + 16, 16)) return Button.LineUp;
        return Button.None;
    }
    private function handle_click(mouseEvent:MouseEvent):Void {
        ButtonLogic.click(getWhichButton(mouseEvent));
    }
    private function handle_move(mouseEvent:MouseEvent):Void {
        ButtonLogic.rollover(getWhichButton(mouseEvent));
    }
}
