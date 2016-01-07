# After tutorial at http://kschiess.github.io/parslet/get-started.html

require 'parslet'

class ExcelParser < Parslet::Parser
  rule(:space)      { match('\s').repeat(1) }
  rule(:space?)     { space.maybe }

  rule(:equal)      { str('=') >> space? }

  rule(:cell) do
    match['a-zA-Z'].repeat(1).as(:col) >> match['0-9'].repeat(1).as(:row)
  end

  rule(:expression) { equal >> cell.as(:cell) }

  root :expression
end

def parse input
  begin
    parser = ExcelParser.new

    parser.parse(input)
  rescue Parslet::ParseFailed => failure
    puts failure.cause.ascii_tree
  end
end
