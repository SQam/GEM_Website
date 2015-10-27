
	EmailList = new Meteor.Collection('subEmails');


if (Meteor.isClient){
console.log("INPUT????");

Template.emailSub.events({
	'click .emailSubmit': function(){
		EmailList.insert({
			subEmail: $('.the_email').val()
		});
		$('.the_email').val('');
		console.log($('.the_email').val());
	}
	
});


}

if (Meteor.isServer){
	
EmailList.allow({
  insert: function (userId, doc) {
    return true;
  }
})
	console.log("nope");

}