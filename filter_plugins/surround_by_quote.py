#

def surround_by_quote(elements):
	return ['"%s"' % element for element in elements]

class FilterModule(object):
	def filters(self):
		return {
			'surround_by_quote': surround_by_quote
		}