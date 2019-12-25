require 'minitest/autorun'
require 'nik_parser'

class NIKParserTest < Minitest::Test
  def test_valid_nik
    nik = "3204110609970004"
    expected_json = {
      "nik": nik,
      "region": {
        "province": "JAWA BARAT",
        "regency": "KAB. BANDUNG",
        "district": "KATAPANG"
      },
      "sex": "M",
      "birth": {
        "date": "06",
        "month": "09",
        "year": "1997"
      },
      "uniqcode": "0004"
    }

    my_parser = NIKParser.new
    nik_data = my_parser.parse(nik)
    assert_equal nik_data, expected_json
  end

  def test_invalid_length_nik
    nik = "085229330085"
    my_parser = NIKParser.new
    assert_nil my_parser.parse(nik)
  end
end
