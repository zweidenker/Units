"
Temperature units are different because they require
a general linear transformation for basic arithmetic operations.

"
Class {
	#name : #TemperatureBaseUnit,
	#superclass : #BaseUnit,
	#category : #'Units-Core'
}

{ #category : #predicates }
TemperatureBaseUnit >> isZeroAsValue: value [
	^false
]

{ #category : #conversion }
TemperatureBaseUnit >> uncheckedConvertFrom: anotherUnitValue [
	| newValue |
	newValue :=
		(anotherUnitValue value - anotherUnitValue unitPart additiveFactor) *
		(anotherUnitValue unit conversionFactorTo: self).
	^UnitValue unit: self value: newValue
]
