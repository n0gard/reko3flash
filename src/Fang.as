package {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.net.URLRequest;
	import flash.display.Loader;
	import fl.transitions.Tween;
	import fl.transitions.easing.*;
	import flash.display.Bitmap;
	import flash.display.BitmapData;


	public class Fang extends Sprite {
		private var arrayA:Array;
		private var arrayB:Array;
		private var picUrlA:URLRequest;
		private var picUrlB:URLRequest;
		private var loadPicA:Loader;
		private var loadPicB:Loader;
		private var fangM:Sprite;



		private function pushArray(i:int):void {
			arrayA=new Array();
			arrayB=new Array();
			for (var j:int=0; j<=46; j++) {
				arrayA[j]="战场可移动单位已拆分/test_"+String(j+1)+"-1a.png";
				arrayB[j]="战场可移动单位已拆分/test_"+String(j+1)+"-1b.png";
			}
			picUrlA=new URLRequest();
			picUrlB=new URLRequest();
			picUrlA.url=arrayA[i];
			picUrlB.url=arrayB[i];
		}
		private function loadpic():void {
			loadPicA=new Loader();
			loadPicB=new Loader();
			loadPicA.load(picUrlA);
			loadPicB.load(picUrlB);
			
			fangM=new Sprite;
			fangM.addChild(loadPicA);
			fangM.addChild(loadPicB);
		}
		public function Fang(zx:int) {
			pushArray(zx);
			loadpic();
		}
	}
}