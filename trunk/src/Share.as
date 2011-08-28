package {
	public class Share {
		public static  var battleObj:Array=new Array;
		public static  var fang:Fang;

		// 根據座標返回BF
		public static function getBF(mousex:int,mousey:int):BattleField {
			trace("mouseX is " + mousex);
			trace("mouseY is " + mousey);
			trace("you have choose battleObj [" + int(mousex / 32 * 24 + mousey / 32) + "]");
			return battleObj[int(mousex / 32 * 24 + mousey / 32)];
		}
		public static function setVisible(bool:Boolean):void {
			for (var i=0; i < battleObj.length; i++) {
				Share.battleObj[i].visible=bool;
			}
		}
	}
}