Extension { #name : #Point }

{ #category : #'*Units-Core' }
Point >> as [
	"Answer a delegate on the receiver #as: to handle the next message."
	
	^MessageDelegate on: [:m | self as: m selector]
]

{ #category : #'*Units-Core' }
Point >> as: anotherUnit [
	"Convert the receiver to have the same units as 'anotherUnit'.  Apply any appropriate
	 scaling factors.  Gives an error if the receiver's x and y are not consistent with 'anotherUnit'."
	
	^(self x as: anotherUnit) @ (self y as: anotherUnit)
]

{ #category : #'*Units-Core' }
Point >> value [
	"Answer a new point with the x and y being the respective
	values of the receiver's ordinates."
	
	^self x value @ self y value
]
