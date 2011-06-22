Object subclass: #JQuery
    "Append anObject at the end of the element."
    anObject appendToJQuery: self

    "Append anElement at the end of the element.
     Dont't call this method directly, use #append: instead"
    self call: 'append' withArgument: anElement

    aJQuery appendElement: jquery

    self empty.
    self append: anObject

    ^self call: 'empty'
    "Remove an attribute from each element in the set of matched elements."
    ^self call: 'removeAttribute' withArgument: aString

    "Get the value of an attribute for the first element in the set of matched elements."
    ^self call: 'attr' withArgument: aString

    "Get the current value of the first element in the set of matched elements."
    ^self call: 'val'

    self call: 'val' withArgument: aString

	{'return self[''@jquery''].css(aString)'}
    {'self[''@jquery''].css(aString, anotherString)'}

    "Adds the specified class(es) to each of the set of matched elements."
    self call: 'addClass' withArgument: aString

    "Remove a single class, multiple classes, or all classes from each element in the set of matched elements."
    self call: 'removeClass' withArgument: aString

    "Add or remove one or more classes from each element in the set of matched elements, depending on either the class's presence or the value of the switch argument."
    self call: 'toggleClass' withArgument: aString

    "Get the current computed height for the first element in the set of matched elements."
    ^self call: 'height'

    self call: 'height' withArgument: anInteger

    self call: 'width' withArgument: anInteger

    "Get the current computed width for the first element in the set of matched elements."
    ^self call: 'width'

    "Get the current computed height for the first element in the set of matched elements, including padding but not border."
    ^self call: 'innerHeight'

    "Get the current computed width for the first element in the set of matched elements, including padding but not border."
    ^self call: 'innerWidth'

    "Get the current computed height for the first element in the set of matched elements, including padding, border, and optionally margin."
    ^self call: 'outerHeight'

    "Get the current computed width for the first element in the set of matched elements, including padding and border."
    ^self call: 'outerWidth'

    "Get the current y coordinate of the first element in the set of matched elements, relative to the offset parent."
    ^(self call: 'position') basicAt: 'top'

    "Get the current x coordinate of the first element in the set of matched elements, relative to the offset parent."
    ^(self call: 'position') basicAt: 'left'

    "Get the current coordinates of the first element in the set of matched elements, relative to the document."
    ^(self call: 'offset') basicAt: 'left'

    "Get the current coordinates of the first element in the set of matched elements, relative to the document."
    ^(self call: 'offset') basicAt: 'top'

    "Get the current horizontal position of the scroll bar for the first element in the set of matched elements."
    ^self call: 'scrollLeft'

    "Get the current vertical position of the scroll bar for the first element in the set of matched elements."
    ^self call: 'scrollTop'

    self call: 'scrollLeft' withArgument: anInteger

    self call: 'scrollTop' withArgument: anInteger

    self call: 'focus'

    self call: 'show'

    self call: 'hide'

    self call: 'remove'

    "Attach aBlock for anEventString on the element"
    {'self[''@jquery''].bind(anEventString, function(e){aBlock(e, self)})'}

    "Unbind all handlers attached to the event aString"
    self call: 'unbind' withArgument: aString

    jquery := anObject

	{'return self[''@jquery''][aString]()'}
    {'return self[''@jquery''][aString](anObject)'}
    "Determine whether any of the matched elements are assigned the given class."
    ^self call: 'hasClass' withArgument: aString

    | newJQuery |
    {'newJQuery = jQuery(String(aString))'}.
    ^self from: newJQuery

    ^self new
	initializeWithJQueryObject: anObject;
	yourself

	{'return self._from_(jQuery(window))'}
	{'return self._from_(jQuery(body))'}
	{'return self._from_(jQuery(document))'}
    ^settings at: aKey ifAbsent: [nil]

    settings at: aKey put: aValue

    ^self at: 'url'

    self at: 'url' put: aString

    {'jQuery.ajax(self[''@settings''])'}

    super initialize.
    settings := Dictionary new

    ^self new
	url: aString;
	yourself

	| canvas |
	canvas := HTMLCanvas new.
	self value: canvas.
	aJQuery append: canvas

    ^JQuery fromString: self

    {'aJQuery._appendElement_(String(self))'}

    aJQuery appendElement: root element
