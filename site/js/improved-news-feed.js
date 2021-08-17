/* Makes all newsfeed list items lead to their respective articles when clicked on */

(function () {
    
    var feeds = Array.from(document.getElementsByClassName('news-feed'))
    .map(el => Array.from(el.children));

    function getHref(listItem) {
        return listItem.firstChild.querySelector('a').href;
    }

    function link(url) {
        window.location.href = url;
    }

    function addLinks(arr) {
        arr.forEach(el => {
            // add linking behaviour
            el.addEventListener('click', function() {
                link(getHref(el));
            });
            // trigger hover effects for link
            el.addEventListener('mouseover', function() {
                el.firstChild.querySelector('a').classList.add('is-hovered');
            });
            // remove hover effects
            el.addEventListener('mouseout', function() {
                el.firstChild.querySelector('a').classList.remove('is-hovered');
            });
        });
    }

    feeds.forEach(feed => addLinks(feed));
})();