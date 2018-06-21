"
Instances of CompoundUnits represent units which are combinations
of base units (only).

Examples of things that are CompoundUnits:
	meters per second
	cubic meters per degree Kelvin
	grams per mole of calcium
	
Examples of things that are not CompoundUnits:
	
	miles per hour
	cubic meters per degree Farenheit
	kilograms per mole

"
Class {
	#name : #CompoundUnit,
	#superclass : #Unit,
	#instVars : [
		'units',
		'exponents'
	],
	#category : #'Units-Core'
}

{ #category : #'instance creation' }
CompoundUnit class >> null [
	"A special CompoundUnit used to coerce numbers into the Unit domain."
	^self
		units: #()
		exponents: #()
]

{ #category : #sorting }
CompoundUnit class >> sortBlock [
	^[:left :right | left abbreviation < right abbreviation]
]

{ #category : #'instance creation' }
CompoundUnit class >> units: units exponents: exponents [
	^self new
		units: units
		exponents: exponents
]

{ #category : #comparing }
CompoundUnit >> = anotherUnit [
	"This is not the same as #consistentWith:, which checks for isomorphism.  This method
	 just checks to see if the receiver and argument have the same units and exponents."
	anotherUnit class == self class ifFalse: [^false].
	^units = anotherUnit snarfUnits
		and: [exponents = anotherUnit snarfExponents]
]

{ #category : #conversion }
CompoundUnit >> baseUnits [
	"The receiver already consists entirely of base units."
	^self
]

{ #category : #consistency }
CompoundUnit >> consistentWith: unit [
	^unit consistentWithCompoundUnit: self
]

{ #category : #consistency }
CompoundUnit >> consistentWithBaseUnit: baseUnit [
	"Always false, because a CompoundUnit must always have a nontrivial set of units."
	^false
]

{ #category : #consistency }
CompoundUnit >> consistentWithComplexUnit: complexUnit [
	^self consistentWith: complexUnit baseUnits
]

{ #category : #consistency }
CompoundUnit >> consistentWithCompoundUnit: compoundUnit [
	"We can check the unit and exponent arrays for equality directly, since the units are assumed to be sorted alphabetically."
	^units = compoundUnit snarfUnits
		and: [exponents = compoundUnit snarfExponents]
]

{ #category : #consistency }
CompoundUnit >> consistentWithModifiedUnit: modifiedUnit [
	"Same as #consistentWithBaseUnit:."
	^false
]

{ #category : #conversion }
CompoundUnit >> conversionFactor [
	^1
]

{ #category : #comparing }
CompoundUnit >> hash [
	^units hash bitXor: exponents hash
]

{ #category : #predicates }
CompoundUnit >> includesNegativeExponents [
	^exponents anySatisfy: [:each | each < 0]
]

{ #category : #predicates }
CompoundUnit >> includesPositiveExponents [
	^exponents anySatisfy: [:each | each > 0]
]

{ #category : #conversion }
CompoundUnit >> inverse [
	^self class
		units: units
		exponents: (exponents collect: [:each | each negated])
]

{ #category : #predicates }
CompoundUnit >> isNull [
	^units isEmpty
]

{ #category : #predicates }
CompoundUnit >> negativeExponentsCount [
	| count |
	count := 0.
	exponents do: [:each | each < 0 ifTrue: [count := count + 1]].
	^count
]

{ #category : #predicates }
CompoundUnit >> positiveExponentsCount [
	| count |
	count := 0.
	exponents do: [:each | each > 0 ifTrue: [count := count + 1]].
	^count
]

{ #category : #conversion }
CompoundUnit >> prefixedBy: prefixName [
	^self error: 'You cannot attach prefixes to compound units.'
]

{ #category : #printing }
CompoundUnit >> printAbbreviationOn: stream [
	| first any count |
	first := true.
	any := false.
	self unitsAndExponentsDo: [:unit :exponent |
		exponent > 0 ifTrue: [
			any := true.
			first ifFalse: [stream nextPut: $*].
			first := false.
			unit printAbbreviationOn: stream.
			exponent ~= 1
				ifTrue: [stream nextPut: $^; print: exponent]]].
	count := self negativeExponentsCount.
	count > 0 ifTrue: [
		any ifFalse: [stream nextPut: $1].
		stream nextPut: $/.
		count > 1 ifTrue: [stream nextPut: $(].
		first := true.
		self unitsAndExponentsDo: [:unit :exponent |
			exponent ~= 1 ifTrue: [
				first ifFalse: [stream nextPut: $*].
				first := false.
				unit printAbbreviationOn: stream.
				exponent < -1 ifTrue: [stream nextPut: $^; print: exponent negated]]].
		count > 1 ifTrue: [stream nextPut: $)]]
]

{ #category : #printing }
CompoundUnit >> printFullNameOn: stream pluralized: pluralized [
	"Print the full name of this unit, pluralized if 'pluralized' is true."
	| positive negative |
	positive := self includesPositiveExponents.
	negative := self includesNegativeExponents.
	positive ifTrue: [
		self 
			printUnitsWhereExponent: [:each | each > 0]
			on: stream
			pluralized: pluralized].
	(negative and: [positive]) ifTrue: [stream space].
	negative ifTrue: [
		stream nextPutAll: 'per '.
		self
			printUnitsWhereExponent: [:each | each < 0]
			on: stream
			pluralized: false]
]

{ #category : #printing }
CompoundUnit >> printUnitsWhereExponent: block on: stream pluralized: pluralized [
	| power first count index thisPlural |
	first := true.
	count := (exponents select: block) size.
	index := 0.
	units with: exponents do: [:unit :exponent |
		(block value: exponent) ifTrue: [
			first ifTrue: [first := false] ifFalse: [stream space].
			index := index + 1.
			thisPlural := pluralized and: [index = count].
			power := exponent abs.
			(power isInteger and: [power <= 3]) ifTrue: [
				power = 2 ifTrue: [stream nextPutAll: 'square '].
				power = 3 ifTrue: [stream nextPutAll: 'cubic ']].
			unit printFullNameOn: stream pluralized: thisPlural.
			(power > 3 or: [power isInteger not]) ifTrue: [
				stream
					nextPut: $^;
					print: power]]]
]

{ #category : #'unit arithmetic' }
CompoundUnit >> raisedTo: exponent [
	^self class
		units: units
		exponents: (exponents collect: [:each | each * exponent])
]

{ #category : #'unit arithmetic' }
CompoundUnit >> reciprocal [
	"Just make a new unit of the same class, with all the exponents negated."
	^self class
		units: units
		exponents: (exponents collect: [:each | each negated])
]

{ #category : #private }
CompoundUnit >> snarfExponents [
	^exponents
]

{ #category : #private }
CompoundUnit >> snarfUnits [
	^units
]

{ #category : #initialization }
CompoundUnit >> units: myUnits exponents: myExponents [
	units := myUnits.
	exponents := myExponents
]

{ #category : #enumerating }
CompoundUnit >> unitsAndExponentsDo: block [
	units with: exponents do: block
]
