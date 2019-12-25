Parse Indonesian citizenship registration number aka NIK -Nomor Induk Kependudukan

### Usage

```
my_parser = NIKParser.new
my_parser.parse("3204110609970004")
```
Response

```
{
  "nik": "3204110609970004",
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
```
