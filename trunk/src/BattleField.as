package {
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import fl.motion.Color;

	public class BattleField extends Sprite {

		private function DrawRect():void {
			this.graphics.clear();
			this.graphics.lineStyle(1,0x000000,100);
			// this.graphics.beginFill(0x6DE779,100);
			this.graphics.beginFill(0x000000,0);
			this.graphics.drawRect(0,0,32,32);
			this.graphics.endFill();
		}
		public function turnToDark():void {
			trace("turnToDark Ok");
			var color:Color=new Color();
			color.brightness = 0;
			this.transform.colorTransform = color;
		}
		private function Move():void {
			this.addEventListener(MouseEvent.CLICK,loction);
		}
		private function loction(e:MouseEvent):void {
			trace("loction Click Ok");
			var color:Color=new Color();
			color.brightness = 0;
			this.transform.colorTransform = color;
		}
		private function showProperties(e:MouseEvent):void {
			trace("showProperties Click Ok");
			var color:Color=new Color();
			color.brightness = 1;
			this.transform.colorTransform = color;
		}
		public function BattleField():void {
			DrawRect();
			this.addEventListener(MouseEvent.CLICK,showProperties);
		}
	}
}