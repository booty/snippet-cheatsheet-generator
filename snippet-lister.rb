require 'nokogiri'
require 'debugger'

OUTPUT_FILE = 'rails-snippets.html'
PATH_TO_SCAN = 'Rails'

HTML_HEADER = <<-HTML_HEADER 
<!DOCTYPE html>
<html>
  <head>
    <title>Sublime - Ruby Snippets</title>
    <style type="text/css">
      table {
        border-collapse: collapse;
      }

      td {
        vertical-align: top;
        padding-right: 2em;
      }

      td:nth-child(2) {
        font-weight: bold;
      }

      td:nth-child(3) {
        font-family: monospace;
        padding-right: 0;
        width: 500px
      }

      tr {

      }

      tr:nth-child(even) {
        background-color: #ebebeb
      }
    </style>
  </head>
  <body>
    <table>
      <tr>
HTML_HEADER

HTML_FOOTER = <<-HTML_FOOTER
      </tr>
    </table>
  </body>
</html>
HTML_FOOTER


File.open(OUTPUT_FILE,'w') do |output_file|
  output_file.puts HTML_HEADER

  Dir.glob(File.join(PATH_TO_SCAN,'*.sublime-snippet')).each do |input_file|
    File.open(input_file) do |f|  
      doc = Nokogiri::XML(f)
      #debugger if doc.xpath("//snippet//content").inner_text["DelegateClass"]
      output_file.puts "<tr>"
      output_file.puts "<td>#{doc.xpath("//snippet//description").inner_text.gsub(/…/,'&hellip;').gsub(/[’‘]/,"'")}</td>"
      output_file.puts "<td>#{doc.xpath("//snippet//tabTrigger").inner_text}&rarr;</td>"
      output_file.puts "<td>#{doc.xpath("//snippet//content").inner_text.gsub(/^[\s]*$\n/,'').gsub(/\n/,"<br>\n").gsub(/\t/,"&nbsp;&nbsp;&nbsp;")}</td>"
      output_file.puts "</tr>"
    end     
  end
  output_file.puts HTML_FOOTER
end