// Type definitions for ExtJS 4.2.1
// Project: http://www.sencha.com/products/extjs/
// Definitions by: Brian Kotek <https://github.com/brian428/>
// Definitions: https://github.com/borisyankov/DefinitelyTyped

declare module Ext {
	export interface IAbstractComponent extends Ext.IBase,Ext.util.IPositionable,Ext.util.IObservable,Ext.util.IAnimate,Ext.util.IElementContainer,Ext.util.IRenderable,Ext.state.IStateful {
		/** [Config Option] (String/Object) */
		autoEl?: any;
		/** [Config Option] (Ext.ComponentLoader/Object/String/Boolean) */
		autoLoad?: any;
		/** [Config Option] (Boolean/String/HTMLElement/Ext.Element) */
		autoRender?: any;
		/** [Config Option] (Boolean) */
		autoShow?: bool;
		/** [Config Option] (String) */
		baseCls?: string;
		/** [Config Option] (Number/String/Boolean) */
		border?: any;
		/** [Config Option] (Object[]) */
		childEls?: any[];
		/** [Config Option] (String) */
		cls?: string;
		/** [Config Option] (String) */
		componentCls?: string;
		/** [Config Option] (String/Object) */
		componentLayout?: any;
		/** [Config Option] (String) */
		contentEl?: string;
		/** [Config Option] (Object) */
		data?: any;
		/** [Config Option] (Boolean) */
		disabled?: bool;
		/** [Config Option] (String) */
		disabledCls?: string;
		/** [Config Option] (Boolean) */
		draggable?: bool;
		/** [Config Option] (Boolean) */
		floating?: bool;
		/** [Config Option] (Boolean) */
		frame?: bool;
		/** [Config Option] (Number) */
		height?: number;
		/** [Config Option] (Boolean) */
		hidden?: bool;
		/** [Config Option] (String) */
		hideMode?: string;
		/** [Config Option] (String/Object) */
		html?: any;
		/** [Config Option] (String) */
		id?: string;
		/** [Config Option] (String) */
		itemId?: string;
		/** [Config Option] (Ext.ComponentLoader/Object) */
		loader?: any;
		/** [Config Option] (Number/String) */
		margin?: any;
		/** [Config Option] (Number) */
		maxHeight?: number;
		/** [Config Option] (Number) */
		maxWidth?: number;
		/** [Config Option] (Number) */
		minHeight?: number;
		/** [Config Option] (Number) */
		minWidth?: number;
		/** [Config Option] (String) */
		overCls?: string;
		/** [Config Option] (Number/String) */
		padding?: any;
		/** [Config Option] (Ext.AbstractPlugin[]/Ext.AbstractPlugin/Object[]/Object/Ext.enums.Plugin[]/Ext.enums.Plugin) */
		plugins?: any;
		/** [Config Option] (Object) */
		renderData?: any;
		/** [Config Option] (Object) */
		renderSelectors?: any;
		/** [Config Option] (String/HTMLElement/Ext.Element) */
		renderTo?: any;
		/** [Config Option] (Ext.XTemplate/String/String[]) */
		renderTpl?: any;
		/** [Config Option] (Boolean) */
		rtl?: bool;
		/** [Config Option] (Boolean/Number) */
		shrinkWrap?: any;
		/** [Config Option] (String/Object) */
		style?: any;
		/** [Config Option] (Ext.XTemplate/Ext.Template/String/String[]) */
		tpl?: any;
		/** [Config Option] (String) */
		tplWriteMode?: string;
		/** [Config Option] (String) */
		ui?: string;
		/** [Config Option] (Number) */
		width?: number;
		/** [Config Option] (Ext.enums.Widget) */
		xtype?: Ext.enums.IWidget;
		/** [Property] (Boolean) */
		_isLayoutRoot?: bool;
		/** [Property] (String) */
		contentPaddingProperty?: string;
		/** [Property] (Object) */
		frameSize?: any;
		/** [Property] (Boolean) */
		isComponent?: bool;
		/** [Property] (Boolean) */
		maskOnDisable?: bool;
		/** [Property] (Ext.Container) */
		ownerCt?: Ext.IContainer;
		/** [Property] (Boolean) */
		rendered?: bool;
		/** [Method] Adds each argument passed to this method to the childEls array  */
		addChildEls?(): void;
		/** [Method] Adds a CSS class to the top level element representing this component  
		* @param cls String/String[] The CSS class name to add. 
		*/
		addClass?( cls?:any ): any;
		addClass?( cls?:string ): Ext.IComponent;
		addClass?( cls?:string[] ): Ext.IComponent;
		/** [Method] Adds a CSS class to the top level element representing this component  
		* @param cls String/String[] The CSS class name to add. 
		*/
		addCls?( cls?:any ): any;
		addCls?( cls?:string ): Ext.IComponent;
		addCls?( cls?:string[] ): Ext.IComponent;
		/** [Method] Adds a cls to the uiCls array which will also call addUIClsToElement and adds to all elements of this component  
		* @param classes String/String[] A string or an array of strings to add to the uiCls. 
		* @param skip Object (Boolean) skip true to skip adding it to the class and do it later (via the return). 
		*/
		addClsWithUI?( classes?:any, skip?:any ): any;
		addClsWithUI?( classes?:string, skip?:any ): void;
		addClsWithUI?( classes?:string[], skip?:any ): void;
		/** [Method] Adds the specified events to the list of events which this Observable may fire  
		* @param eventNames Object/String... Either an object with event names as properties with a value of true. For example: this.addEvents({  storeloaded: true,  storecleared: true });  Or any number of event names as separate parameters. For example: this.addEvents('storeloaded', 'storecleared'); 
		*/
		addEvents?( eventNames?:any ): void;
		/** [Method] Appends an event handler to this object  
		* @param element Object 
		* @param listeners Object 
		* @param scope Object 
		* @param options Object 
		*/
		addListener?( element?:any, listeners?:any, scope?:any, options?:any ): any;
		/** [Method] Adds listeners to any Observable object or Ext Element which are automatically removed when this Component is destr  
		* @param item Ext.util.Observable/Ext.Element The item to which to add a listener/listeners. 
		* @param ename Object/String The event name, or an object containing event name properties. 
		* @param fn Function If the ename parameter was an event name, this is the handler function. 
		* @param scope Object If the ename parameter was an event name, this is the scope (this reference) in which the handler function is executed. 
		* @param options Object If the ename parameter was an event name, this is the addListener options. 
		*/
		addManagedListener?( item?:any, ename?:any, fn?:any, scope?:any, options?:any ): any;
		addManagedListener?( item?:Ext.util.IObservable, ename?:any, fn?:any, scope?:any, options?:any ): any;
		addManagedListener?( item?:Ext.IElement, ename?:any, fn?:any, scope?:any, options?:any ): any;
		/** [Method] Save a property to the given state object if it is not its default or configured value  
		* @param state Object The state object. 
		* @param propName String The name of the property on this object to save. 
		* @param value String The value of the state property (defaults to this[propName]). 
		*/
		addPropertyToState?( state?:any, propName?:string, value?:string ): bool;
		/** [Method] Add events that will trigger the state to be saved  
		* @param events String/String[] The event name or an array of event names. 
		*/
		addStateEvents?( events?:any ): any;
		addStateEvents?( events?:string ): void;
		addStateEvents?( events?:string[] ): void;
		/** [Method] Method which adds a specified UI  uiCls to the components element  
		* @param ui String The UI to remove from the element. 
		*/
		addUIClsToElement?( ui?:string ): void;
		/** [Method] Called by the layout system after the Component has been laid out  
		* @param width Number The width that was set 
		* @param height Number The height that was set 
		* @param oldWidth Number/undefined The old width, or undefined if this was the initial layout. 
		* @param oldHeight Number/undefined The old height, or undefined if this was the initial layout. 
		*/
		afterComponentLayout?( width?:any, height?:any, oldWidth?:any, oldHeight?:any ): any;
		afterComponentLayout?( width?:number, height?:number, oldWidth?:number, oldHeight?:number ): void;
		afterComponentLayout?( width?:number, height?:number, oldWidth?:undefined, oldHeight?:number ): void;
		afterComponentLayout?( width?:number, height?:number, oldWidth?:number, oldHeight?:undefined ): void;
		afterComponentLayout?( width?:number, height?:number, oldWidth?:undefined, oldHeight?:undefined ): void;
		/** [Method] Allows addition of behavior after rendering is complete  */
		afterRender?(): void;
		/** [Method] Template method called after a Component has been positioned  
		* @param x Number 
		* @param y Number 
		*/
		afterSetPosition?( x?:number, y?:number ): void;
		/** [Method] Aligns the element with another element relative to the specified anchor points  
		* @param element Ext.util.Positionable/HTMLElement/String The Positionable, HTMLElement, or id of the element to align to. 
		* @param position String The position to align to 
		* @param offsets Number[] Offset the positioning by [x, y] 
		* @param animate Boolean/Object true for the default animation or a standard Element animation config object 
		*/
		alignTo?( element?:any, position?:any, offsets?:any, animate?:any ): any;
		alignTo?( element?:Ext.util.IPositionable, position?:string, offsets?:number[], animate?:any ): Ext.util.IPositionable;
		alignTo?( element?:HTMLElement, position?:string, offsets?:number[], animate?:any ): Ext.util.IPositionable;
		alignTo?( element?:string, position?:string, offsets?:number[], animate?:any ): Ext.util.IPositionable;
		/** [Method] Anchors an element to another element and realigns it when the window is resized  
		* @param element Ext.util.Positionable/HTMLElement/String The Positionable, HTMLElement, or id of the element to align to. 
		* @param position String The position to align to 
		* @param offsets Number[] Offset the positioning by [x, y] 
		* @param animate Boolean/Object true for the default animation or a standard Element animation config object 
		* @param monitorScroll Boolean/Number True to monitor body scroll and reposition. If this parameter is a number, it is used as the buffer delay in milliseconds. 
		* @param callback Function The function to call after the animation finishes 
		*/
		anchorTo?( element?:any, position?:any, offsets?:any, animate?:any, monitorScroll?:any, callback?:any ): any;
		anchorTo?( element?:Ext.util.IPositionable, position?:string, offsets?:number[], animate?:any, monitorScroll?:bool, callback?:any ): Ext.util.IPositionable;
		anchorTo?( element?:HTMLElement, position?:string, offsets?:number[], animate?:any, monitorScroll?:bool, callback?:any ): Ext.util.IPositionable;
		anchorTo?( element?:string, position?:string, offsets?:number[], animate?:any, monitorScroll?:bool, callback?:any ): Ext.util.IPositionable;
		anchorTo?( element?:Ext.util.IPositionable, position?:string, offsets?:number[], animate?:any, monitorScroll?:number, callback?:any ): Ext.util.IPositionable;
		anchorTo?( element?:HTMLElement, position?:string, offsets?:number[], animate?:any, monitorScroll?:number, callback?:any ): Ext.util.IPositionable;
		anchorTo?( element?:string, position?:string, offsets?:number[], animate?:any, monitorScroll?:number, callback?:any ): Ext.util.IPositionable;
		/** [Method] Performs custom animation on this object. ... */
		animate?: any;
		/** [Method] Applies the state to the object  
		* @param state Object The state 
		*/
		applyState?( state?:any ): void;
		/** [Method] Template method to do any pre blur processing  
		* @param e Ext.EventObject The event object 
		*/
		beforeBlur?( e?:Ext.IEventObject ): void;
		/** [Method] Occurs before componentLayout is run  
		* @param adjWidth Number The box-adjusted width that was set. 
		* @param adjHeight Number The box-adjusted height that was set. 
		*/
		beforeComponentLayout?( adjWidth?:number, adjHeight?:number ): void;
		/** [Method] Invoked before the Component is destroyed  */
		beforeDestroy?(): void;
		/** [Method] Template method to do any pre focus processing  
		* @param e Ext.EventObject The event object 
		*/
		beforeFocus?( e?:Ext.IEventObject ): void;
		/** [Method] Occurs before componentLayout is run  */
		beforeLayout?(): void;
		/** [Method] Calculates the new x y position to move this Positionable into a constrain region  
		* @param constrainTo String/HTMLElement/Ext.Element/Ext.util.Region The Element or Region into which this Component is to be constrained. Defaults to the element into which this Positionable was rendered, or this Component's {@link Ext.Component.constrainTo. 
		* @param proposedPosition Number[] A proposed [X, Y] position to test for validity and to coerce into constraints instead of using this Positionable's current position. 
		* @param local Boolean The proposedPosition is local (relative to floatParent if a floating Component) 
		* @param proposedSize Number[] A proposed [width, height] size to use when calculating constraints instead of using this Positionable's current size. 
		*/
		calculateConstrainedPosition?( constrainTo?:any, proposedPosition?:any, local?:any, proposedSize?:any ): any;
		calculateConstrainedPosition?( constrainTo?:string, proposedPosition?:number[], local?:bool, proposedSize?:number[] ): number[];
		calculateConstrainedPosition?( constrainTo?:HTMLElement, proposedPosition?:number[], local?:bool, proposedSize?:number[] ): number[];
		calculateConstrainedPosition?( constrainTo?:Ext.IElement, proposedPosition?:number[], local?:bool, proposedSize?:number[] ): number[];
		calculateConstrainedPosition?( constrainTo?:Ext.util.IRegion, proposedPosition?:number[], local?:bool, proposedSize?:number[] ): number[];
		/** [Method] Removes all listeners for this object including the managed listeners */
		clearListeners?(): void;
		/** [Method] Removes all managed listeners for this object  */
		clearManagedListeners?(): void;
		/** [Method] Destroys the Component  */
		destroy?(): void;
		/** [Method] Disable the component  
		* @param silent Boolean Passing true will suppress the disable event from being fired. 
		*/
		disable?( silent?:bool ): void;
		/** [Method] Handles autoRender  */
		doAutoRender?(): void;
		/** [Method] This method needs to be called whenever you change something on this component that requires the Component s layout t  */
		doComponentLayout?(): Ext.container.IContainer;
		/** [Method] Enable the component 
		* @param silent Boolean Passing true will suppress the enable event from being fired. 
		*/
		enable?( silent?:bool ): void;
		/** [Method] Enables events fired by this Observable to bubble up an owner hierarchy by calling this getBubbleTarget  if present  
		* @param eventNames String/String[] The event name to bubble, or an Array of event names. 
		*/
		enableBubble?( eventNames?:any ): any;
		enableBubble?( eventNames?:string ): void;
		enableBubble?( eventNames?:string[] ): void;
		/** [Method] Ensures that this component is attached to document body  
		* @param runLayout Boolean True to run the component's layout. 
		*/
		ensureAttachedToBody?( runLayout?:bool ): void;
		/** [Method] Retrieves plugin from this component s collection by its ptype  
		* @param ptype String The Plugin's ptype as specified by the class's alias configuration. 
		*/
		findPlugin?( ptype?:string ): Ext.IAbstractPlugin;
		/** [Method] Fires the specified event with the passed parameters minus the event name plus the options object passed to addList  
		* @param eventName String The name of the event to fire. 
		* @param args Object... Variable number of parameters are passed to handlers. 
		*/
		fireEvent?( eventName:string, ...args:any[] ): bool;
		/** [Method] Fires the specified event with the passed parameter list  
		* @param eventName String The name of the event to fire. 
		* @param args Object[] An array of parameters which are passed to handlers. 
		*/
		fireEventArgs?( eventName?:string, args?:any[] ): bool;
		/** [Method] Forces this component to redo its componentLayout  */
		forceComponentLayout?(): void;
		/** [Method] Returns the current animation if this object has any effects actively running or queued else returns false  */
		getActiveAnimation?(): Ext.fx.IAnim;
		/** [Method] Returns the current animation if this object has any effects actively running or queued else returns false  */
		getActiveAnimation?(): bool;
		/** [Method] Gets the x y coordinates to align this element with another element  
		* @param element Ext.util.Positionable/HTMLElement/String The Positionable, HTMLElement, or id of the element to align to. 
		* @param position String The position to align to 
		* @param offsets Number[] Offset the positioning by [x, y] 
		*/
		getAlignToXY?( element?:any, position?:any, offsets?:any ): any;
		getAlignToXY?( element?:Ext.util.IPositionable, position?:string, offsets?:number[] ): number[];
		getAlignToXY?( element?:HTMLElement, position?:string, offsets?:number[] ): number[];
		getAlignToXY?( element?:string, position?:string, offsets?:number[] ): number[];
		/** [Method] Gets the x y coordinates specified by the anchor position on the element  
		* @param anchor String The specified anchor position. See alignTo for details on supported anchor positions. 
		* @param local Boolean True to get the local (element top/left-relative) anchor position instead of page coordinates 
		* @param size Object An object containing the size to use for calculating anchor position {width: (target width), height: (target height)} (defaults to the element's current size) 
		*/
		getAnchorXY?( anchor?:string, local?:bool, size?:any ): number[];
		/** [Method] Return an object defining the area of this Element which can be passed to setBox to set another Element s size locati  
		* @param contentBox Boolean If true a box for the content of the element is returned. 
		* @param local Boolean If true the element's left and top relative to its offsetParent are returned instead of page x/y. 
		*/
		getBox?( contentBox?:bool, local?:bool ): any;
		/** [Method] Provides the link for Observable s fireEvent method to bubble up the ownership hierarchy  */
		getBubbleTarget?(): Ext.container.IContainer;
		/** [Method] Returns the X Y vector by which this Positionable s element must be translated to make a best attempt to constrain  
		* @param constrainTo Ext.util.Positionable/HTMLElement/String/Ext.util.Region The Positionable, HTMLElement, element id, or Region into which the element is to be constrained. 
		* @param proposedPosition Number[] A proposed [X, Y] position to test for validity and to produce a vector for instead of using the element's current position 
		* @param proposedSize Number[] A proposed [width, height] size to constrain instead of using the element's current size 
		*/
		getConstrainVector?( constrainTo?:any, proposedPosition?:any, proposedSize?:any ): any;
		getConstrainVector?( constrainTo?:Ext.util.IPositionable, proposedPosition?:number[], proposedSize?:number[] ): number[];
		getConstrainVector?( constrainTo?:HTMLElement, proposedPosition?:number[], proposedSize?:number[] ): number[];
		getConstrainVector?( constrainTo?:string, proposedPosition?:number[], proposedSize?:number[] ): number[];
		getConstrainVector?( constrainTo?:Ext.util.IRegion, proposedPosition?:number[], proposedSize?:number[] ): number[];
		/** [Method] Returns the X Y vector by which this Positionable s element must be translated to make a best attempt to constrain  
		* @param constrainTo Ext.util.Positionable/HTMLElement/String/Ext.util.Region The Positionable, HTMLElement, element id, or Region into which the element is to be constrained. 
		* @param proposedPosition Number[] A proposed [X, Y] position to test for validity and to produce a vector for instead of using the element's current position 
		* @param proposedSize Number[] A proposed [width, height] size to constrain instead of using the element's current size 
		*/
		getConstrainVector?( constrainTo?:Ext.util.IPositionable, proposedPosition?:number[], proposedSize?:number[] ): bool;
		getConstrainVector?( constrainTo?:HTMLElement, proposedPosition?:number[], proposedSize?:number[] ): bool;
		getConstrainVector?( constrainTo?:string, proposedPosition?:number[], proposedSize?:number[] ): bool;
		getConstrainVector?( constrainTo?:Ext.util.IRegion, proposedPosition?:number[], proposedSize?:number[] ): bool;
		/** [Method] Retrieves the top level element representing this component  */
		getEl?(): Ext.dom.IElement;
		/** [Method] Gets the current height of the component s underlying element  */
		getHeight?(): number;
		/** [Method] Retrieves the id of this component  */
		getId?(): string;
		/** [Method] This function takes the position argument passed to onRender and returns a DOM element that you can use in the insert  
		* @param position String/Number/Ext.dom.Element/HTMLElement Index, element id or element you want to put this component before. 
		*/
		getInsertPosition?( position?:any ): any;
		getInsertPosition?( position?:string ): HTMLElement;
		getInsertPosition?( position?:number ): HTMLElement;
		getInsertPosition?( position?:Ext.dom.IElement ): HTMLElement;
		getInsertPosition?( position?:HTMLElement ): HTMLElement;
		/** [Method] Returns the value of itemId assigned to this component or when that is not set returns the value of id  */
		getItemId?(): string;
		/** [Method] Gets the Ext ComponentLoader for this Component  */
		getLoader?(): Ext.IComponentLoader;
		/** [Method] Overridden in Ext rtl AbstractComponent  */
		getLocalX?(): number;
		/** [Method] Overridden in Ext rtl AbstractComponent  */
		getLocalXY?(): number[];
		/** [Method] Returns the y coordinate of this element reletive to its offsetParent  */
		getLocalY?(): number;
		/** [Method] Returns the offsets of this element from the passed element  
		* @param offsetsTo Ext.util.Positionable/HTMLElement/String The Positionable, HTMLElement, or element id to get get the offsets from. 
		*/
		getOffsetsTo?( offsetsTo?:any ): any;
		getOffsetsTo?( offsetsTo?:Ext.util.IPositionable ): number[];
		getOffsetsTo?( offsetsTo?:HTMLElement ): number[];
		getOffsetsTo?( offsetsTo?:string ): number[];
		/** [Method] Retrieves a plugin from this component s collection by its pluginId  
		* @param pluginId String 
		*/
		getPlugin?( pluginId?:string ): Ext.IAbstractPlugin;
		/** [Method] Returns a region object that defines the area of this element  */
		getRegion?(): Ext.util.IRegion;
		/** [Method] Gets the current size of the component s underlying element  */
		getSize?(): any;
		/** [Method] Returns an object that describes how this component s width and height are managed  
		* @param ownerCtSizeModel Object 
		*/
		getSizeModel?( ownerCtSizeModel?:any ): any;
		/** [Method] The supplied default state gathering method for the AbstractComponent class  */
		getState?(): any;
		/** [Method] Returns the content region of this element  */
		getViewRegion?(): Ext.util.IRegion;
		/** [Method] Gets the current width of the component s underlying element  */
		getWidth?(): number;
		/** [Method] Gets the current X position of the DOM element based on page coordinates  */
		getX?(): number;
		/** [Method] Returns this Component s xtype hierarchy as a slash delimited string  */
		getXTypes?(): string;
		/** [Method] Gets the current position of the DOM element based on page coordinates  */
		getXY?(): number[];
		/** [Method] Gets the current Y position of the DOM element based on page coordinates  */
		getY?(): number;
		/** [Method] Returns the current animation if this object has any effects actively running or queued else returns false  */
		hasActiveFx?(): Ext.fx.IAnim;
		/** [Method] Returns the current animation if this object has any effects actively running or queued else returns false  */
		hasActiveFx?(): bool;
		/** [Method] Checks if the specified CSS class exists on this element s DOM node  
		* @param className String The CSS class to check for. 
		*/
		hasCls?( className?:string ): bool;
		/** [Method] Checks to see if this object has any listeners for a specified event or whether the event bubbles  
		* @param eventName String The name of the event to check for 
		*/
		hasListener?( eventName?:string ): bool;
		/** [Method] Checks if there is currently a specified uiCls  
		* @param cls String The cls to check. 
		*/
		hasUICls?( cls?:string ): void;
		/** [Method] Initialize any events on this component */
		initEvents?(): void;
		/** [Method] Initialized the renderData to be used when rendering the renderTpl  */
		initRenderData?(): any;
		/** [Method] Tests whether this Component matches the selector string  
		* @param selector String The selector string to test against. 
		*/
		is?( selector?:string ): bool;
		/** [Method] Determines whether this component is the descendant of a particular container  
		* @param container Ext.Container 
		*/
		isDescendantOf?( container?:Ext.IContainer ): bool;
		/** [Method] Method to determine whether this Component is currently disabled  */
		isDisabled?(): bool;
		/** [Method] Method to determine whether this Component is draggable  */
		isDraggable?(): bool;
		/** [Method] Method to determine whether this Component is droppable  */
		isDroppable?(): bool;
		/** [Method] Method to determine whether this Component is floating  */
		isFloating?(): bool;
		/** [Method] Method to determine whether this Component is currently set to hidden  */
		isHidden?(): bool;
		/** [Method] Determines whether this Component is the root of a layout  */
		isLayoutRoot?(): void;
		/** [Method] Returns true if layout is suspended for this component  */
		isLayoutSuspended?(): bool;
		/** [Method] Returns true if this component is visible  
		* @param deep Boolean Pass true to interrogate the visibility status of all parent Containers to determine whether this Component is truly visible to the user. Generally, to determine whether a Component is hidden, the no argument form is needed. For example when creating dynamically laid out UIs in a hidden Container before showing them. 
		*/
		isVisible?( deep?:bool ): bool;
		/** [Method] Tests whether or not this Component is of a specific xtype  
		* @param xtype String The xtype to check for this Component 
		* @param shallow Boolean true to check whether this Component is directly of the specified xtype, false to check whether this Component is descended from the xtype. 
		*/
		isXType?( xtype?:string, shallow?:bool ): bool;
		/** [Method] Shorthand for addManagedListener  
		* @param item Ext.util.Observable/Ext.Element The item to which to add a listener/listeners. 
		* @param ename Object/String The event name, or an object containing event name properties. 
		* @param fn Function If the ename parameter was an event name, this is the handler function. 
		* @param scope Object If the ename parameter was an event name, this is the scope (this reference) in which the handler function is executed. 
		* @param options Object If the ename parameter was an event name, this is the addListener options. 
		*/
		mon?( item?:any, ename?:any, fn?:any, scope?:any, options?:any ): any;
		mon?( item?:Ext.util.IObservable, ename?:any, fn?:any, scope?:any, options?:any ): any;
		mon?( item?:Ext.IElement, ename?:any, fn?:any, scope?:any, options?:any ): any;
		/** [Method] Move the element relative to its current position  
		* @param direction String Possible values are:  "l" (or "left") "r" (or "right") "t" (or "top", or "up") "b" (or "bottom", or "down")  
		* @param distance Number How far to move the element in pixels 
		* @param animate Boolean/Object true for the default animation or a standard Element animation config object 
		*/
		move?( direction?:string, distance?:number, animate?:any ): void;
		/** [Method] Shorthand for removeManagedListener  
		* @param item Ext.util.Observable/Ext.Element The item from which to remove a listener/listeners. 
		* @param ename Object/String The event name, or an object containing event name properties. 
		* @param fn Function If the ename parameter was an event name, this is the handler function. 
		* @param scope Object If the ename parameter was an event name, this is the scope (this reference) in which the handler function is executed. 
		*/
		mun?( item?:any, ename?:any, fn?:any, scope?:any ): any;
		mun?( item?:Ext.util.IObservable, ename?:any, fn?:any, scope?:any ): void;
		mun?( item?:Ext.IElement, ename?:any, fn?:any, scope?:any ): void;
		/** [Method] Returns the next node in the Component tree in tree traversal order  
		* @param selector String A ComponentQuery selector to filter the following nodes. 
		*/
		nextNode?( selector?:string ): Ext.IComponent;
		/** [Method] Returns the next sibling of this Component  
		* @param selector String A ComponentQuery selector to filter the following items. 
		*/
		nextSibling?( selector?:string ): Ext.IComponent;
		/** [Method] Shorthand for addListener  
		* @param eventName String/Object The name of the event to listen for. May also be an object who's property names are event names. 
		* @param fn Function The method the event invokes, or if scope is specified, the name* of the method within the specified scope. Will be called with arguments given to Ext.util.Observable.fireEvent plus the options parameter described below. 
		* @param scope Object The scope (this reference) in which the handler function is executed. If omitted, defaults to the object which fired the event. 
		* @param options Object An object containing handler configuration.  Note: Unlike in ExtJS 3.x, the options object will also be passed as the last argument to every event handler.  This object may contain any of the following properties: 
		*/
		on?( eventName?:any, fn?:any, scope?:any, options?:any ): any;
		/** [Method] Method to manage awareness of when components are added to their respective Container firing an added event  
		* @param container Ext.container.Container Container which holds the component. 
		* @param pos Number Position at which the component was added. 
		*/
		onAdded?( container?:Ext.container.IContainer, pos?:number ): void;
		/** [Method] Allows addition of behavior to the disable operation  */
		onDisable?(): void;
		/** [Method] Allows addition of behavior to the enable operation  */
		onEnable?(): void;
		/** [Method] Called after the component is moved this method is empty by default but can be implemented by any subclass that need  
		* @param x Number The new x position. 
		* @param y Number The new y position. 
		*/
		onPosition?( x?:number, y?:number ): void;
		/** [Method] Method to manage awareness of when components are removed from their respective Container firing a removed event  
		* @param destroying Boolean Will be passed as true if the Container performing the remove operation will delete this Component upon remove. 
		*/
		onRemoved?( destroying?:bool ): void;
		/** [Method] Template method called when this Component s DOM structure is created  
		* @param parentNode Ext.core.Element The parent Element in which this Component's encapsulating element is contained. 
		* @param containerIdx Number The index within the parent Container's child collection of this Component. 
		*/
		onRender?( parentNode?:Ext.core.IElement, containerIdx?:number ): void;
		/** [Method] Allows addition of behavior to the resize operation  
		* @param width Object 
		* @param height Object 
		* @param oldWidth Object 
		* @param oldHeight Object 
		*/
		onResize?( width?:any, height?:any, oldWidth?:any, oldHeight?:any ): void;
		/** [Method] Template method to do any post blur processing  
		* @param e Ext.EventObject The event object 
		*/
		postBlur?( e?:Ext.IEventObject ): void;
		/** [Method] Returns the previous node in the Component tree in tree traversal order  
		* @param selector String A ComponentQuery selector to filter the preceding nodes. 
		*/
		previousNode?( selector?:string ): Ext.IComponent;
		/** [Method] Returns the previous sibling of this Component  
		* @param selector String A ComponentQuery selector to filter the preceding items. 
		*/
		previousSibling?( selector?:string ): Ext.IComponent;
		/** [Method] Called by Component doAutoRender Register a Container configured floating true with this Component s ZIndexManager  
		* @param cmp Object 
		*/
		registerFloatingItem?( cmp?:any ): void;
		/** [Method] Relays selected events from the specified Observable as if the events were fired by this  
		* @param origin Object The Observable whose events this object is to relay. 
		* @param events String[] Array of event names to relay. 
		* @param prefix String A common prefix to prepend to the event names. For example: this.relayEvents(this.getStore(), ['load', 'clear'], 'store');  Now the grid will forward 'load' and 'clear' events of store as 'storeload' and 'storeclear'. 
		*/
		relayEvents?( origin?:any, events?:string[], prefix?:string ): any;
		/** [Method] Remove any anchor to this element  */
		removeAnchor?(): Ext.util.IPositionable;
		/** [Method] Removes items in the childEls array based on the return value of a supplied test function  
		* @param testFn Function The test function. 
		*/
		removeChildEls?( testFn?:any ): void;
		/** [Method] Removes a CSS class from the top level element representing this component  
		* @param cls String/String[] The CSS class name to remove. 
		*/
		removeCls?( cls?:any ): any;
		removeCls?( cls?:string ): Ext.IComponent;
		removeCls?( cls?:string[] ): Ext.IComponent;
		/** [Method] Removes a cls to the uiCls array which will also call removeUIClsFromElement and removes it from all elements of thi  
		* @param cls String/String[] A string or an array of strings to remove to the uiCls. 
		*/
		removeClsWithUI?( cls?:any ): any;
		removeClsWithUI?( cls?:string ): void;
		removeClsWithUI?( cls?:string[] ): void;
		/** [Method] Removes an event handler  
		* @param eventName String The type of event the handler was associated with. 
		* @param fn Function The handler to remove. This must be a reference to the function passed into the Ext.util.Observable.addListener call. 
		* @param scope Object The scope originally specified for the handler. It must be the same as the scope argument specified in the original call to Ext.util.Observable.addListener or the listener will not be removed. 
		*/
		removeListener?( eventName?:string, fn?:any, scope?:any ): void;
		/** [Method] Removes listeners that were added by the mon method  
		* @param item Ext.util.Observable/Ext.Element The item from which to remove a listener/listeners. 
		* @param ename Object/String The event name, or an object containing event name properties. 
		* @param fn Function If the ename parameter was an event name, this is the handler function. 
		* @param scope Object If the ename parameter was an event name, this is the scope (this reference) in which the handler function is executed. 
		*/
		removeManagedListener?( item?:any, ename?:any, fn?:any, scope?:any ): any;
		removeManagedListener?( item?:Ext.util.IObservable, ename?:any, fn?:any, scope?:any ): void;
		removeManagedListener?( item?:Ext.IElement, ename?:any, fn?:any, scope?:any ): void;
		/** [Method] Method which removes a specified UI  uiCls from the components element  
		* @param ui String The UI to add to the element. 
		*/
		removeUIClsFromElement?( ui?:string ): void;
		/** [Method] Renders the Component into the passed HTML element  
		* @param container Ext.Element/HTMLElement/String The element this Component should be rendered into. If it is being created from existing markup, this should be omitted. 
		* @param position String/Number The element ID or DOM node index within the container before which this component will be inserted (defaults to appending to the end of the container) 
		*/
		render?( container?:any, position?:any ): any;
		render?( container?:Ext.IElement, position?:string ): void;
		render?( container?:HTMLElement, position?:string ): void;
		render?( container?:string, position?:string ): void;
		render?( container?:Ext.IElement, position?:number ): void;
		render?( container?:HTMLElement, position?:number ): void;
		render?( container?:string, position?:number ): void;
		/** [Method] Resumes firing of the named event s 
		* @param eventName String... Multiple event names to resume. 
		*/
		resumeEvent?( ...eventName:any[] ): void;
		/** [Method] Resumes firing events see suspendEvents */
		resumeEvents?(): void;
		/** [Method] Conditionally saves a single property from this object to the given state object  
		* @param propName String The name of the property to save. 
		* @param state Object The state object in to which to save the property. 
		* @param stateName String The name to use for the property in state. 
		*/
		savePropToState?( propName?:string, state?:any, stateName?:string ): bool;
		/** [Method] Gathers additional named properties of the instance and adds their current values to the passed state object  
		* @param propNames String/String[] The name (or array of names) of the property to save. 
		* @param state Object The state object in to which to save the property values. 
		*/
		savePropsToState?( propNames?:any, state?:any ): any;
		savePropsToState?( propNames?:string, state?:any ): any;
		savePropsToState?( propNames?:string[], state?:any ): any;
		/** [Method] Saves the state of the object to the persistence store  */
		saveState?(): void;
		/** [Method] Ensures that all effects queued after sequenceFx is called on this object are run in sequence  */
		sequenceFx?(): any;
		/** [Method]  
		* @param border String/Number The border, see border. If a falsey value is passed the border will be removed. 
		*/
		setBorder?( border?:any ): any;
		setBorder?( border?:string ): void;
		setBorder?( border?:number ): void;
		/** [Method] Sets the element s box  
		* @param box Object The box to fill {x, y, width, height} 
		* @param animate Boolean/Object true for the default animation or a standard Element animation config object 
		*/
		setBox?( box?:any, animate?:any ): Ext.util.IPositionable;
		/** [Method] Enable or disable the component  
		* @param disabled Boolean true to disable. 
		*/
		setDisabled?( disabled?:bool ): void;
		/** [Method] Sets the dock position of this component in its parent panel  
		* @param dock Object The dock position. 
		* @param layoutParent Boolean true to re-layout parent. 
		*/
		setDocked?( dock?:any, layoutParent?:bool ): Ext.IComponent;
		/** [Method] Sets the height of the component  
		* @param height Number The new height to set. This may be one of:  A Number specifying the new height in the Element's Ext.Element.defaultUnits (by default, pixels). A String used to set the CSS height style. undefined to leave the height unchanged.  
		*/
		setHeight?( height?:number ): Ext.IComponent;
		/** [Method] Overridden in Ext rtl AbstractComponent  
		* @param x Object 
		*/
		setLocalX?( x?:any ): Ext.util.IPositionable;
		/** [Method] Overridden in Ext rtl AbstractComponent  
		* @param x Object 
		* @param y Object 
		*/
		setLocalXY?( x?:any, y?:any ): Ext.util.IPositionable;
		/** [Method] Sets the local y coordinate of this element using CSS style  
		* @param y Object 
		*/
		setLocalY?( y?:any ): Ext.util.IPositionable;
		/** [Method] Sets the margin on the target element  
		* @param margin Number/String The margin to set. See the margin config. 
		*/
		setMargin?( margin?:any ): any;
		setMargin?( margin?:number ): void;
		setMargin?( margin?:string ): void;
		/** [Method] Sets the element s position and size to the specified region  
		* @param region Ext.util.Region The region to fill 
		* @param animate Boolean/Object true for the default animation or a standard Element animation config object 
		*/
		setRegion?( region?:Ext.util.IRegion, animate?:any ): Ext.util.IPositionable;
		/** [Method] Sets the width and height of this Component  
		* @param width Number/String/Object The new width to set. This may be one of:  A Number specifying the new width in the Element's Ext.Element.defaultUnits (by default, pixels). A String used to set the CSS width style. A size object in the format {width: widthValue, height: heightValue}. undefined to leave the width unchanged.  
		* @param height Number/String The new height to set (not required if a size object is passed as the first arg). This may be one of:  A Number specifying the new height in the Element's Ext.Element.defaultUnits (by default, pixels). A String used to set the CSS height style. Animation may not be used. undefined to leave the height unchanged.  
		*/
		setSize?( width?:any, height?:any ): any;
		setSize?( width?:any, height?:number ): Ext.IComponent;
		setSize?( width?:any, height?:string ): Ext.IComponent;
		/** [Method] Sets the UI for the component  
		* @param ui String The new UI for the component. 
		*/
		setUI?( ui?:string ): void;
		/** [Method] Convenience function to hide or show this component by Boolean  
		* @param visible Boolean true to show, false to hide. 
		*/
		setVisible?( visible?:bool ): Ext.IComponent;
		/** [Method] Sets the width of the component  
		* @param width Number The new width to setThis may be one of:  A Number specifying the new width in the Element's Ext.Element.defaultUnits (by default, pixels). A String used to set the CSS width style.  
		*/
		setWidth?( width?:number ): Ext.IComponent;
		/** [Method] Sets the X position of the DOM element based on page coordinates  
		* @param x Object 
		* @param animate Object 
		*/
		setX?( x?:any, animate?:any ): Ext.util.IPositionable;
		/** [Method] Sets the position of the DOM element in page coordinates  
		* @param xy Object 
		* @param animate Object 
		*/
		setXY?( xy?:any, animate?:any ): Ext.util.IPositionable;
		/** [Method] Sets the Y position of the DOM element based on page coordinates  
		* @param y Object 
		* @param animate Object 
		*/
		setY?( y?:any, animate?:any ): Ext.util.IPositionable;
		/** [Method] Stops any running effects and clears this object s internal effects queue if it contains any additional effects that */
		stopAnimation?(): Ext.IElement;
		/** [Method] Stops any running effects and clears this object s internal effects queue if it contains any additional effects that */
		stopFx?(): Ext.IElement;
		/** [Method] Suspends firing of the named event s 
		* @param eventName String... Multiple event names to suspend. 
		*/
		suspendEvent?( ...eventName:any[] ): void;
		/** [Method] Suspends the firing of all events  
		* @param queueSuspended Boolean Pass as true to queue up suspended events to be fired after the resumeEvents call instead of discarding all suspended events. 
		*/
		suspendEvents?( queueSuspended?:bool ): void;
		/** [Method] Ensures that all effects queued after syncFx is called on this object are run concurrently  */
		syncFx?(): any;
		/** [Method] Translates the passed page coordinates into left top css values for the element 
		* @param x Number/Array The page x or an array containing [x, y] 
		* @param y Number The page y, required if x is not an array 
		*/
		translatePoints?( x?:any, y?:any ): any;
		translatePoints?( x?:number, y?:number ): any;
		translatePoints?( x?:any[], y?:number ): any;
		/** [Method] Shorthand for removeListener  
		* @param eventName String The type of event the handler was associated with. 
		* @param fn Function The handler to remove. This must be a reference to the function passed into the Ext.util.Observable.addListener call. 
		* @param scope Object The scope originally specified for the handler. It must be the same as the scope argument specified in the original call to Ext.util.Observable.addListener or the listener will not be removed. 
		*/
		un?( eventName?:string, fn?:any, scope?:any ): void;
		/** [Method] Navigates up the ownership hierarchy searching for an ancestor Container which matches any passed simple selector or 
		* @param selector String/Ext.Component The simple selector component or actual component to test. If not passed the immediate owner/activater is returned. 
		* @param limit String/Number/Ext.Component This may be a selector upon which to stop the upward scan, or a limit of teh number of steps, or Component reference to stop on. 
		*/
		up?( selector?:any, limit?:any ): any;
		up?( selector?:string, limit?:string ): Ext.container.IContainer;
		up?( selector?:Ext.IComponent, limit?:string ): Ext.container.IContainer;
		up?( selector?:string, limit?:number ): Ext.container.IContainer;
		up?( selector?:Ext.IComponent, limit?:number ): Ext.container.IContainer;
		up?( selector?:string, limit?:Ext.IComponent ): Ext.container.IContainer;
		up?( selector?:Ext.IComponent, limit?:Ext.IComponent ): Ext.container.IContainer;
		/** [Method] Update the content area of a component  
		* @param htmlOrData String/Object If this component has been configured with a template via the tpl config then it will use this argument as data to populate the template. If this component was not configured with a template, the components content area will be updated via Ext.Element update. 
		* @param loadScripts Boolean Only legitimate when using the html configuration. 
		* @param callback Function Only legitimate when using the html configuration. Callback to execute when scripts have finished loading. 
		*/
		update?( htmlOrData?:any, loadScripts?:bool, callback?:any ): void;
		/** [Method] Updates this component s layout  
		* @param options Object An object with layout options. 
		*/
		updateLayout?( options?:any ): void;
		/** [Method] Cancels layout of a component  
		* @param comp Ext.Component 
		*/
		cancelLayout?( comp?:Ext.IComponent ): void;
		/** [Method] Performs all pending layouts that were scheduled while suspendLayouts was in effect  */
		flushLayouts?(): void;
		/** [Method] Resumes layout activity in the whole framework  
		* @param flush Boolean true to perform all the pending layouts. This can also be achieved by calling flushLayouts directly. 
		*/
		resumeLayouts?( flush?:bool ): void;
		/** [Method] Stops layouts from happening in the whole framework  */
		suspendLayouts?(): void;
	}
}
declare module Ext {
	export interface IAbstractManager extends Ext.IBase {
		/** [Property] (Ext.util.HashMap) */
		all?: Ext.util.IHashMap;
		/** [Method] Creates and returns an instance of whatever this manager manages based on the supplied type and config object  
		* @param config Object The config object 
		* @param defaultType String If no type is discovered in the config object, we fall back to this type 
		*/
		create?( config?:any, defaultType?:string ): any;
		/** [Method] Executes the specified function once for each item in the collection  
		* @param fn Function The function to execute. 
		* @param scope Object The scope to execute in. Defaults to this. 
		*/
		each?( fn?:any, scope?:any ): void;
		/** [Method] Returns an item by id  
		* @param id String The id of the item 
		*/
		get?( id?:string ): any;
		/** [Method] Gets the number of items in the collection  */
		getCount?(): number;
		/** [Method] Checks if an item type is registered  
		* @param type String The mnemonic string by which the class may be looked up 
		*/
		isRegistered?( type?:string ): bool;
		/** [Method] Registers a function that will be called when an item with the specified id is added to the manager  
		* @param id String The item id 
		* @param fn Function The callback function. Called with a single parameter, the item. 
		* @param scope Object The scope (this reference) in which the callback is executed. Defaults to the item. 
		*/
		onAvailable?( id?:string, fn?:any, scope?:any ): void;
		/** [Method] Registers an item to be managed 
		* @param item Object The item to register 
		*/
		register?( item?:any ): void;
		/** [Method] Registers a new item constructor keyed by a type key  
		* @param type String The mnemonic string by which the class may be looked up. 
		* @param cls Function The new instance class. 
		*/
		registerType?( type?:string, cls?:any ): void;
		/** [Method] Unregisters an item by removing it from this manager 
		* @param item Object The item to unregister 
		*/
		unregister?( item?:any ): void;
	}
}
