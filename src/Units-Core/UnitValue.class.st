"
UnitValue is a number with a unit attached.
See the methods here for more information.

"
Class {
	#name : #UnitValue,
	#superclass : #Magnitude,
	#instVars : [
		'unit',
		'value'
	],
	#classVars : [
		'InconsistentUnitsSignal'
	],
	#category : #'Units-Core'
}

{ #category : #'instance creation' }
UnitValue class >> one [
	^1
]

{ #category : #'instance creation' }
UnitValue class >> unit: unit value: value [
	^self basicNew unit: unit value: value
]

{ #category : #accessing }
UnitValue class >> unitFor: object [
	"Some methods in UnitValue (and Number>>#units:) can take either
	 a Unit object, or a symbol representing a unit name, or a UnitValue object.  
	 If it is a symbol, it is sent as a message to Unit class to retrieve the actual 
	 unit object.  If it is a UnitValue, the unitPart is taken."
	
	^object isSymbol
		ifTrue: [Unit perform: object]
		ifFalse: [object unitPart]
]

{ #category : #'instance creation' }
UnitValue class >> zero [
	^0
]

{ #category : #arithmetic }
UnitValue >> % number [
	self shouldNotImplement
]

{ #category : #arithmetic }
UnitValue >> * number [
	^number multiplyByUnit: self
]

{ #category : #mathematical }
UnitValue >> ** exponent [
	^self raisedTo: exponent
]

{ #category : #arithmetic }
UnitValue >> + number [
	^number addToUnit: self
]

{ #category : #arithmetic }
UnitValue >> - number [
	^number subtractFromUnit: self
]

{ #category : #arithmetic }
UnitValue >> / number [
	^number divideIntoUnit: self
]

{ #category : #comparing }
UnitValue >> < number [
	^number lessFromUnit: self
]

{ #category : #comparing }
UnitValue >> = number [
	^number equalFromUnit: self
]

{ #category : #arithmetic }
UnitValue >> @ anObject [
	"Answer a new point with x being the receiver and y anObject."
	
	^Point x: self y: anObject
]

{ #category : #coercing }
UnitValue >> adaptToInteger: rcvr andSend: selector [
	"handle coercion for mixed arithmetic
	 uses the method already present for DD"
	^(self coerce: rcvr) perform: selector with: self
]

{ #category : #coercing }
UnitValue >> adaptToNumber: rcvr andSend: selector [
	"handle coercion for mixed arithmetic
	 uses the method already present for DD"
	^(self coerce: rcvr) perform: selector with: self
]

{ #category : #'double dispatching' }
UnitValue >> addToUnit: unitValue [
	| sum |
	^(self consistentWith: unitValue)
		ifTrue: [
			sum := self uncheckedConvertTo: unitValue.
			sum setValue: unitValue value + sum value.
			sum reduced]
		ifFalse: [unitValue inconsistentUnits: self selector: #+]
]

{ #category : #converting }
UnitValue >> as [
	"Answer a delegate on the receiver #as: to handle the next message."
	
	^MessageDelegate on: [:m | self as: m selector]
]

{ #category : #converting }
UnitValue >> as: anotherUnit [
	"Convert the receiver to have the same units as 'anotherUnit'.  Apply any appropriate
	 scaling factors.  Gives an error if the receiver is not consistent with 'anotherUnit'."
	
	^self convertTo: anotherUnit
]

{ #category : #converting }
UnitValue >> baseUnits [
	"Answer the receiver reduced to base units only."
	^self convertTo: unit baseUnits
]

{ #category : #rounding }
UnitValue >> ceiling [
	^self class
		unit: unit
		value: value ceiling
]

{ #category : #coercing }
UnitValue >> coerce: number [
	^self class
		unit: CompoundUnit null
		value: number
]

{ #category : #consistency }
UnitValue >> consistentWith: anotherUnit [
	^unit consistentWith: anotherUnit unitPart
]

{ #category : #converting }
UnitValue >> convertTo: anotherUnit [
	"Convert the receiver to have the same units as 'anotherUnit'.  Apply any appropriate
	 scaling factors.  Gives an error if the receiver is not consistent with 'anotherUnit'."
	| u |
	u := self class unitFor: anotherUnit.
	^(u consistentWith: unit)
		ifTrue: [u uncheckedConvertFrom: self]
		ifFalse: [self inconsistentUnits: u selector: #convertTo:]
]

{ #category : #printing }
UnitValue >> cssString [
	"CSS is picky about units directly following the value."
	
	|str|
	str := (String new: 20) writeStream.
	self value printOn: str.
	self unit printAbbreviationOn: str.
	^str contents
]

{ #category : #'double dispatching' }
UnitValue >> divideIntoUnit: unitValue [
	"Let the VM check for division by zero."
	^(self class
		unit: (unitValue unit dividedBy: unit)
		value: unitValue value / value) 
			reduced
]

{ #category : #'double dispatching' }
UnitValue >> equalFromUnit: unitValue [
	"Is 'unitValue' equal in magnitude to the receiver?"
	| converted |
	^(self consistentWith: unitValue)
		ifTrue: [
"self halt. *** why? ***"
			converted := self uncheckedConvertTo: unitValue.
			unitValue value = converted value]
		ifFalse: [false]
]

{ #category : #converting }
UnitValue >> factor: unitValue [
	"Factor with respect to another Unit or UnitValue."
	| newUnit |
	newUnit := unit factor: (self class unitFor: unitValue).
	^self convertTo: newUnit
]

{ #category : #rounding }
UnitValue >> floor [
	^self class
		unit: unit
		value: value floor
]

{ #category : #coercing }
UnitValue >> generality [
	^46
]

{ #category : #comparing }
UnitValue >> hash [
	"Answer a SmallInteger whose value is related to the receiver's identity.
	May be overridden, and should be overridden in any classes that define = "

	^self unit hash bitXor: self value hash
]

{ #category : #consistency }
UnitValue >> inconsistentUnits: argument selector: selector [
	self error:
		'Inconsistent units for #', selector, ' between ',
			self printString, ' and ', argument printString
]

{ #category : #testing }
UnitValue >> isZero [
	^unit isZeroAsValue: value
]

{ #category : #'double dispatching' }
UnitValue >> lessFromUnit: unitValue [
	"Does 'unitValue' have a smaller magnitude than us?"
	| converted |
	^(self consistentWith: unitValue)
		ifTrue: [
			converted := self uncheckedConvertTo: unitValue.
			unitValue value < converted value]
		ifFalse: [unitValue inconsistentUnits: self selector: #<]
]

{ #category : #'double dispatching' }
UnitValue >> multiplyByUnit: unitValue [
	^(self class
		unit: (unit multipliedBy: unitValue unit)
		value: unitValue value * value) reduced
]

{ #category : #arithmetic }
UnitValue >> negated [
	^self class
		unit: unit
		value: value negated
]

{ #category : #testing }
UnitValue >> negative [
	^value negative
]

{ #category : #printing }
UnitValue >> printAbbreviatedOn: stream [
	"Print the receiver in abbreviated form."
	
	value printOn: stream.
	stream space.
	unit printAbbreviationOn: stream
]

{ #category : #printing }
UnitValue >> printOn: stream [
	value printOn: stream.
	stream space.
	Unit printAbbreviated
		ifTrue: [unit printAbbreviationOn: stream]
		ifFalse: [unit 
					printFullNameOn: stream
					pluralized: value ~= 1]
]

{ #category : #printing }
UnitValue >> printStringAbbreviated [
	"Answer the print string in abbreviated form."
	
	|str|
	str := (String new: 10) writeStream.
	self printAbbreviatedOn: str.
	^str contents
]

{ #category : #mathematical }
UnitValue >> raisedTo: exponent [
	^self class
		unit: (unit raisedTo: exponent)
		value: (value raisedTo: exponent)
]

{ #category : #converting }
UnitValue >> reduced [
	"If the receiver's units have 'vanished' (e.g., by dividing 2 seconds by 3 seconds),
	 answer the remaining scalar part of the receiver.  Otherwise, answer the receiver
	 unchanged."

	^ unit isNull
		ifTrue: [ value ]
		ifFalse: [ 
			(unit isComplexUnit and: [unit calculateBaseUnits isNull])
				ifTrue: [ value * unit conversionFactor ]
				ifFalse: [ self ] ]
]

{ #category : #rounding }
UnitValue >> roundTo: number [
	^self class
		unit: unit
		value: (value roundTo: number)
]

{ #category : #rounding }
UnitValue >> roundUpTo: number [
	^self class
		unit: unit
		value: (value roundUpTo: number)
]

{ #category : #rounding }
UnitValue >> rounded [
	^self class
		unit: unit
		value: value rounded
]

{ #category : #private }
UnitValue >> setUnit: aUnit [
	"Set the unit."
	
	unit := aUnit
]

{ #category : #private }
UnitValue >> setValue: newValue [
	value := newValue
]

{ #category : #testing }
UnitValue >> sign [
	^value sign
]

{ #category : #mathematical }
UnitValue >> sqrt [
	^self class
		unit: (unit raisedTo: 1/2)
		value: value sqrt
]

{ #category : #accessing }
UnitValue >> storeOn: aStream [
	"Store the code to lookup the receiver instead of for a new instance."
	
	|as|
	as := String new writeStream.
	self unit printAbbreviationOn: as.
	(Unit respondsTo: as contents asSymbol)
		ifTrue: [self value storeOn: aStream.
				aStream
					space;
					nextPutAll: as contents]
		ifFalse: [super storeOn: aStream]
]

{ #category : #'double dispatching' }
UnitValue >> subtractFromUnit: unitValue [
	"Subtract the receiver from the unitValue."
	
	| sum |
	^(self consistentWith: unitValue)
		ifTrue: [
			sum := self uncheckedConvertTo: unitValue.
			sum setValue: unitValue value - sum value.
			sum reduced]
		ifFalse: [unitValue inconsistentUnits: self selector: #-]
]

{ #category : #rounding }
UnitValue >> truncateTo: number [
	^self class
		unit: unit
		value: (value truncateTo: number)
]

{ #category : #rounding }
UnitValue >> truncated [
	^self class
		unit: unit
		value: value truncated
]

{ #category : #private }
UnitValue >> uncheckedConvertTo: anotherUnit [
	^anotherUnit unitPart uncheckedConvertFrom: self
]

{ #category : #accessing }
UnitValue >> unit [
	^unit
]

{ #category : #initialization }
UnitValue >> unit: myUnit value: myValue [
	unit := myUnit.
	value := myValue
]

{ #category : #private }
UnitValue >> unitPart [
	"Answer the unit part of the receiver."
	^unit
]

{ #category : #accessing }
UnitValue >> value [
	"A special interpretation of #value to answer the scalar part of the unit."
	^value
]
