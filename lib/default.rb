# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

include Nanoc3::Helpers::Filtering

class SrcFilter < Nanoc3::Filter
	identifier :src_filter

	def run(content, params={})
		content.gsub!('"', '\"')
		'<div class="codebox">' + `echo "#{content}" | source-highlight --src-lang ruby --out-format html` + '</div>'
	end
end
