module.exports = {
	globDirectory: 'public/',
	globPatterns: [
		'**/*.{PDF,css,ico,png,gif,php,js,json,txt,pdf,config}'
	],
	ignoreURLParametersMatching: [
		/^utm_/,
		/^fbclid$/
	],
	swDest: 'public/sw.js'
};