#!/usr/bin/env node

var fs = require('fs');
var layout = fs.readFileSync(process.argv[2], 'utf8');
var doc;
if (process.argv[3]) {
  doc = fs.readFileSync(process.argv[3], 'utf8');
}
else {
  doc = fs.readFileSync('/dev/stdin', 'utf8');
}

// Generate the table of contents.
var toc = '<ul class="nav nav-list">';
var sectionRegex = /<h2>(.*?)<\/h2>([\s\S]*?(?=(?:<h2>|$)))/gi;
var subsectionRegex = /<h3>(.*?)<\/h3>/gi;

function getid(title) {
  return title.replace(' ', '-').toLowerCase();
}

doc = doc.replace(sectionRegex, function (match, section, contents) {
  var sid = getid(section);

  toc += '<li><a href="#' + sid + '">' + section + '</a><ul class="nav nav-list">';

  contents = contents.replace(subsectionRegex, function (match, subsection) {
    var ssid = getid(subsection);
    toc += '<li><a href="#' + ssid + '">' + subsection + '</a></li>';
    return '<h3 id="' + ssid + '">' + subsection + '</h3>';
  });

  toc += '</ul></li>';

  return '<h2 id="' + sid + '">' + section + '</h2>' + contents;
});

toc += '</ul>';

// Replace placeholders and write to stdout.
var output = layout
  .replace('<%= content %>', doc)
  .replace('<%= toc %>', toc);

process.stdout.write(output);
