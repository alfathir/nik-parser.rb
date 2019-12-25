require 'json'
require 'date'

class NIKParser
  def parse(nik)
    return nil if nik.length != 16

    province_code = nik[0..1]
    regency_code  = nik[0..3]
    district_code = nik[0..5]

    file = File.open "data/indonesian-region.json"
    data = JSON.load file

    province = data["province"][province_code]
    regency = data["regency"][regency_code]
    district = data["district"][district_code]

    is_female = nik[6..7].to_i > 40
    sex = is_female ? "F" : "M"

    current_year = DateTime.now.year.to_s[2,2].to_i
    nik_year = nik[10..11].to_i
    date = is_female ? (nik[6..7].to_i - 40) : nik[6..7]
    month = nik[8..9]
    year = nik_year < current_year ? "20#{nik_year}" : "19#{nik_year}"

    uniqcode = nik[12..16]

    nik = {
      "nik": nik,
      "region": {
        "province": province,
        "regency": regency,
        "district": district
      },
      "sex": sex,
      "birth": {
        "date": date,
        "month": month,
        "year": year
      },
      "uniqcode": uniqcode
    }

    return nik
  end
end
