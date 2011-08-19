package {
	import flash.display.MovieClip;
	import flash.net.URLRequest;
	import flash.display.Loader;
	//import fl.transitions.Tween;
	//import fl.transitions.easing.*;


	public class Yuan extends MovieClip {
		private var arrayA:Array=new Array();
		private var arrayB:Array=new Array();
		private var picUrlA:URLRequest=new URLRequest();
		private var picUrlB:URLRequest=new URLRequest();
		private var loadPicA:Loader=new Loader();
		private var loadPicB:Loader=new Loader();

		private function pushArray(i:int):void {
			for (var j:int=0; j<=i; j++) {
				arrayA[j]="战场可移动单位已拆分/test_"+String(j+1)+"-1a.png";
				arrayB[j]="战场可移动单位已拆分/test_"+String(j+1)+"-1b.png";
			}
		}
		public function Yuan(zx:int) {
			pushArray(46);
			picUrlA.url=arrayA[zx];
			picUrlB.url=arrayB[zx];
			loadPicA.load(picUrlA);
			loadPicB.load(picUrlB);
			//var tweenA:Tween=new Tween(loadPicA,"x",Elastic.easeIn,100,200,10,false);
			addChild(loadPicA);
			this.gotoAndPlay(6);
			addChild(loadPicB);
			this.gotoAndPlay(1);
		}

	}
}