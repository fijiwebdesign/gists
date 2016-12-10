/**
 * Extend Date Object
 */
function XDate() {
  console.log('XDate', this)
  Parent.call(this)
}

XDate.prototype = Parent.prototype

function Parent() {
	this.parent = this
	console.log('parent', this)
}

Parent.prototype.test = function() {
	console.log('prototype.test', this)
}

/**
 * Extend Date Object
 */
function _Date() {
  var x = new (XDate.apply([Date].concat(Array.prototype.slice.call(arguments))))
  return x
}

_Date.prototype.foo = function() {
  return 'bar';
};


var xDate = XDate.bind(Parent)
var xdate = new xDate()
console.log(xdate, xdate.getMonth, xdate.test)

xdate.test()