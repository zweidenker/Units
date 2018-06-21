"
A temperature needs an additional ""additive factor"" to handle,
e.g., Celsius to Fahrenheit.

"
Class {
	#name : #TemperatureUnit,
	#superclass : #DerivedUnit,
	#instVars : [
		'additiveFactor'
	],
	#category : #'Units-Core'
}

{ #category : #'instance creation' }
TemperatureUnit class >> abbreviation: abbreviation
name: unitName
pluralName: pluralName
value: unitValue
additiveFactor: additiveFactor [
	| unit |
	unit := super
		abbreviation: abbreviation
		name: unitName
		pluralName: pluralName
		value: unitValue.
	unit additiveFactor: additiveFactor.
	^unit
]

{ #category : #accessing }
TemperatureUnit >> additiveFactor [
	^additiveFactor
]

{ #category : #initialization }
TemperatureUnit >> additiveFactor: myAdditiveFactor [
	additiveFactor := myAdditiveFactor
]

{ #category : #predicates }
TemperatureUnit >> isZeroAsValue: value [
	
]

{ #category : #conversion }
TemperatureUnit >> uncheckedConvertFrom: anotherUnitValue [
	| kelvin newValue |
	^anotherUnitValue unit isBaseUnit
		ifTrue: [
			newValue :=
				(anotherUnitValue value / 
					(self conversionFactorTo: anotherUnitValue unit)) + additiveFactor.
			UnitValue
				unit: self
				value: newValue]
		ifFalse: [
			kelvin := anotherUnitValue uncheckedConvertTo: Unit kelvin.
			kelvin convertTo: self]
]
