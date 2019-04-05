const mediumToMarkdown = require('medium-to-markdown');
 
// Enter url here
let postUrl = 'https://medium.com/@cjkaminer/creating-and-maintaining-password-security-with-bcrypt-8adff597288e'
mediumToMarkdown.convertFromUrl(postUrl)
.then(function (markdown) {
  console.log(markdown); //=> Markdown content of medium post
});