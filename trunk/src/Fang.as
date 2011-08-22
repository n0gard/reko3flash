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
	import flash.events.MouseEvent;
	import fl.motion.Color;


	public class Fang extends Sprite {
		private var picUrlA:URLRequest;
		private var picUrlB:URLRequest;
		private var loadPicA:Loader;
		private var loadPicB:Loader;
		//private var fangM:Sprite;
		private var myTime:Timer;
		private var myTimeB:Timer;
		private var speed:int=500;
		private var active:int=1;

		private function pushArray(i:int):void {
			picUrlA=new URLRequest  ;
			picUrlB=new URLRequest  ;
			picUrlA.url="../../素材/战场可移动单位已拆分/test_" + String(i) + "-1a.png";
			picUrlB.url="../../素材/战场可移动单位已拆分/test_" + String(i) + "-1b.png";
		}
		private function loadpic(ti:int):void {
			loadPicA=new Loader  ;
			loadPicB=new Loader  ;
			loadPicA.load(picUrlA);
			loadPicB.load(picUrlB);

			//var tweenA:Tween=new Tween(loadPicA,"x",Elastic.easeInOut,50,100,2,true);
			// 请问kinghoo 这里直接fangM.addChild可否？
			addChild(loadPicA);
			addChild(loadPicB);

			//fangM=new Sprite  ;
			//fangM.addChild(loadPicA);
			//fangM.addChild(loadPicB);

			this.addEventListener(MouseEvent.CLICK,changeStatus);

			myTime=new Timer(ti);
			myTimeB=new Timer(ti);
			myTime.addEventListener(TimerEvent.TIMER,timefuc);
			myTimeB.addEventListener(TimerEvent.TIMER,timefucB);
			loadPicB.visible=false;
			myTime.start();

			function timefuc(e:TimerEvent) {
				if (active==1) {
					loadPicA.visible=false;
					loadPicB.visible=true;
					myTime.stop();
					changeDirection();
					//flipHorizontal(this);
					myTimeB.start();
				}
			}
			function timefucB(e:TimerEvent) {
				if (active == 1) {
					loadPicB.visible=false;
					loadPicA.visible=true;
					myTime.start();
					myTimeB.stop();
				}
			}

			//loadPicA.x=100;
			//loadPicB.x=200;
		}
		// 改变方向
		public function changeDirection() {
			this.scaleX=-this.scaleX;
			if (this.scaleX < 0) {
				this.x = this.x + 32;
			} else {
				this.x = this.x - 32;
			}
		}
		// 改变状态
		public function changeStatus(e:MouseEvent) {
			var color:Color=new Color();
			if (active == 1) {
				color.brightness = -0.3;
				active = 0;
			} else {
				color.brightness = 0;
				active = 1;
			}
			this.transform.colorTransform = color;
		}
		// 构造
		public function Fang(zx:int) {
			pushArray(zx);
			loadpic(speed);
			//addChild(fangM);
		}
	}
}