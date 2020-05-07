require 'open-uri'
require 'nokogiri'
require 'activerecord-import'

class UpdateDbJob
  include SuckerPunch::Job

  def get_xml
    xml = Nokogiri::XML(open("http://www.cbr.ru/scripts/XML_daily.asp"), nil, 'windows-1251')
  end

  def parse_xml(xml)
    valutes = xml.css('Valute')
    data = []
    valutes.each do |valute|
      valute_data = {}

      value = valute.css('Value').text.to_f
      nominal = valute.css('Nominal').text.to_i
      rate = (value / nominal).round(2)

      valute_data['name'] = valute.css('Name').text
      valute_data['rate'] = rate

      data.push(valute_data)
    end
    return data
  end

  def fill_database(data)
    Currency.import data, on_duplicate_key_update: {conflict_target: [:name], columns: [:rate] }
  end

  def perform
    xml = get_xml
    data = parse_xml(xml)
    fill_database(data)
  end
end
