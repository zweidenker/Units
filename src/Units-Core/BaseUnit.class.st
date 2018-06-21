"
This represents one of the SI base units.

By default the following ""official"" units are defined:
	gram
	meter
	second
	candela (light intensity)
	mole (pseudo-dimensionless quantity)
	
Two 'extra' base units are included to demonstrate how to extend the system:
	base pairs (nucleotides on a DNA strand, for automatic analysis)
	donuts (e.g., 1 homer = 8 donuts/minute)

"
Class {
	#name : #BaseUnit,
	#superclass : #NamedUnit,
	#classVars : [
		'SIUnitsByAbbreviation',
		'SIUnitsByName',
		'SIUnitsByPluralName'
	],
	#category : #'Units-Core'
}

{ #category : #initialization }
BaseUnit class >> addUnit: unitName plural: pluralName abbreviation: abbreviation [
	| unit |
	unit := self new
		abbreviation: abbreviation
		name: unitName
		pluralName: pluralName.
	SIUnitsByName at: unitName put: unit.
	SIUnitsByPluralName at: pluralName put: unit.
	SIUnitsByAbbreviation at: abbreviation put: unit.
	^unit
]

{ #category : #'base units' }
BaseUnit class >> ampere [

	^self withSingularName: 'ampere'
]

{ #category : #'base units' }
BaseUnit class >> amperes [

	^self ampere
]

{ #category : #example }
BaseUnit class >> basePair [

	^self withPluralName: 'base pair'
]

{ #category : #example }
BaseUnit class >> basePairs [

	^ self withPluralName: 'base pairs'
]

{ #category : #'base units' }
BaseUnit class >> candela [

	^self withSingularName: 'candela'
]

{ #category : #example }
BaseUnit class >> donut [

	^ self withSingularName: 'donut'
]

{ #category : #example }
BaseUnit class >> donuts [

	^ self donut
]

{ #category : #initialization }
BaseUnit class >> initializeClass [
	"BaseUnit initializeClass."
	"Do not rename this to #initialize."
	PrintAbbreviated := false.  "may as well do it here ..."
	SIUnitsByName := Dictionary new.
	SIUnitsByAbbreviation := Dictionary new.
	SIUnitsByPluralName := Dictionary new.
	self
		addUnit: 'kilogram' plural: 'kilograms' abbreviation: 'kg';
		addUnit: 'metre' plural: 'metres' abbreviation: 'm';
		addUnit: 'second' plural: 'seconds' abbreviation: 's';
		addUnit: 'candela' plural: 'candela' abbreviation: 'cd';
		addUnit: 'mole' plural: 'moles' abbreviation: 'mol';
		addUnit: 'ampere' plural: 'amperes' abbreviation: 'A';
		"Kelvin is defined in subclass"
		addUnit: 'radian' plural: 'radians' abbreviation: 'rad';
		addUnit: 'base pair' plural: 'base pairs' abbreviation: 'BP';  "for DNA"
		addUnit: 'donut' plural: 'donuts' abbreviation: 'donut';
		addUnit: 'volt' plural: 'volts' abbreviation: 'V'
]

{ #category : #'base units' }
BaseUnit class >> kelvin [

	^self withSingularName: 'kelvin'
]

{ #category : #'base units' }
BaseUnit class >> kilogram [

	^self withSingularName: 'kilogram'
]

{ #category : #'base units' }
BaseUnit class >> kilograms [

	^ self kilogram
]

{ #category : #'base units' }
BaseUnit class >> meter [

	^self metre
]

{ #category : #'base units' }
BaseUnit class >> meters [

	^self metre
]

{ #category : #'base units' }
BaseUnit class >> metre [

	^self withSingularName: 'metre'
]

{ #category : #'base units' }
BaseUnit class >> metres [

	^ self metre
]

{ #category : #'base units' }
BaseUnit class >> mole [

	^self withSingularName: 'mole'
]

{ #category : #'base units' }
BaseUnit class >> moles [

	^self mole
]

{ #category : #'base units' }
BaseUnit class >> second [

	^self withSingularName: 'second'
]

{ #category : #'base units' }
BaseUnit class >> seconds [

	^ self second
]

{ #category : #'base units' }
BaseUnit class >> volt [

	^self withSingularName: 'volt'
]

{ #category : #'base units' }
BaseUnit class >> volts [

	^self volt
]

{ #category : #accessing }
BaseUnit class >> withAbbreviation: abbreviation ifAbsent: exceptionBlock [
	^SIUnitsByAbbreviation
		at: abbreviation
		ifAbsent: exceptionBlock
]

{ #category : #accessing }
BaseUnit class >> withPluralName: unitName ifAbsent: exceptionBlock [
	^SIUnitsByPluralName
		at: unitName
		ifAbsent: exceptionBlock
]

{ #category : #accessing }
BaseUnit class >> withSingularName: unitName ifAbsent: exceptionBlock [
	^SIUnitsByName
		at: unitName
		ifAbsent: exceptionBlock
]

{ #category : #conversion }
BaseUnit >> baseUnits [
	"This is already a base unit."
	^self
]

{ #category : #consistency }
BaseUnit >> consistentWith: unit [
	^unit consistentWithBaseUnit: self
]

{ #category : #consistency }
BaseUnit >> consistentWithBaseUnit: unit [
	^self == unit
]

{ #category : #consistency }
BaseUnit >> consistentWithComplexUnit: complexUnit [
	^self consistentWith: complexUnit baseUnits
]

{ #category : #conversion }
BaseUnit >> conversionFactor [
	^1.  "by definition"
]

{ #category : #predicates }
BaseUnit >> isBaseUnit [
	^true
]

{ #category : #printing }
BaseUnit >> storeOn: aStream [
	"Store the code to lookup the receiver instead of for a new instance."
	
	aStream
		nextPutAll: '(BaseUnit withPluralName: ''';
		nextPutAll: self pluralName;
		nextPutAll: ''')'
]
