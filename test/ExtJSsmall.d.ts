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
	}
}
