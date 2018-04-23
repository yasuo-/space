// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .

$(function () {
  var backendHostUrl = 'http://localhost:3000';

  // Initialize Firebase
  var config = {
    apiKey: "AIzaSyBVpMfOZjxU_64MuDdDVfzVBuD25jpKaS0",
    authDomain: "vast-nectar-108302.firebaseapp.com",
    databaseURL: "https://vast-nectar-108302.firebaseio.com",
    projectId: "vast-nectar-108302",
    storageBucket: "",
    messagingSenderId: "269803112252"
  };

  // This is passed into the backend to authenticate the user.
  var userIdToken = null;

  // Firebase log-in
  function configureFirebaseLogin() {

    firebase.initializeApp(config);

    // [START onAuthStateChanged]
    firebase.auth().onAuthStateChanged(function (user) {
      if (user) {
        $('#logged-out').hide();
        var name = user.displayName;

        /* If the provider gives a display name, use the name for the
        personal welcome message. Otherwise, use the user's email. */
        var welcomeName = name ? name : user.email;

        user.getToken().then(function (idToken) {
          userIdToken = idToken;

          /* Now that the user is authenicated, fetch the notes. */
          fetchNotes();

          $('#user').text(welcomeName);
          $('#logged-in').show();

        });

      } else {
        $('#logged-in').hide();
        $('#logged-out').show();

      }
      // [END onAuthStateChanged]

    });

  }

  // [START configureFirebaseLoginWidget]
  // Firebase log-in widget
  function configureFirebaseLoginWidget() {
    var uiConfig = {
      'signInSuccessUrl': '/',
      'signInOptions': [
        // Leave the lines as is for the providers you want to offer your users.
        // firebase.auth.GoogleAuthProvider.PROVIDER_ID,
        firebase.auth.FacebookAuthProvider.PROVIDER_ID,
        firebase.auth.TwitterAuthProvider.PROVIDER_ID,
        firebase.auth.GithubAuthProvider.PROVIDER_ID,
        firebase.auth.EmailAuthProvider.PROVIDER_ID
      ],
      // Terms of service url
      'tosUrl': '<your-tos-url>',
    };

    var ui = new firebaseui.auth.AuthUI(firebase.auth());
    ui.start('#firebaseui-auth-container', uiConfig);
  }
  // [END configureFirebaseLoginWidget]

  // [START fetchNotes]
  // Fetch notes from the backend.
  function fetchNotes() {
    $.ajax(backendHostUrl + '/callback', {
      /* Set header for the XMLHttpRequest to get data from the web server
      associated with userIdToken */
      headers: {
        'Authorization': 'Bearer ' + userIdToken
      }
    }).then(function (data) {
      $('#notes-container').empty();
      // Iterate over user data to display user's notes from database.
      data.forEach(function (note) {
        $('#notes-container').append($('<p>').text(note.message));
      });
    });
  }
  // [END fetchNotes]

  // [START signOutBtn]
  // Sign out a user
  var signOutBtn = $('#sign-out');
  signOutBtn.click(function (event) {
    event.preventDefault();

    firebase.auth().signOut().then(function () {
      console.log("Sign out successful");
    }, function (error) {
      console.log(error);
    });
  });
  // [END signOutBtn]

  // [START saveNoteBtn]
  // Save a note to the backend
  var saveNoteBtn = $('#add-note');
  saveNoteBtn.click(function (event) {
    event.preventDefault();

    var noteField = $('#note-content');
    var note = noteField.val();
    noteField.val("");

    /* Send note data to backend, storing in database with existing data
    associated with userIdToken */
    $.ajax(backendHostUrl + '/notes', {
      headers: {
        'Authorization': 'Bearer ' + userIdToken
      },
      method: 'POST',
      data: JSON.stringify({
        'message': note
      }),
      contentType: 'application/json'
    }).then(function () {
      // Refresh notebook display.
      fetchNotes();
    });

  });
  // [END saveNoteBtn]

  configureFirebaseLogin();
  configureFirebaseLoginWidget();

});
