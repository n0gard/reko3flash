package {
	public class Share {
		public static  var battleObj:Array=new Array();

		// 根據座標返回BF
		public function getBF(mousex:int,mousey:int):Array {
			return battleObj[mousex / 32 * 24 + mousey / 32];
		}
	}
}