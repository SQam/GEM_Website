if (Meteor.isClient){
	console.log("INPUT???");
	
}

if (Meteor.isServer){

EmailList = new Meteor.Collection('subEmail');
EmailList.insert({
			subEmails: "jo@gmail.com"
		});
		
		
console.log("Made???")
}