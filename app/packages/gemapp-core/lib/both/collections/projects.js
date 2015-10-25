Projects = new Mongo.Collection("projects");

Projects.attachSchema(new SimpleSchema({
  title: {
    type: String,
    label: "Title",
    max: 200
  },
  author: {
    type: String,
    label: "Author"
  },
  summary: {
    type: String,
    label: "Brief summary",
    optional: true,
    max: 1000
  }
}));
Projects.insert({title: "Hello, world", author: "Blake", summary: "summ"})

Meteor.startup(function () {
  //Projects.allow({
  //  insert: Users.is.adminById,
  //  update: Users.is.adminById,
  //  remove: Users.is.adminById
  //});

  //Meteor.methods({
  //  insertPage: function(pageTitle, pageContent){
  //    check(pageTitle, String);
  //    check(pageContent, String);
  //    return Feeds.insert({title: pageTitle, content: pageContent});
  //  }
  //});
});

