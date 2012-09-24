package ru.flexconstructor.common.view.UI.zoom
{
	import flash.display.DisplayObject;
	
	import mx.core.IVisualElement;
	
	import spark.components.SkinnableContainer;
	
	public class ZoomContainer extends SkinnableContainer
	{
		
		private var _autostart:Boolean=true;
		private var _target:IVisualElement;
		
		public function ZoomContainer()
		{
			super();
		}
		
		
		override protected function childrenCreated():void{
		super.childrenCreated()
		if(this._target){
			this.registerTarget(this._target);
		
		}
		
		}
		
		
		public function set autostart(value:Boolean):void{
			_autostart=value;
		
		}
		
		
		public function get autostart():Boolean{
		return _autostart;
		}
		
		
		public function start():void{
		if(this.rectangleTool.target){
		this.rectangleTool.start();
		}
		
		}
		
		public function stop():void{
		if(this.rectangleTool.target){
		this.rectangleTool.stop();
		}
		
		}
		
		override protected function attachSkin():void{
		this.setStyle("skinClass",ZoomContainerSkin)
		super.attachSkin();
		
		
		}
		
		
		private function get rectangleTool():RectangleTool{
		if(! this.skin)return null;
		var zoom_container_skin:ZoomContainerSkin=this.skin as ZoomContainerSkin;
		return zoom_container_skin.rectangle_tool;
		
		}
		
		
		public function set target(value:IVisualElement):void{
		_target=this.addElementAt(value,0);
		if(this.rectangleTool){
		this.registerTarget(_target)
		}
		
		}
		
		
		public function get target():IVisualElement{
		return this._target;
		
		}
		
		private function registerTarget(element:IVisualElement):void{		
		try{
		this.rectangleTool.target=element as DisplayObject;
		}
		catch(error:Error){
		trace("Has no rectangle tool!!!")
		return;
		}
		if(_autostart){
			this.rectangleTool.start();
		}
		
		}
		
		
		public function zoom():void{
		if(this.rectangleTool){
		this.rectangleTool.zoom();
		}
		
		}
		
		
		public function unzoom():void{
		if(this.rectangleTool){
		this.rectangleTool.unzoom();
		}
		
		}
		
		
	}
}