// This file is automatically included by javascript_include_tag :defaults

// Last FM
function extract_track_data(track) {
  return {
    'name':   $('name', track).text(),
    'url':    $('url', track).text(),
    'album':  $('album', track).text() == ('' ? '' : ' - ') + $('album', track).text(),
    'artist': $('artist', track).text(),
    'artist_url': /^(http.*?)\/_\//.exec($('url', track).text())[1]
  };
}  
function show_recent_tracks(xml) {
  var tracks = $.makeArray($('track', xml).map(function() {
    return extract_track_data(this);
  }));
  $('.last-fm .charts').empty().tplAppend(tracks.slice(0, 4), function() {
    return ['li', {}, [
      'a', {href: this.url}, this.name,
      'span', {'class': 'artist-album'}, [
        'span', {'class': 'artist'}, ['a', {href: this.artist_url}, this.artist],
        'span', {'class': 'album'}, this.album
      ]
    ]];
  });
}

// Twitter
google.load("feeds", "1");
function init_twit() {
    var twitter_feed = new google.feeds.Feed("http://search.twitter.com/search.atom?q=from%3Aceedub");
    twitter_feed.load(function(result) {
      if (!result.error) {
        $('#twitter_update_list').empty().tplAppend(result.feed.entries, function() {
          return ['li', {}, [
            'span', {}, this.content,
            'a', {
              "href": this.link, 
              "class": 'timestamp', 
              "title": new Date(this.publishedDate).toISOString()
            }, this.publishedDate
          ]];
        });
        $('#twitter_update_list a[class*=timestamp]').timeago();
      }
    });
}
