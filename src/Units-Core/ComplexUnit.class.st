"
This represents a product of one or more different units.
"
Class {
	#name : #ComplexUnit,
	#superclass : #CompoundUnit,
	#instVars : [
		'conversionFactor',
		'cachedBaseUnits'
	],
	#category : #'Units-Core'
}

{ #category : #'instance creation' }
ComplexUnit class >> units: units exponents: exponents [
	"if we have just one exponent of size one, the unit itself is enough"
	(exponents size = 1 and: [exponents first = 1]) ifTrue: [ ^units first ].
	units
		detect: [:each | each isBaseUnit not]
		ifNone: [
			"All the units are base units ... we can use a CompoundUnit instead to save space."
			^CompoundUnit
				units: units
				exponents: exponents].
	^self new
		units: units
		exponents: exponents
]

{ #category : #conversion }
ComplexUnit >> baseUnits [
	"Since base units are expensive to compute for ComplexUnits, they are cached here."
	cachedBaseUnits isNil
		ifTrue: [cachedBaseUnits := self calculateBaseUnits].
	^cachedBaseUnits
]

{ #category : #conversion }
ComplexUnit >> calculateBaseUnits [
	| baseUnits unitDictionary newUnits newExponents scratch |
	unitDictionary := IdentityDictionary new.
	self unitsAndExponentsDo: [:unit :exponent |
		baseUnits := unit baseUnits.
		baseUnits unitsAndExponentsDo: [:subunit :subexponent |
			(unitDictionary includesKey: subunit)
				ifFalse: [
					unitDictionary
						at: subunit
						put: subexponent * exponent]
				ifTrue: [
					unitDictionary
						at: subunit
						put: (unitDictionary at: subunit) + (subexponent * exponent)]]].
	newUnits := OrderedCollection new.
	newExponents := OrderedCollection new.
	(unitDictionary keys asSortedCollection: self class sortBlock) do: [:unit |
		scratch := unitDictionary at: unit.
		scratch isZero ifFalse: [
			newUnits add: unit.
			newExponents add: scratch]].		
	^CompoundUnit
		units: newUnits
		exponents: newExponents
]

{ #category : #consistency }
ComplexUnit >> consistentWith: unit [
	^unit consistentWithComplexUnit: self
]

{ #category : #consistency }
ComplexUnit >> consistentWithBaseUnit: baseUnit [
	"This might be true, since we may be containing non-base units that reduce
	 to the base unit."
	"For example, 'meters * seconds * Hertz' is consistent with 'meters'."
	^self baseUnits consistentWith: baseUnit
]

{ #category : #consistency }
ComplexUnit >> consistentWithComplexUnit: complexUnit [
	^self baseUnits consistentWith: complexUnit baseUnits
]

{ #category : #consistency }
ComplexUnit >> consistentWithCompoundUnit: compoundUnit [
	^self baseUnits consistentWith: compoundUnit
]

{ #category : #consistency }
ComplexUnit >> consistentWithModifiedUnit: modifiedUnit [
	"This might be true, since we may be containing non-base units that reduce to the
	 modified unit."
	"For example, 'moles of hydrogen * seconds * Hertz' is consistent with 'moles of
	 hydrogen'."
	^self baseUnits consistentWith: modifiedUnit
]

{ #category : #conversion }
ComplexUnit >> conversionFactor [
	^conversionFactor
]

{ #category : #testing }
ComplexUnit >> isComplexUnit [
	^ true
]

{ #category : #conversion }
ComplexUnit >> prefixedBy: prefixName [
	^self error: 'You cannot attach prefixes to complex units.'
]

{ #category : #initialization }
ComplexUnit >> units: myUnits exponents: myExponents [
	super units: myUnits exponents: myExponents.
	conversionFactor := 1.
	units with: exponents do: [:unit :exponent |
		conversionFactor := conversionFactor * 
			(unit conversionFactor raisedTo: exponent)]
]
