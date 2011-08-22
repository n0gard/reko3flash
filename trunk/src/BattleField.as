package {
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	public class BattleField extends Sprite {

		private function DrawRect():void {
			this.graphics.clear();
			this.graphics.lineStyle(1,0x000000,100);
			this.graphics.beginFill(0x6DE779,100);
			this.graphics.drawRect(-16,-16,32,32);
			this.graphics.endFill();
		}
		private function Move():void {
			this.addEventListener(MouseEvent.CLICK,loction);

			function loction():void {

			}
		}
		public function BattleField():void {
			DrawRect();
		}
	}
}