"
This is a definition of a unit in terms of a product of powers of
other units, plus a scalar value associated with the unit.

Example: 1 inch = 2.54 cm
Note that the ""left side"" is always magnitude 1, which corresponds to 1 unit of the DerivedUnit. 

"
Class {
	#name : #DerivedUnit,
	#superclass : #NamedUnit,
	#instVars : [
		'unitValue'
	],
	#category : #'Units-Core'
}

{ #category : #'instance creation' }
DerivedUnit class >> abbreviation: abbreviation name: unitName pluralName: pluralName value: unitValue [
	| unit |
	unit := super
		abbreviation: abbreviation
		name: unitName
		pluralName: pluralName.
	unit value: unitValue.
	^unit
]

{ #category : #conversion }
DerivedUnit >> baseUnits [
	^unitValue unit baseUnits
]

{ #category : #consistency }
DerivedUnit >> consistentWith: unit [
	"Short-circuit the double dispatching here."
	^unitValue unitPart consistentWith: unit
]

{ #category : #consistency }
DerivedUnit >> consistentWithBaseUnit: baseUnit [
	^baseUnit consistentWith: self unit
]

{ #category : #consistency }
DerivedUnit >> consistentWithComplexUnit: complexUnit [
	^complexUnit consistentWith: self unit
]

{ #category : #consistency }
DerivedUnit >> consistentWithCompoundUnit: compoundUnit [
	^compoundUnit consistentWith: self unit
]

{ #category : #consistency }
DerivedUnit >> consistentWithModifiedUnit: modifiedUnit [
	^modifiedUnit consistentWith: self unit
]

{ #category : #conversion }
DerivedUnit >> conversionFactor [
	^unitValue value * unitValue unit conversionFactor
]

{ #category : #accessing }
DerivedUnit >> unit [
	^unitValue unit
]

{ #category : #initialization }
DerivedUnit >> value: myUnitValue [
	unitValue := myUnitValue
]
