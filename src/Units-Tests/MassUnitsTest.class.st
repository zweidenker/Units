Class {
	#name : #MassUnitsTest,
	#superclass : #TestCase,
	#category : #'Units-Tests'
}

{ #category : #tests }
MassUnitsTest >> testAddingGrams [
	self assert: 1g + 1g equals: 2g.
	self assert: (1 units: #g) + 1g equals: 2g.
	self assert:  (1 units: #g) + (1 units: #g) equals: 2g.
	
	self deny: 1g + 1g equals: 1g.
	self deny: (1 units: #g) + 1g equals: 1g.
	self deny: (1 units: #g) + (1 units: #g) equals: 1g
]

{ #category : #tests }
MassUnitsTest >> testAddingGramsAndKilograms [
	self assert: 1g + 1kg equals: 1001g.
	self assert: (1 units: #g) + 1kg equals: 1001g.
	self assert:  (1 units: #g) + (1 units: #kg) equals: 1001g.
	
	self deny: 1g + 1kg equals: 1g.
	self deny: (1 units: #g) + 1kg equals: 1g.
	self deny: (1 units: #g) + (1 units: #kg) equals: 1g.
	
	self assert: 1kg + 1g equals: 1001g.
	self assert: (1 units: #kg) + 1g equals: 1001g.
	self assert:  (1 units: #kg) + (1 units: #g) equals: 1001g.
	
	self deny: 1kg + 1g equals: 1kg.
	self deny: (1 units: #kg) + 1g equals: 1kg.
	self deny: (1 units: #kg) + (1 units: #g) equals: 1kg.
]

{ #category : #tests }
MassUnitsTest >> testAddingGramsAndMilligrams [
	self assert: 1g + 1mg equals: 1001mg.
	self assert: (1 units: #g) + 1mg equals: 1001mg.
	self assert:  (1 units: #g) + (1 units: #mg) equals: 1001mg.
	
	self deny: 1g + 1mg equals: 1g.
	self deny: (1 units: #g) + 1mg equals: 1g.
	self deny: (1 units: #g) + (1 units: #mg) equals: 1g.
	
	self assert: 1mg + 1g equals: 1001mg.
	self assert: (1 units: #mg) + 1g equals: 1001mg.
	self assert:  (1 units: #mg) + (1 units: #g) equals: 1001mg.
	
	self deny: 1mg + 1g equals: 1mg.
	self deny: (1 units: #mg) + 1g equals: 1mg.
	self deny: (1 units: #mg) + (1 units: #g) equals: 1mg
]

{ #category : #tests }
MassUnitsTest >> testFactor [
	self assert: (1g factor: Unit g) equals: 1g.
	self assert: (1g factor: Unit kg) equals: 1g.
	self assert: (1g factor: Unit mg) equals: 1g.
	
	self assert: (1g/1L factor: Unit mole) equals: 1000g/(1m*1m*1m)
]

{ #category : #tests }
MassUnitsTest >> testGramAndKilogramEquality [
	self assert: 1000g equals: 1kg.
	self assert: (1000 units: #g) equals: 1kg.
	self assert: (1000 units: #g) equals: (1 units: #kg).
	
	self deny: 100g equals: 1kg.
	self deny: (100 units: #g) equals: 1kg.
	self deny: (100 units: #g) equals: (1 units: #kg)
]

{ #category : #tests }
MassUnitsTest >> testGramAndKilogramInferiority [
	self assert: 1000g < 15kg.
	self assert: (1000 units: #g) < 15kg.
	self assert:  (1000 units: #g) < (15 units: #kg).
	
	self deny: 15000g < 1kg.
	self deny: (15000 units: #g) < 1kg.
	self deny: (15000 units: #g) < (1 units: #kg)
]

{ #category : #tests }
MassUnitsTest >> testGramAndKilogramSuperiority [
	self assert: 15000g > 1kg.
	self assert: (15000 units: #g) > 1kg.
	self assert: (15000 units: #g) > (1 units: #kg).
	
	self deny: 1g > 15kg.
	self deny: (1 units: #g) > 1kg.
	self deny:  (1 units: #g) > (1 units: #kg)
]

{ #category : #tests }
MassUnitsTest >> testGramAndMilligramEquality [
	self assert: 1g equals: 1000mg.
	self assert: (1 units: #g) equals: 1000mg.
	self assert: (1 units: #g) equals: (1000 units: #mg).
	
	self deny: 1g equals: 100mg.
	self deny: (1 units: #g) equals: 100mg.
	self deny: (1 units: #g) equals: (100 units: #mg)
]

{ #category : #tests }
MassUnitsTest >> testGramAndMilligramInferiority [
	self assert: 1g < 15000mg.
	self assert: (1 units: #g) < 15000mg.
	self assert:  (1 units: #g) < (15000 units: #mg).
	
	self deny: 1g < 100mg.
	self deny: (1 units: #g) < 100mg.
	self deny: (1 units: #g) < (100 units: #mg)
]

{ #category : #tests }
MassUnitsTest >> testGramAndMilligramSuperiority [
	self assert: 15g > 1000mg.
	self assert: (15 units: #g) > 1000mg.
	self assert: (15 units: #g) > (1000 units: #mg).
	
	self deny: 1g > 1000mg.
	self deny: (1 units: #g) > 1000mg.
	self deny:  (1 units: #g) > (1000 units: #mg)
]

{ #category : #tests }
MassUnitsTest >> testGramEquality [
	self assert: 15g equals: 15g.
	self assert: (15 units: #g) equals: 15g.
	self assert: (15 units: #g) equals: (15 units: #g).

	self deny: 1g equals: 15g.
	self deny: (1 units: #g) equals: 15g.
	self deny: (1 units: #g) equals: (15 units: #g)
]

{ #category : #tests }
MassUnitsTest >> testGramInferiority [
	self assert: 1g < 15g.
	self assert: (1 units: #g) < 15g.
	self assert:  (1 units: #g) < (15 units: #g).
	
	self deny: 15g < 1g.
	self deny: (15 units: #g) < 1g.
	self deny: (15 units: #g) < (1 units: #g)
]

{ #category : #tests }
MassUnitsTest >> testGramSuperioriority [
	self assert: 15g > 1g.
	self assert: (15 units: #g) > 1g.
	self assert: (15 units: #g) > (1 units: #g).
	
	self deny: 1g > 15g.
	self deny: (1 units: #g) > 15g.
	self deny:  (1 units: #g) > (15 units: #g)
]
