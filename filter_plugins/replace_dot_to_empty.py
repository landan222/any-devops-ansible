#

def replace_dot_to_empty(string):
	string = string.replace(".", "");
	return string

class FilterModule(object):
	def filters(self):
		return {
			'replace_dot_to_empty': replace_dot_to_empty
		}