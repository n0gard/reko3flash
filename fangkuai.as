package {
	import flash.display.Sprite;
	import flash.display.MovieClip;
	public class fangkuai extends Sprite {
		public var a:int;//没有用的东西忘删了，写一些这个类的属性和方法

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



		function fangkuai(fk:MovieClip) {
			addChild(fk);//构造函数，将库中fang的实例传入此类的对象中，完成造型
			/****** 请问kinghoo兄 这个addChild已经执行过一次了
			 为何外头的new出来的方块还需要addChild一次？？？？*******/
		}
	}
}