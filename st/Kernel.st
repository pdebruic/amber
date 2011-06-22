nil subclass: #Object
    aTagBrush append: self asString

	Inspector new 
		inspect: self;
		open
	| variables |
	variables := Dictionary new.
	variables at: '#self' put: self.
	self class instanceVariableNames do: [:each |
		variables at: each put: (self instVarAt: each)].
	anInspector 
		setLabel: self printString;
		setVariables: variables
	
	
	^self

	{'return self.klass'}

	self error: 'Object not indexable'

	{'
	    var value = self[''@''+aString];
	    if(typeof(value) == ''undefined'') {
		return nil;
	    } else {
		return value;
	    }
	'}

	{'self[''@'' + aString] = anObject'}

	{'
	    var value = self[aString];
	    if(typeof(value) == ''undefined'') {
		return nil;
	    } else {
		return value;
	    }
	'}

	{'return self[aString] = anObject'}

    {'delete self[aString]'}

	{'return self == anObject'}

	^(self = anObject) == false

	^Association key: self value: anObject

	^self printString

	^self asString

	{'return JSON.stringify(self._asJSONObject())'}
	| object |
	object := Object new.
	self class instanceVariableNames do: [:each |
		object basicAt: each put: (self instVarAt: each) asJSONObject].
	^object
	^self shallowCopy postCopy

	{'
	    var copy = self.klass._new();
	    for(var i in self) {
		if(/^@.+/.test(i)) {
		    copy[i] = self[i];
		}
	    }
	    return copy;
	'}

	{'	    
	    var copy = self.klass._new();
	    for(var i in self) {
		if(/^@.+/.test(i)) {
		    copy[i] = self[i]._deepCopy();
		}
	    }
	    return copy;
	'}.


	Error signal: aString

	self error: 'This method is a responsibility of a subclass'

	self error: 'This method should not be implemented in ', self class name

	{'try{aBlock()} catch(e) {anotherBlock(e)}'}

	MessageNotUnderstood new
		receiver: self;
		message: aMessage;
		signal

	^self perform: aSymbol withArguments: #()

	^self basicPerform: aSymbol asSelector withArguments: aCollection

    ^self basicPerform: aSymbol withArguments: #()

	{'return self[aSymbol].apply(self, aCollection);'}

	^'a ', self class name

	{'console.log(self)'}

	^(self isMemberOf: aClass)
	    ifTrue: [true]
	    ifFalse: [self class inheritsFrom: aClass]

	^self class = aClass

	^self

	^anotherBlock value

	^aBlock value

	^aBlock value

	^false

	^self isNil not

	^false

	^false

	^false

	^false

	^false

	"no op"
	{'return self.classes()'}
	{'return self.debugMode'}
	{'self.debugMode = aBoolean'}
	{'return self.readJSObject(anObject);'}
	{'return self[aString]'}
	{'return smalltalk'}

	{'return self.className || nil'}

	{'return self.superclass || nil'}

	{'return smalltalk.subclasses(self)'}

	| result |
	result := self subclasses.
	self subclasses do: [:each |
	    result addAll: each allSubclasses].
	^result

	^(Array with: self) addAll: self allSubclasses; yourself

	{'return self.fn.prototype'}

	{'var dict = smalltalk.Dictionary._new();
	var methods = self.fn.prototype.methods;
	for(var i in methods) {
		if(methods[i].selector) {
			dict._at_put_(methods[i].selector, methods[i]);
		}
	};
	return dict'}

	^ClassCategoryReader new
	    class: self category: aString;
	    yourself

	{'self.fn.prototype[aMethod.selector._asSelector()] = aMethod.fn;
	self.fn.prototype.methods[aMethod.selector] = aMethod;
	aMethod.methodClass = self'}

	{'return self.iVarNames'}

    ^(self basicAt: 'comment') ifNil: ['']

    self basicAt: 'comment' put: aString

    ^ClassCommentReader new
	class: self;
	yourself

	{'delete self.fn.prototype[aMethod.selector._asSelector()];
	delete self.fn.prototype.methods[aMethod.selector]'}

    | protocols |
    protocols := Array new.
    self methodDictionary do: [:each |
	    (protocols includes: each category) ifFalse: [
		protocols add: each category]].
    ^protocols sort
	^self basicNew initialize
	{'return new self.fn()'}

	^aClass allSubclasses includes: self
	{'return self.category'}
	{'self.category = aString'}

	{'
		smalltalk[aString] = self;
		delete smalltalk[self.className];
		self.className = aString;
	'}
	^self subclass: aString instanceVariableNames: anotherString category: nil

	^ClassBuilder new
	    superclass: self subclass: aString instanceVariableNames: aString2 category: aString3

	^self name

	^true

	{'return self.instanceClass'}
	ClassBuilder new
	    class: self instanceVariableNames: aCollection

	^self instanceClass name, ' class'

	^true

	^(self basicAt: 'source') ifNil: ['']

	self basicAt: 'source' put: aString

	^(self basicAt: 'category') ifNil: ['']

	self basicAt: 'category' put: aString

	^self basicAt: 'selector'

	self basicAt: 'selector' put: aString

	^self basicAt: 'fn'

	self basicAt: 'fn' put: aBlock

	^self basicAt: 'messageSends'
	^self basicAt: 'methodClass'
	^self basicAt: 'referencedClasses'
 aNumber
	{'return self + aNumber'}
	{'return self - aNumber'}
	{'return self * aNumber'}
	{'return self / aNumber'}
	{'return Math.max(self, aNumber);'}
	{'return Math.min(self, aNumber);'}
	{'return Number(self) == aNumber'}
	{'return self > aNumber'}
	{'return self < aNumber'}
	{'return self >= aNumber'}
	{'return self <= aNumber'}
	{'return Math.round(self);'}
	{'return Math.floor(self);'}
	| array first last count |
	first := self truncated.
	last := aNumber truncated + 1.
	count := 1.
	(first <= last) ifFalse: [self error: 'Wrong interval'].
	array := Array new.
	(last - first) timesRepeat: [
	    array at: count put: first.
	    count := count + 1.
	    first := first + 1].
	^array

	^self printString

	^'(', self printString, ')'

    ^(Random new next * self) truncated + 1

	^Point x: self y: aNumber
	^Point x: self y: self
	^self
	| integer count |
	integer := self truncated.
	count := 1.
	[count > self] whileFalse: [
	    aBlock value.
	    count := count + 1]

	^(self to: aNumber) do: aBlock

	{'return String(self)'}
	^true

	{'clearInterval(Number(self))'}
	{'clearTimeout(Number(self))'}
	{'return Math.PI'}
    aTagBrush appendBlock: self
	| canvas |
	canvas := HTMLCanvas new.
	self value: canvas.
	aJQuery append: canvas

	{'return self.toString()'}
	{'while(self()) {aBlock()}'}
	{'while(!self()) {aBlock()}'}
	self try: self catch: [:error |
	    (error isKindOf: anErrorClass) 
	     ifTrue: [aBlock value: error]
	     ifFalse: [error signal]]
	{'return self();'}
	{'return self(anArg);'}
	{'return self(firstArg, secondArg);'}
	{'return self(firstArg, secondArg, thirdArg);'}
	{'return self.apply(null, aCollection);'}
	{'return setTimeout(self, aNumber)'}
	{'return setInterval(self, aNumber)'}
	{'return Boolean(self == true) == aBoolean'}
	^self
	^self ifTrue: aBlock ifFalse: []

	^self ifTrue: [] ifFalse: aBlock

	^self ifTrue: anotherBlock ifFalse: aBlock

	{'
	    if(self == true) {
		return aBlock();
	    } else {
		return anotherBlock();
	    }
	'}
	^self = true
	    ifTrue: aBlock
	    ifFalse: [false]

	^self = true
	    ifTrue: [true]
	    ifFalse: aBlock

	^self = false

	^self

	^self

	{'return self.toString()'}
	| variables |
	variables := Dictionary new.
	variables at: '#self' put: self.
	variables at: '#year' put: self year.
	variables at: '#month' put: self month.
	variables at: '#day' put: self day.
	variables at: '#hours' put: self hours.
	variables at: '#minutes' put: self minutes.
	variables at: '#seconds' put: self seconds.
	variables at: '#milliseconds' put: self milliseconds.
	anInspector 
		setLabel: self printString;
		setVariables: variables
	
	
	{'return self.getFullYear()'}
	{'return self.getMonth() + 1'}
	{'self.setMonth(aNumber - 1)'}
	^self dayOfWeek
	{'return self.getDay() + 1'}
	{'return self.setDay(aNumber - 1)'}
	self day: aNumber
	{'self.setFullYear(aNumber)'}
	{'return self.getDate()'}
	{'self.setDate(aNumber)'}
	{'return self.getTime()'}
	{'self.setTime(aNumber)'}
	{'self.setHours(aNumber)'}
	{'self.setMinutes(aNumber)'}
	{'self.setSeconds(aNumber)'}
	{'self.setMilliseconds(aNumber)'}
	{'return self.getHours()'}
	{'return self.getMinutes()'}
	{'return self.getSeconds()'}
	{'return self.getMilliseconds()'}
	{'return self - aDate'}
 aDate
	{'return self + aDate'}
	{'return self < aDate'}
	{'return self > aDate'}
	{'self <= aDate'}
	{'self >= aDate'}
	{'return self.toString()'}
	^self time
	{'return self.toDateString()'}
	{'return self.toTimeString()'}
	{'return self.toLocaleString()'}
	^self asMilliseconds
	^self
	^self asString
	{'return new Date(anObject)'}
	"Example: Date fromString('2011/04/15 00:00:00')"
	^self new: aString
	^self fromMilliseconds: aNumber * 1000
	^self new: aNumber
	^self new
	^self today
	| t |
	t := Date now.
	aBlock value.
	^Date now - t
	^self subclass: aString instanceVariableNames: anotherString category: nil

	^ClassBuilder new
	    superclass: self subclass: aString instanceVariableNames: aString2 category: aString3

	^self

	^self

    ^'nil'

	^self ifNil: aBlock ifNotNil: []

	^self

	^aBlock value

	^anotherBlock value

	^true

	^false

	    self error: 'You cannot create new instances of UndefinedObject. Use nil'

	| variables |
	variables := Dictionary new.
	variables at: '#self' put: self.
	self withIndexDo: [:each :i |
		variables at: i put: each].
	anInspector 
		setLabel: self printString;
		setVariables: variables
	self subclassResponsibility

	^self stream

	^self stream

	^self streamClass on: self

	^self class streamClass

	self subclassResponsibility

	aCollection do: [:each |
	    self add: each].
	^aCollection

    self subclassResponsibility

	| array index |
	array := Array new.
	index := 0.
	self do: [:each |
	    index := index + 1.
	    array at: index put: each].
	^array

	^self copy 
	    addAll: aCollection; 
	    yourself

	^self copy add: anObject; yourself

	^self copy addAll: aCollection; yourself

	{'for(var i=0;i<self.length;i++){aBlock(self[i]);}'}

	| newCollection |
	newCollection := self class new.
	self do: [:each |
	    newCollection add: (aBlock value: each)].
	^newCollection

	^self detect: aBlock ifNone: [self errorNotFound]

	{'
		for(var i = 0; i < self.length; i++)
			if(aBlock(self[i]))
				return self[i];
		return anotherBlock();
	'}
    	| first |
    	first := true.
    	self do: [:each |
    	    first
    		ifTrue: [first := false]
    		ifFalse: [anotherBlock value].
    	    aBlock value: each]

	| result |
	result := anObject.
	self do: [:each | 
	    result := aBlock value: result value: each].
	^result

	^self select: [:each | (aBlock value: each) = false]

	| stream |
	stream := self class new writeStream.
	self do: [:each |
	    (aBlock value: each) ifTrue: [
		stream nextPut: each]].
	^stream contents

	self error: 'Object is not in the collection'

	{'
		var i = self.length;
		while (i--) {
			if (smalltalk.send(self[i], "__eq", [anObject])) {return true;}	
		}
		return false
	'}

	^self isEmpty not

	^self size = 0

	    ^Stream

	    ^self new
		add: anObject;
		yourself

	    ^self new
		add: anObject;
		add: anotherObject;
		yourself

	    ^self new
		add: firstObject;
		add: secondObject;
		add: thirdObject;
		yourself

	    ^self new
		addAll: aCollection;
		yourself

	^self at: anIndex ifAbsent: [
	    self errorNotFound]

	self subclassResponsibility
	self subclassResponsibility

	^self at: 1

	^self at: 4

	^self at: self size

	^self at: 2

	^self at: 3

	^self copyFrom: 2 to: self size
	^self copyFrom: 1 to: self size - 1
	^self indexOf: anObject ifAbsent: [self errorNotFound]
	{'for(var i=0;i<self.length;i++){
		if(self[i].__eq(anObject)) {return i+1}
	}
	return aBlock();
	'}
	self remove: self last
	self add: anObject
	self subclassResponsibility

	{'for(var i=0;i<self.length;i++){aBlock(self[i], i+1);}'}
    aTagBrush appendString: self

	| label |
	super inspectOn: anInspector.
	self printString size > 30 
		ifTrue: [label := (self printString copyFrom: 1 to: 30), '...''']
		ifFalse: [label := self printString]. 
	anInspector setLabel: label
    ^JQuery fromString: self

    {'aJQuery._appendElement_(String(self))'}

	{'return self.length'}

	{'return self[anIndex - 1];'}
    	self errorReadOnly

    	(self at: anIndex) ifNil: [aBlock]

	{'return escape(self)'}

	{'return unescape(self)'}
    	self errorReadOnly

    self errorReadOnly

	{'return String(self) == aString'}
	{'return String(self) > aString'}

	{'return String(self) < aString'}

	{'return String(self) >= aString'}

	{'return String(self) <= aString'}
	"If you change this method, change smalltalk.convertSelector too (see js/boot.js file)"

	| selector |
	selector := '_', self.
    	selector := selector replace: ':' with: '_'.
    	selector := selector replace: '[+]' with: '_plus'.
    	selector := selector replace: '-' with: '_minus'.
    	selector := selector replace: '[*]' with: '_star'.
    	selector := selector replace: '[/]' with: '_slash'.
    	selector := selector replace: '>' with: '_gt'.
    	selector := selector replace: '<' with: '_lt'.
    	selector := selector replace: '=' with: '_eq'.
    	selector := selector replace: ',' with: '_comma'.
    	selector := selector replace: '[@]' with: '_at'.
	^selector

	{'
		if(self.search(/^[a-zA-Z0-9_:.$ ]*$/) == -1)
			return "unescape(\"" + escape(self) + "\")";
		else
			return "\"" + self + "\"";
	'}
	{'return self.split(aString)'}
    	^self

	{'return Number(self);'}
    	^PPStringParser new string: self

    	^PPChoiceParser withAll: (self asArray collect: [:each | each asParser])

    	^PPCharacterParser new string: self

	^self
	{'return self + aString'}
	{'return self.substring(anIndex - 1, anotherIndex);'}

    	^self class fromString: self

    	^self shallowCopy

    	self error: 'Object is read-only'

    	^'''', self, ''''

	{'console.log(self)'}

    	^self replaceRegexp: (RegularExpression fromString: aString flag: 'g') with: anotherString

	{'return self.replace(aRegexp, aString);'}

	{'return self.search(aRegexp) != -1'}

    	^true

	    ^StringStream

	{'return ''\n'';'}
	{'return ''\r'';'}

	{'return '' '';'}

	{'return ''\t'';'}
	{'return ''\r\n'';'}

	    {'return new self.fn(aString);'}

	{'return self.length'}
	{'return self[anIndex - 1] = anObject'}

	{'
	    var value = self[anIndex - 1];
	    if(value === undefined) {
		return aBlock();
	    } else {
		return value;
	    }
	'}

	{'self.push(anObject); return anObject;'}

	{'
		for(var i=0;i<self.length;i++) {
			if(self[i] == anObject) {
				self.splice(i,1);
				break;
			}
		}
	'}

	{'self.splice(aNumber - 1,anotherNumber - 1)'}
	^'[', ((self collect: [:each | each asJavascript]) join: ', '),  ']'

	^self collect: [:each | each asJSONObject]
	| newCollection |
	newCollection := self class new.
	self do: [:each | newCollection add: each].
	^newCollection

	| newCollection |
	newCollection := self class new.
	self do: [:each | newCollection add: each deepCopy].
	^newCollection

	| array |
	array := self class new.
	anIndex to: anotherIndex do: [:each |
	    array add: (self at: each)].
	^array

	{'return self.join(aString);'}
    ^self basicPerform: 'sort'

	{'
		return self.sort(function(a, b) {
			if(aBlock(a,b)) {return 1} else {return -1}
		})
	'}
	^self copy sort
	^self copy sorted: aBlock
	{'return self.compile(aString);'}
	{'return self.exec(aString) || nil'}
	{'return self.test(aString);'}
	{'return new RegExp(aString, anotherString);'}

	    ^self fromString: aString flag: ''

	^messageText

	messageText := aString

	{'console.log(self._messageText()); throw(self)'}
	    ^self new
		messageText: aString;
		signal

	key := aKey

	^key

	value := aValue

	^value

	^self class = anAssociation class and: [
	    self key = anAssociation key and: [
		self value = anAssociation value]]

	    ^self new
		key: aKey;
		value: aValue;
		yourself

	| variables |
	variables := Dictionary new.
	variables at: '#self' put: self.
	variables at: '#keys' put: self keys.
	self keysAndValuesDo: [:key :value |
		variables at: key put: value].
	anInspector 
		setLabel: self printString;
		setVariables: variables
	^keys size

	| associations |
	associations := #().
	keys do: [:each |
	    associations add: (Association key: each value: (self at: each))].
	^associations

	^keys copy

    	^keys collect: [:each | self at: each]

	(keys includes: aKey) ifFalse: [keys add: aKey].
	^self basicAt: aKey put: aValue

	^(self keys includes: aKey)
		ifTrue: [self basicAt: aKey]
		ifFalse: aBlock
    	^self at: aKey ifAbsent: [
    	    self at: aKey put: aBlock value]

	^(self basicAt: aKey) ifNotNil: [aBlock value: (self at: aKey)]

	^(self basicAt: aKey)
	    ifNil: anotherBlock
	    ifNotNil: [aBlock value: (self at: aKey)]

	^self at: aKey ifAbsent: [self errorNotFound]
    	self at: anAssociation key put: anAssociation value

    	super addAll: aDictionary associations.
    	^aDictionary

    self removeKey: aKey

    keys remove: aKey

	self class = aDictionary class ifFalse: [^false].
	self associationsDo: [:assoc |
	    (aDictionary at: assoc key ifAbsent: [^false]) = assoc value 
		ifFalse: [^false]].
	^true

	| object |
	object := Object new.
	self keysAndValuesDo: [:key :value |
		object basicAt: key put: value asJSONObject].
	^object
	| copy |
	copy := self class new.
	self associationsDo: [:each |
	    copy at: each key  put: each value].
	^copy

	self shouldNotImplement

	self shouldNotImplement

    	self associations do: aBlock

    	self associationsDo: [:each |
    	    aBlock value: each key value: each value]

    	self values do: aBlock

    	| newDict |
    	newDict := self class new.
    	self keysAndValuesDo: [:key :value |
    	    (aBlock value: value) ifTrue: [newDict at: key put: value]].
    	^newDict

    	| newDict |
    	newDict := self class new.
    	self keysAndValuesDo: [:key :value |
    	    newDict at: key put: (aBlock value: value)].
    	^newDict

	^self values detect: aBlock ifNone: anotherBlock

	^self values includes: anObject

    	super initialize.
    	keys := #()

	self superclass: aClass subclass: aString instanceVariableNames: '' category: nil

	| newClass |
	newClass := self addSubclassOf: aClass named: aString instanceVariableNames: (self instanceVariableNamesFor: aString2).
	self setupClass: newClass.
	newClass category: (aString3 ifNil: ['unclassified'])

	aClass isMetaclass ifFalse: [self error: aClass name, ' is not a metaclass'].
	aClass basicAt: 'iVarNames' put: (self instanceVariableNamesFor: aString).
	self setupClass: aClass

	^(aString tokenize: ' ') reject: [:each | each isEmpty]

	{'smalltalk.addClass(aString, aClass, aCollection);
	    return smalltalk[aString]'}
	{'smalltalk.init(aClass);'}

	class := aClass.
	category := aString

	| nextChunk |
	nextChunk := (chunkParser emptyChunk / chunkParser chunk) parse: aStream.
	nextChunk isEmptyChunk ifFalse: [
	    self compileMethod: nextChunk contents.
	    self scanFrom: aStream].

	super initialize.
	chunkParser := ChunkParser new.

	| method |
	method := Compiler new load: aString forClass: class.
	method category: category.
	class addCompiledMethod: method

	^collection

	collection := aCollection

	^position ifNil: [position := 0]

	position := anInteger

	^streamSize

	streamSize := anInteger

	^self collection
	    copyFrom: 1 
	    to: self streamSize

	^self streamSize

	self position: 0



	self reset.
	self setStreamSize: 0

	[self atEnd] whileFalse: [aBlock value: self next]

	self position: self size

	self position: ((self position + anInteger) min: self size max: 0)

	self position: self position + 1. 
	^collection at: self position

	| tempCollection |
	tempCollection := self collection class new.
	anInteger timesRepeat: [
	    self atEnd ifFalse: [
		tempCollection add: self next]].
	^tempCollection

	^self atEnd ifFalse: [
	    self collection at: self position + 1]

	^self position = self size

	^self position = 0

	^self size = 0

	self position: self position + 1.
	self collection at: self position put: anObject.
	self setStreamSize: (self streamSize max: self position)

	aCollection do: [:each |
	    self nextPut: each]

	    ^self new 
		setCollection: aCollection;
		setStreamSize: aCollection size;
		yourself

	| tempCollection |
	tempCollection := self collection class new.
	anInteger timesRepeat: [
	    self atEnd ifFalse: [
		tempCollection := tempCollection, self next]].
	^tempCollection

	self nextPutAll: aString

	self setCollection: 
	    (self collection copyFrom: 1 to: self position),
	    aString,
	    (self collection copyFrom: (self position + 1 + aString size) to: self collection size).
	self position: self position + aString size.
	self setStreamSize: (self streamSize max: self position)

	^self nextPutAll: String cr
	^self nextPutAll: String crlf
	^self nextPutAll: String lf
	class := aClass

	| nextChunk |
	nextChunk := (chunkParser emptyChunk / chunkParser chunk) parse: aStream.
	nextChunk isEmptyChunk ifFalse: [
	    self setComment: nextChunk contents].

	super initialize.
	chunkParser := ChunkParser new.

    class comment: aString

	{'return Math.random()'}

    ^1 to: anInteger collect: [:each | self next]

	^x
	^y
	y := aNumber
	x := aNumber
	^Point x: self x * aPoint asPoint x y: self y * aPoint asPoint y
 aPoint
	^Point x: self x + aPoint asPoint x y: self y + aPoint asPoint y
	^Point x: self x - aPoint asPoint x y: self y - aPoint asPoint y
	^Point x: self x / aPoint asPoint x y: self y / aPoint asPoint y
	^self
	^self new
		x: aNumber;
		y: anotherNumber;
		yourself
	^selector
	selector := aString
	arguments := anArray
	^arguments
	^self new
		selector: aString;
		arguments: anArray;
		yourself
	^message
	message := aMessage
	^receiver
	receiver := anObject
	^self receiver asString, ' does not understand #', self message selector