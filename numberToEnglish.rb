#!/usr/bin/ruby -w

require 'logger'

@logger = Logger.new(STDOUT)
@logger.level = Logger::DEBUG

@replacements = { '1' => 'one#',   '2' => 'two#',   '3' => 'three#',
                  '4' => 'four#',  '5' => 'five#',  '6' => 'six#',
                  '7' => 'seven#', '8' => 'eight#', '9' => 'nine#',
                  '0' => 'zero#' }

@mesures = ['hundred of billions',    'ten of billions,',   'billions,',
            'hundred of millions,',   'tens of millions,',  'millions,',
            'hundred of thousands,',  'tens of thousands,', 'thousands,',
            'hundred,', 'decimals,',  'units,', ''].reverse

def parse_number(num)
  num = num.gsub(Regexp.union(@replacements.keys), @replacements)
  @logger.debug("Parsed : #{num.chomp}")
  parsed = num.split(/#/)
  @mesures[0, parsed.length + 1].zip parsed.reverse
end

number_to_parse = ARGV[0]

res = parse_number(number_to_parse).join(' ').squeeze(' ')
res.tr! ',', "\t"
puts res
