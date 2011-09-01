package {
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import fl.motion.Color;
	import flash.text.TextField;
	import flash.text.TextFormat;

	public class BattleField extends Sprite {
		private var consumeAbility:int;

		private function DrawRect():void {
			this.graphics.clear();
			this.graphics.lineStyle(0,0x000000,0);
			// this.graphics.beginFill(0x6DE779,100);
			this.graphics.beginFill(0x000000,0.5);
			this.graphics.drawRect(0,0,32,32);
			this.graphics.endFill();
			this.addEventListener(MouseEvent.CLICK,showProperties);
		}
		// 变黑
		public function turnToDark():void {
			trace("turnToDark Ok");
			this.graphics.clear();
			// this.graphics.lineStyle(1,0x000000,1);
			// this.graphics.beginFill(0x6DE779,100);
			this.graphics.beginFill(0xffffff,0.5);
			this.graphics.drawRect(0,0,32,32);
			this.graphics.endFill();
			this.addEventListener(MouseEvent.CLICK,callErr);
		}
		// 变亮
		public function turnToBright():void {
			trace("turnToBright Ok");
			this.graphics.clear();
			// this.graphics.lineStyle(1,0x000000,1);
			// this.graphics.beginFill(0x6DE779,100);
			this.graphics.beginFill(0x000000,0);
			this.graphics.drawRect(0,0,32,32);
			this.graphics.endFill();
			this.addEventListener(MouseEvent.CLICK,loction);
		}
		// 恢復
		public function restore():void{
			DrawRect();
			}
		// 某Fang移动到此BF上时
		private function loction(e:MouseEvent):void {
			Share.setVisible(false);
			Share.fang.restoreAllBright();
			Share.fang.locate(this.x,this.y);
		}
		// 报错
		private function callErr(e:MouseEvent):void {
			trace("您不该点这里 您无法移动到这里滴...");
		}
		// 显示自身属性
		private function showProperties(e:MouseEvent):void {
			trace("showProperties Click Ok");
			trace("x -- " + this.x + " y -- " + this.y);
			trace("下标 -- " + (this.x / 32 + this.y / 32 * 24 - 1));
			var textField:TextField=new TextField;
			var textFormat:TextFormat=new TextFormat;
			//textFormat.font="宋体";
			textFormat.size=12;
			textFormat.color=0xFFFFFF;
			textField.setTextFormat(textFormat);
			textField.text=this.x + "\n" + this.y;
			addChild(textField);
		}
		// 构造
		public function BattleField():void {
			DrawRect();
			consumeAbility=1;
		}
		// 获得此块BF的行动力消耗
		public function getConsumeAbility():int {
			return consumeAbility;
		}
	}
}