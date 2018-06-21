Extension { #name : #Number }

{ #category : #'*Units-Core' }
Number >> A [

	^self units: #ampere
]

{ #category : #'*Units-Core' }
Number >> C [

	^self units: #coulomb
]

{ #category : #'*Units-Core' }
Number >> F [

	^self units: #farad
]

{ #category : #'*Units-Core' }
Number >> GHz [

	^self units: #gigahertz
]

{ #category : #'*Units-Core' }
Number >> GV [

	^ self units: #gigavolt
]

{ #category : #'*Units-Core' }
Number >> Hz [

	^self units: #hertz
]

{ #category : #'*Units-Core' }
Number >> K [

	^self units: #kelvin
]

{ #category : #'*Units-Core' }
Number >> L [

	^ self units: #litre
]

{ #category : #'*Units-Core' }
Number >> MHz [

	^self units: #megahertz
]

{ #category : #'*Units-Core' }
Number >> MV [

	^ self units: #megavolt
]

{ #category : #'*Units-Core' }
Number >> Mt [

	^self units: #megatonne
]

{ #category : #'*Units-Core' }
Number >> V [

	^self units: #volt
]

{ #category : #'*Units-Core' }
Number >> W [

	^self units: #watt
]

{ #category : #'*Units-Core' }
Number >> a [

	^ self units: #are
]

{ #category : #'*Units-Core' }
Number >> addToUnit: unitValue [

	^unitValue class
		unit: unitValue unit
		value: unitValue value + self
]

{ #category : #'*Units-Core' }
Number >> angstrom [

	^self units: #angstrom
]

{ #category : #'*Units-Core' }
Number >> angstroms [

	^self angstrom
]

{ #category : #'*Units-Core' }
Number >> arcdegree [

	^self units: #arcdegree
]

{ #category : #'*Units-Core' }
Number >> baseUnits [

	^ self
]

{ #category : #'*Units-Core' }
Number >> candela [

	^self units: #candela
]

{ #category : #'*Units-Core' }
Number >> cd [

	^self candela
]

{ #category : #'*Units-Core' }
Number >> celsius [

	^self degreeCelsius
]

{ #category : #'*Units-Core' }
Number >> centimeter [

	^self cm
]

{ #category : #'*Units-Core' }
Number >> centimeters [

	^self cm
]

{ #category : #'*Units-Core' }
Number >> cm [

	^self units: #centimeter
]

{ #category : #'*Units-Core' }
Number >> degreeCelsius [

	^self units: #degreeCelsius
]

{ #category : #'*Units-Core' }
Number >> degreeFahrenheit [

	^self units: #degreeFahrenheit
]

{ #category : #'*Units-Core' }
Number >> degreeKelvin [

	^self kelvin
]

{ #category : #'*Units-Core' }
Number >> divideIntoUnit: unitValue [

	^unitValue class
		unit: unitValue unit
		value: unitValue value / self
]

{ #category : #'*Units-Core' }
Number >> equalFromUnit: unitValue [
	"Is 'unitValue' equal in magnitude to the receiver?"
	
	^unitValue value = self
]

{ #category : #'*Units-Core' }
Number >> fahrenheit [

	^self degreeFahrenheit
]

{ #category : #'*Units-Core' }
Number >> feet [

	^self foot
]

{ #category : #'*Units-Core' }
Number >> foot [

	^self units: #foot
]

{ #category : #'*Units-Core' }
Number >> ft [

	^self foot
]

{ #category : #'*Units-Core' }
Number >> g [

	^self units: #gram
]

{ #category : #'*Units-Core' }
Number >> gigahertz [

	^self units: #gigahertz
]

{ #category : #'*Units-Core' }
Number >> grams [

	^self g
]

{ #category : #'*Units-Core' }
Number >> ha [

	^ self units: #hectare
]

{ #category : #'*Units-Core' }
Number >> hertz [

	^self units: #hertz
]

{ #category : #'*Units-Core' }
Number >> in [

	^self units: #inch
]

{ #category : #'*Units-Core' }
Number >> inches [

	^self in
]

{ #category : #'*Units-Core' }
Number >> kHz [

	^self units: #kilohertz
]

{ #category : #'*Units-Core' }
Number >> kV [
	^self units: #kilovolt
]

{ #category : #'*Units-Core' }
Number >> kW [

	^self units: #kilowatt
]

{ #category : #'*Units-Core' }
Number >> kWh [

	^ (self units: #kilowatt) * (1 units: #hour)
]

{ #category : #'*Units-Core' }
Number >> kelvin [

	^self units: #kelvin
]

{ #category : #'*Units-Core' }
Number >> kg [

	^self units: #kilogram
]

{ #category : #'*Units-Core' }
Number >> kilograms [

	^self kg
]

{ #category : #'*Units-Core' }
Number >> kilohertz [

	^self units: #kilohertz
]

{ #category : #'*Units-Core' }
Number >> kilometer [

	^self kilometre
]

{ #category : #'*Units-Core' }
Number >> kilometers [

	^self kilometre
]

{ #category : #'*Units-Core' }
Number >> kilometre [

	^self units: #kilometre
]

{ #category : #'*Units-Core' }
Number >> km [

	^self kilometre
]

{ #category : #'*Units-Core' }
Number >> lb [

	^self pound
]

{ #category : #'*Units-Core' }
Number >> lessFromUnit: unitValue [
	"Does 'unitValue' have a smaller magnitude than us?"
	
	^unitValue value < self
]

{ #category : #'*Units-Core' }
Number >> liter [

	^self litre
]

{ #category : #'*Units-Core' }
Number >> liters [

	^self litre
]

{ #category : #'*Units-Core' }
Number >> litre [

	^self units: #litre
]

{ #category : #'*Units-Core' }
Number >> m [

	^self metre
]

{ #category : #'*Units-Core' }
Number >> mA [

	^self units: #milliamp
]

{ #category : #'*Units-Core' }
Number >> mV [

	^self units: #millivolt
]

{ #category : #'*Units-Core' }
Number >> megahertz [

	^self units: #megahertz
]

{ #category : #'*Units-Core' }
Number >> megatonne [

	^self units: #megatonne
]

{ #category : #'*Units-Core' }
Number >> meter [

	^self metre
]

{ #category : #'*Units-Core' }
Number >> meters [

	^self metre
]

{ #category : #'*Units-Core' }
Number >> metre [

	^self units: #metre
]

{ #category : #'*Units-Core' }
Number >> mg [

	^self milligram
]

{ #category : #'*Units-Core' }
Number >> mi [

	^ self units: #mile
]

{ #category : #'*Units-Core' }
Number >> milligram [

	^ self units: #milligram
]

{ #category : #'*Units-Core' }
Number >> millimeter [

	^self millimetre
]

{ #category : #'*Units-Core' }
Number >> millimeters [

	^self millimetre
]

{ #category : #'*Units-Core' }
Number >> millimetre [

	^ self units: #millimetre
]

{ #category : #'*Units-Core' }
Number >> mm [

	^self millimetre
]

{ #category : #'*Units-Core' }
Number >> multiplyByUnit: unitValue [

	^unitValue class
		unit: unitValue unit
		value: unitValue value * self
]

{ #category : #'*Units-Core' }
Number >> nV [
	^self units: #nanovolt
]

{ #category : #'*Units-Core' }
Number >> ounce [

	^ self units: #ounce
]

{ #category : #'*Units-Core' }
Number >> oz [

	^self ounce
]

{ #category : #'*Units-Core' }
Number >> pV [
	^self units: #picovolt
]

{ #category : #'*Units-Core' }
Number >> pc [

	^self pica
]

{ #category : #'*Units-Core' }
Number >> pica [

	^ self units: #pica
]

{ #category : #'*Units-Core' }
Number >> pixel [

	^ self units: #pixel
]

{ #category : #'*Units-Core' }
Number >> pixels [

	^ self pixel
]

{ #category : #'*Units-Core' }
Number >> point [

	^ self units: #point
]

{ #category : #'*Units-Core' }
Number >> pound [

	^self units: #pound
]

{ #category : #'*Units-Core' }
Number >> pt [

	^self point
]

{ #category : #'*Units-Core' }
Number >> px [

	^self pixel
]

{ #category : #'*Units-Core' }
Number >> rad [

	^self radian
]

{ #category : #'*Units-Core' }
Number >> radian [

	^self units: #rad
]

{ #category : #'*Units-Core' }
Number >> radians [

	^self rad
]

{ #category : #'*Units-Core' }
Number >> s [

	^ self units: #second
]

{ #category : #'*Units-Core' }
Number >> st [

	^ self stone
]

{ #category : #'*Units-Core' }
Number >> stone [

	^ self units: #stone
]

{ #category : #'*Units-Core' }
Number >> stones [

	^ self st
]

{ #category : #'*Units-Core' }
Number >> subtractFromUnit: unitValue [

	^unitValue class
		unit: unitValue unit
		value: unitValue value - self
]

{ #category : #'*Units-Core' }
Number >> t [

	^ self tonne
]

{ #category : #'*Units-Core' }
Number >> tonne [

	^ self units: #tonne
]

{ #category : #'*Units-Core' }
Number >> tonnes [

	^ self t
]

{ #category : #'*Units-Core' }
Number >> ua [

	^self units: #ua
]

{ #category : #'*Units-Core' }
Number >> units: unitOrSymbol [
	^UnitValue 
		unit: (UnitValue unitFor: unitOrSymbol)
		value: self
]

{ #category : #'*Units-Core' }
Number >> yard [

	^ self units: #yard
]

{ #category : #'*Units-Core' }
Number >> yards [

	^ self yard
]

{ #category : #'*Units-Core' }
Number >> yd [

	^self yard
]

{ #category : #'*Units-Core' }
Number >> µg [

	^ self units: #microgram
]
