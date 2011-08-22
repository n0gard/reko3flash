package {
	import flash.display.Sprite;
	public class BattleField extends Sprite {
		private var rect:Sprite;

		private function DrawRect():void {
			rect=new Sprite();
			rect.graphics.clear();
			rect.graphics.lineStyle(1,0x000000,100);
			rect.graphics.beginFill(0x6DE779,100);
			rect.graphics.drawRect(-16,-16,32,32);
			addChild(rect);
		}
		
		private function Move():void{
			this.addEventListener(MouseEvent.CLICK,loction);
			
			function loction():void{
			
		}
		}
		
		
		
		public function BattleField():void{
			DrawRect();
		}
	}
}