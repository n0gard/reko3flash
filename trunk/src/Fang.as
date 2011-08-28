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
		public static  var BLOCK_SIZE_PX=32;
		private var bfs:Array=new Array;

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
				if (active == 1) {
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
			this.scaleX=- this.scaleX;
			if (this.scaleX < 0) {
				this.x=this.x + 32;
			} else {
				this.x=this.x - 32;
			}
		}
		// 改变状态
		public function changeStatus(e:MouseEvent) {
			trace("Click Ok");
			var color:Color=new Color;
			if (active == 1) {
				color.brightness=-0.3;
				active=0;
			} else {
				color.brightness=0;
				active=1;
			}
			this.transform.colorTransform=color;
		}
		// 显示高亮
		public function showAvalibleBattleField(e:MouseEvent) {
			Share.setVisible(true);
			//battleOBJ[]
			trace("Fang's   X " + this.x + " Y " + this.y);
			trace("mouseX" + this.mouseX + "mouseY" + this.mouseY);

			//calculateBrightCoordinates(this.x,this.y,1);
			//calculateBrightCoordinates(this.x,this.y,2);
			//calculateBrightCoordinates(this.x,this.y,3);
			calculateBrightCoordinates(this.x,this.y,4);
			for (var i=0; i < bfs.length; i++) {
				bfs[i].turnToBright();
			}
		}
		private function calculateBrightCoordinates(lastX:int,lastY:int,lastDirection:int):void {
			var targetBFx:int = lastX;
			var targetBFy:int = lastY;
			var bf:BattleField;
			var directions:Array=new Array;
			// 去掉上一个坐标的方向 避免死循环 因此 directions的length为3  其最大下标为2
			if (lastDirection == 1) {
				directions.push(1);
				//directions.push(2);
				directions.push(3);
				directions.push(4);
			} else if (lastDirection == 2) {
				//directions.push(1);
				directions.push(2);
				directions.push(3);
				directions.push(4);
			} else if (lastDirection == 3) {
				directions.push(1);
				directions.push(2);
				directions.push(3);
				//directions.push(4);
			} else if (lastDirection == 4) {
				directions.push(1);
				directions.push(2);
				//directions.push(3);
				directions.push(4);
			} else {
				directions.push(1);
				directions.push(2);
				directions.push(3);
				directions.push(4);
			}
			// 遍历每个方向
			for (var i=0; i < directions.length; i++) {
				targetBFx = lastX;
				targetBFy = lastY;
				switch (directions[i]) {
						// 朝上
					case 1 :
						trace("判定朝上");
						targetBFy=lastY - BLOCK_SIZE_PX;
						bf=Share.getBF(targetBFx,targetBFy);
						moveAbility-= bf.getConsumeAbility();
						break;
						// 朝下
					case 2 :
						trace("判定朝下");
						targetBFy=lastY + BLOCK_SIZE_PX;
						bf=Share.getBF(targetBFx,targetBFy);
						moveAbility-= bf.getConsumeAbility();
						break;
						// 朝左
					case 3 :
						trace("判定朝左");
						targetBFx=lastX - BLOCK_SIZE_PX;
						bf=Share.getBF(targetBFx,targetBFy);
						moveAbility-= bf.getConsumeAbility();
						break;
						// 朝右
					case 4 :
						trace("判定朝右");
						targetBFx=lastX + BLOCK_SIZE_PX;
						bf=Share.getBF(targetBFx,targetBFy);
						moveAbility-= bf.getConsumeAbility();
						break;
						// 原地不动
					default :
						bf=Share.getBF(targetBFx,targetBFy);
						moveAbility=0;
						break;
				}
				// 大于零 说明可以到达 且可以继续向 该方向 的坐标延伸
				if (moveAbility > 0) {
					bfs.push(bf);
					// 此处开始递归  directions[i]就是该方向!!!
					calculateBrightCoordinates(targetBFx,targetBFy,directions[i]);

					// 等于零 说明可以到达 但不能继续移动 所以换个方向 继续下一次循环
				} else if (moveAbility == 0) {
					bfs.push(bf);
					// 别忘了把 moveAbility 重置为之前状态
					moveAbility+= bf.getConsumeAbility();
					// i==directions.length 说明directions数组已经遍历到最后一个了 如果已经最后一个方向 返回到上一个坐标
					if (i == directions.length) {
						return;

						// i!=directions.length 说明此次坐标的三个方向还没遍历完全 继续
					} else {
						continue;
					}
					// 如果小于零 说明此处的该方向 已经不能到达 下一方向
				} else if (moveAbility < 0) {
					//  别忘了把 moveAbility 重置为之前状态
					moveAbility+= bf.getConsumeAbility();
					// i==directions.length 说明directions数组已经遍历到最后一个了 如果已经最后一个方向 返回到上一个坐标
					if (i == directions.length) {
						return;

						// i!=directions.length 说明此次坐标的三个方向还没遍历完全 继续
					} else {
						continue;
					}
				}
			}
			return;
		}
		// 构造
		public function Fang(zx:int) {
			pushArray(zx);
			loadpic(speed);
			//addChild(fangM);
			// 目前默認為5 以後 根據部隊的種類 分配不同的行動能力值
			if (true) {
				moveAbility=1;
			}
		}
	}
}