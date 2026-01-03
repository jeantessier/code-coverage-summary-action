require 'nokogiri'

class ReportGenerator
  attr_reader :path_prefix

  def initialize(path_prefix)
    @path_prefix = path_prefix
  end

  def generate_report(out)
    Dir.glob("#{path_prefix}**/testCodeCoverageReport.xml")
       .group_by { |name| name.slice(path_prefix.size..).split(%(/), 2).first }
       .each do |group, coverage_report|
         doc = File.open(coverage_report.first) { |f| Nokogiri::XML f }

         out.puts "### #{group}"
         out.puts
         out.puts '| Package | Type | Coverage | Covered | Total | Missed |'
         out.puts '|---------|------|:--------:|:-------:|:-----:|:------:|'

         doc.xpath('//package')
            .sort { |a, b| a[:name] <=> b[:name] }
            .each { |package_node| print_section out, package_node[:name], package_node }

         doc.xpath('report')
            .each { |report_node| print_section out, '_total_', report_node }

         out.puts
       end
  end

  def print_section(out, name, node)
    out.puts "| **#{name.empty? ? '_default_' : name.gsub('/', '.')}** | | | | | |"
    node.xpath('counter').each { |counter_node| print_counter out, counter_node }
    out.puts '| | | | | | |'
  end

  def print_counter(out, counter_node)
    missed = counter_node[:missed].to_i
    covered = counter_node[:covered].to_i
    total = missed + covered

    out.puts "| | #{counter_node[:type].downcase} | #{(covered * 100.0 / total).to_i}% | #{covered} | #{total} | _#{missed}_ |"
  end
end
