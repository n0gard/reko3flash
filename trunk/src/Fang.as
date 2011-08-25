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
	import flash.geom.Point;


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
		private var moveAbility:int;

		private function pushArray(i:int):void {
			picUrlA=new URLRequest  ;
			picUrlB=new URLRequest  ;
			picUrlA.url="../素材/战场可移动单位已拆分/test_" + String(i) + "-1a.png";
			picUrlB.url="../素材/战场可移动单位已拆分/test_" + String(i) + "-1b.png";
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

			this.addEventListener(MouseEvent.CLICK,showAvalibleBattleField);

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
					//changeDirection();
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
			trace("Click Ok");
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
		// 显示高亮
		public function showAvalibleBattleField(e:MouseEvent) {
			//battleOBJ[]
			trace("Fang's   X "+this.x+" Y "+this.y);

			var mousePoint:Point=new Point(this.mouseX, this.mouseY);
			mousePoint=this.localToGlobal(mousePoint);
			trace("Stage coordinates:"+mousePoint);

			var bfx:int = mousePoint.x-mousePoint.x%32;
			var bfy:int = mousePoint.y-mousePoint.y%32;
			trace("bfx:"+bfx+"bfy:"+bfy);

			var darkBattleFields:Array =  calculateDarkCoordinates(bfx,bfy);
			for (var i=0; i< darkBattleFields.length; i++) {
				var bf:BattleField = darkBattleFields[i];
				if (bf != null) {
					bf.turnToDark();
				}
			}
		}
		private function calculateDarkCoordinates(bfx:int,bfy:int):Array {
			var bfs:Array = new Array();
			for (var i=0; i<=this.moveAbility; i++) {
				var bf1:BattleField = Share.getBF(bfx-i,bfy-i);
				var bf2:BattleField = Share.getBF(bfx-i,bfy+i);
				var bf3:BattleField = Share.getBF(bfx+i,bfy-i);
				var bf4:BattleField = Share.getBF(bfx+i,bfy+i);
				bfs[i] = bf1;
				bfs[i+1] = bf2;
				bfs[i+2] = bf3;
				bfs[i+3] = bf4;
			}
			return bfs;
		}
		// 构造
		public function Fang(zx:int) {
			pushArray(zx);
			loadpic(speed);
			//addChild(fangM);
			// 目前默認為5 以後 根據部隊的種類 分配不同的行動能力值
			if (true) {
				moveAbility = 5;
			}
		}
	}
}