package {
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.net.URLRequest;

	public class fangkuai extends Sprite {
		public var zaoxinga:Array=new Array();
		public var zaoxingb:Array=new Array();
		zaoxinga[0]="素材/战场可移动单位已拆分/test_1-1a.png";
		//for (var i:int=0; i<=46; i++) {

			//zaoxinga[i]="素材/战场可移动单位已拆分/test_"+String(i+1)+"-1a.png";//装入各种兵种的造型图片的地址

			//zaoxingb[i]="素材/战场可移动单位已拆分/test_"+String(i+1)+"-1b.png";
		//}
		/* 部队类型 
		*  1 步兵 2 长兵 3 战车
		*  4 弓兵 5 连弩 6 投石车 
		*  7 轻骑 8 重骑 9 近卫队
		* 10 贼兵 11 恶贼 12 义贼
		* 13 军乐队 
		* 14 猛兽团
		* 15 武术家
		* 16 妖术师
		* 17 异民族
		* 18 民众
		* 19 运输队
		*/
		private var unitType:int;



		function fangkuai(zx:int) {
			//addChild(fk);//构造函数，将库中fang的实例传入此类的对象中，完成造型
			/****** 请问kinghoo兄 这个addChild已经执行过一次了
			 为何外头的new出来的方块还需要addChild一次？？？？*******/
			//回答dragon兄，因为这里是把fang这个类的实例装入这个类的实例中，而外面的那个事把fangkuai这个类的实例装入舞台中。
			var footmanPicUrl:URLRequest=new URLRequest(zaoxinga[zx]);
			var footman:Loader=new Loader;
			footman.load(footmanPicUrl);
			addChild(footman);
		}
	}
}