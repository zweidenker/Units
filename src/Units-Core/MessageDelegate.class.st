"
An object that passes messages on to a private delegate
"
Class {
	#name : #MessageDelegate,
	#superclass : #ProtoObject,
	#instVars : [
		'privateDelegate'
	],
	#category : #'Units-Core'
}

{ #category : #'instance creation' }
MessageDelegate class >> on: anObject [
	"Answer a new instance of the receiver with the given delegate."

	^self new privateDelegate: anObject
]

{ #category : #'system primitives' }
MessageDelegate >> doesNotUnderstand: aMessage [
	"Pass on to the delegate."
	
	^self privateDelegate value: aMessage
]

{ #category : #accessing }
MessageDelegate >> privateDelegate [
	"Answer the value of privateDelegate"

	^ privateDelegate
]

{ #category : #accessing }
MessageDelegate >> privateDelegate: anObject [
	"Set the value of privateDelegate"

	privateDelegate := anObject
]
