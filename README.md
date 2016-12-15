# juggling•graphics ✾ a siteswap illustrator ✾

[juggling•graphics](https://juggling.graphics) draws pictures of [siteswaps](https://en.wikipedia.org/wiki/Siteswap), which represent throw and catch order in juggling patterns. You can enter most common notations for two-handed siteswaps, including synchronous and multiplex throws.

![five cycles of the siteswap 423](src/style/juggling-graphics.png "five cycles of 423")

## building

It's a little bit fiddly, but not too bad.

You'll need a copy of the [ANTLR 4 Javascript runtime](https://github.com/antlr/antlr4/blob/master/doc/javascript-target.md) at `src/parser/antlr4/`. Beyond that, assuming you have [node.js](https://nodejs.org/en/) and [CoffeeScript](http://coffeescript.org) installed, and have run `npm update`, things should just work. Maybe.

Run `npm start` for a development server.

To build, you'll need to copy `src/style/favicon.ico` and  and `src/style/juggling-graphics.png` to the `build` folder, then `npm run build`. In addition to the app, this generates `.htaccess` and `cache.manifest` files which probably won't be appropriate for your setup.

## credits

Design and programming by [Greg Phillips](https://last3.in). Linear and circular wave diagrams based on an idea by [Craig Quat](http://quatprops.com).