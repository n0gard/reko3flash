package {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.net.URLRequest;
	import flash.display.Loader;
	import fl.transitions.Tween;
	import fl.transitions.easing.*;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.utils.Timer;
	import flash.events.TimerEvent;


	public class Fang extends Sprite {
		private var arrayA:Array;
		private var arrayB:Array;
		private var picUrlA:URLRequest;
		private var picUrlB:URLRequest;
		private var loadPicA:Loader;
		private var loadPicB:Loader;
		private var fangM:Sprite;
		private var myTime:Timer;
		private var myTimeB:Timer;



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
			loadPicB.visible=true;

			fangM=new Sprite;
			fangM.addChild(loadPicA);
			fangM.addChild(loadPicB);
			myTime=new Timer(500);
			myTimeB=new Timer(1000);
			myTime.addEventListener(TimerEvent.TIMER,timefuc);
			myTimeB.addEventListener(TimerEvent.TIMER,timefucB);
			myTime.start();
			myTimeB.start();
			function timefuc(e:TimerEvent) {
				loadPicA.visible=true;
				loadPicB.visible=false;
			}
			function timefucB(e:TimerEvent) {
				loadPicB.visible=true;
				loadPicA.visible=false;
			}
		}
		public function Fang(zx:int) {
			pushArray(zx);
			loadpic();
			addChild(fangM);
		}
	}
}