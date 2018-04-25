#!/usr/bin/env ruby -w
## -*- encoding: utf-8 -*-
require 'logger'

@logger = Logger.new(STDOUT)
@logger.level = Logger::DEBUG

def parse_number(num)
  replacements = { '1' => 'one#', '2' => 'two#', '3' => 'three#',
                   '4' => 'four#', '5' => 'five#', '6' => 'six#',
                   '7' => 'seven#', '8' => 'eight#', '9' => 'nine#',
                   '0' => 'zero#' }
  num = num.gsub(Regexp.union(replacements.keys), replacements)
  @logger.debug("Parsed : #{num.chomp}")
  mesures = ['hundred of billions', 'ten of billions,', 'billions,',
             'hundred of millions,', 'tens of millions,', 'millions,',
             'hundred of thousands,', 'tens of thousands,', 'thousands,',
             'hundred,', 'decimals,', 'units,', ''].reverse
  parsed = num.split(/#/)
  mesures[0, parsed.length + 1].zip parsed.reverse
end

number_to_parse = ARGV[0]

res = parse_number(number_to_parse).join(' ').squeeze(' ')
res.tr! ',', "\t"
puts res
