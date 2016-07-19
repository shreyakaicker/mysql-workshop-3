 CREATE TABLE Account (    
         id INT AUTO_INCREMENT PRIMARY KEY, 
         email VARCHAR(255),
         password VARCHAR(40),
         createdOn DATETIME,
         modifiedOn DATETIME );
                  
                  
   CREATE TABLE AddressBook (    
         id INT AUTO_INCREMENT PRIMARY KEY, 
         accountId INT,
         name VARCHAR(255),
         createdOn DATETIME,
         modifiedOn DATETIME );
                  
                  
  CREATE TABLE Entry (    
         id INT AUTO_INCREMENT PRIMARY KEY, 
         addressBookId INT,
         firstName VARCHAR(255),
         lastName VARCHAR(255),
         birthday DATETIME,
         type ENUM( "phone", "address" , "electronic-mail" ) 
         );
                  
                   Entry.id is a primary auto-increment key
Entry.type is an ENUM column permitting phone, address and electronic-mail
Address.id is a primary auto-increment key
Address.type is an ENUM column permitting home, work and other
ElectronicMail.id is a primary auto-increment key
ElectronicMail.type is an ENUM column permitting home, work and other
Phone.id is a primary auto-increment key
Phone.type is an ENUM column permitting home, work and other
Phone.subtype is an ENUM column permitting landline, cellular and fax


                
  CREATE TABLE Address (    
         id INT AUTO_INCREMENT PRIMARY KEY, 
         entryId INT,
         type ENUM( "home", "work" , "other" ),
         addressLine1 VARCHAR(255),
         addressLine2 VARCHAR(255),
         city VARCHAR(255),
         province VARCHAR(128),
         country VARCHAR(128),
         postalCode VARCHAR(10)
         
         );
              
              
      CREATE TABLE Phone (    
         id INT AUTO_INCREMENT PRIMARY KEY, 
         entryId INT,
         type ENUM( "home", "work" , "other" ),
         subtype ENUM( "landline", "cellular" , "fax" ),
         content VARCHAR(255)
         
         );
              
                 
      CREATE TABLE ElectronicMail (    
         id INT AUTO_INCREMENT PRIMARY KEY, 
         entryId INT,
         type ENUM( "home", "work" , "other" ),
         content VARCHAR(255)
         
         );
              
              
              Bulk import data from the source files into decodemtl_addressbook:
source data/import-account.sql;
source data/import-addressbook.sql;
source data/import-entry.sql;



Exercise 3

List all of the countries with respective occurence totals in DESC order

mysql> SELECT COUNT(*), country FROM Address GROUP BY country order by count(*) desc;
+----------+----------------------------------------------+
| COUNT(*) | country                                      |
+----------+----------------------------------------------+
|       18 | Mozambique                                   |
|       16 | Saint Helena, Ascension and Tristan da Cunha |
|       15 | United States Minor Outlying Islands         |
|       15 | Canada                                       |
|       15 | Lebanon                                      |
|       15 | Wallis and Futuna                            |
|       15 | Curaçao                                      |
|       15 | Thailand                                     |
|       15 | Argentina                                    |
|       15 | Andorra                                      |
|       14 | Ethiopia                                     |
|       14 | Dominica                                     |
|       14 | Netherlands                                  |
|       14 | United Arab Emirates                         |
|       14 | Congo, the Democratic Republic of the        |
|       14 | Brazil                                       |
|       14 | United Kingdom (Great Britain)               |
|       14 | Sri Lanka                                    |
|       13 | Norfolk Island                               |
|       13 | Aruba                                        |
|       13 | Switzerland                                  |
|       13 | Lithuania                                    |
|       13 | Tonga                                        |
|       13 | French Polynesia                             |
|       13 | Cocos (Keeling) Islands                      |
|       13 | Slovakia                                     |
|       13 | Seychelles                                   |
|       13 | Equatorial Guinea                            |
|       13 | Venezuela                                    |
|       13 | Cook Islands                                 |
|       13 | Mayotte                                      |
|       13 | Liberia                                      |
|       12 | Guinea                                       |
|       12 | Botswana                                     |
|       12 | Grenada                                      |
|       12 | Finland                                      |
|       12 | Syria                                        |
|       12 | Christmas Island                             |
|       12 | Isle of Man                                  |
|       12 | Saint Kitts and Nevis                        |
|       12 | Jordan                                       |
|       12 | Anguilla                                     |
|       12 | Malaysia                                     |
|       12 | Turkey                                       |
|       12 | Senegal                                      |
|       12 | Oman                                         |
|       12 | Ireland                                      |
|       12 | Virgin Islands, United States                |
|       12 | Kazakhstan                                   |
|       12 | Guinea-Bissau                                |
|       11 | Qatar                                        |
|       11 | Djibouti                                     |
|       11 | Mexico                                       |
|       11 | Bouvet Island                                |
|       11 | Lesotho                                      |
|       11 | Panama                                       |
|       11 | Saint Lucia                                  |
|       11 | Latvia                                       |
|       11 | Cambodia                                     |
|       11 | Vanuatu                                      |
|       11 | French Southern Territories                  |
|       11 | Faroe Islands                                |
|       11 | Guernsey                                     |
|       11 | Austria                                      |
|       11 | Guatemala                                    |
|       11 | Philippines                                  |
|       11 | Congo (Brazzaville)                          |
|       11 | Belize                                       |
|       11 | Peru                                         |
|       11 | Tanzania                                     |
|       11 | India                                        |
|       11 | Burundi                                      |
|       11 | Ukraine                                      |
|       11 | Luxembourg                                   |
|       11 | Kiribati                                     |
|       11 | Åland Islands                                |
|       11 | San Marino                                   |
|       11 | Belarus                                      |
|       11 | Turks and Caicos Islands                     |
|       11 | Myanmar                                      |
|       11 | Palau                                        |
|       10 | Guam                                         |
|       10 | Timor-Leste                                  |
|       10 | Madagascar                                   |
|       10 | Zimbabwe                                     |
|       10 | Rwanda                                       |
|       10 | Kuwait                                       |
|       10 | Micronesia                                   |
|       10 | Antigua and Barbuda                          |
|       10 | United States                                |
|       10 | Kyrgyzstan                                   |
|       10 | Dominican Republic                           |
|       10 | Australia                                    |
|       10 | Zambia                                       |
|       10 | Chad                                         |
|       10 | Taiwan                                       |
|       10 | South Africa                                 |
|       10 | Ghana                                        |
|       10 | Indonesia                                    |
|       10 | Benin                                        |
|       10 | Afghanistan                                  |
|       10 | Tunisia                                      |
|       10 | Algeria                                      |
|       10 | Costa Rica                                   |
|       10 | Antarctica                                   |
|       10 | Cape Verde                                   |
|       10 | Tokelau                                      |
|       10 | Cayman Islands                               |
|       10 | Jersey                                       |
|        9 | Albania                                      |
|        9 | Saint Pierre and Miquelon                    |
|        9 | British Indian Ocean Territory               |
|        9 | France                                       |
|        9 | Tuvalu                                       |
|        9 | Bosnia and Herzegovina                       |
|        9 | Israel                                       |
|        9 | Tajikistan                                   |
|        9 | Western Sahara                               |
|        9 | Suriname                                     |
|        9 | Montserrat                                   |
|        9 | Gambia                                       |
|        9 | Uruguay                                      |
|        9 | Swaziland                                    |
|        9 | Armenia                                      |
|        9 | Cyprus                                       |
|        9 | Serbia                                       |
|        9 | Russian Federation                           |
|        9 | Martinique                                   |
|        9 | Turkmenistan                                 |
|        9 | Slovenia                                     |
|        9 | Belgium                                      |
|        9 | Cameroon                                     |
|        9 | Virgin Islands, British                      |
|        9 | Reunion                                      |
|        9 | Cuba                                         |
|        9 | Gibraltar                                    |
|        9 | Bonaire, Sint Eustatius and Saba             |
|        9 | Greenland                                    |
|        9 | Bulgaria                                     |
|        9 | Hungary                                      |
|        9 | Guyana                                       |
|        9 | Bangladesh                                   |
|        9 | Nicaragua                                    |
|        8 | Saint Barthélemy                             |
|        8 | Pitcairn Islands                             |
|        8 | Puerto Rico                                  |
|        8 | Papua New Guinea                             |
|        8 | Bhutan                                       |
|        8 | Azerbaijan                                   |
|        8 | Colombia                                     |
|        8 | Holy See (Vatican City State)                |
|        8 | Italy                                        |
|        8 | Honduras                                     |
|        8 | Sao Tome and Principe                        |
|        8 | Germany                                      |
|        8 | New Caledonia                                |
|        8 | Bermuda                                      |
|        8 | Uzbekistan                                   |
|        8 | Mali                                         |
|        8 | Macedonia                                    |
|        8 | Brunei                                       |
|        8 | Central African Republic                     |
|        8 | Yemen                                        |
|        8 | Eritrea                                      |
|        8 | Côte D'Ivoire (Ivory Coast)                  |
|        8 | Korea, North                                 |
|        8 | Maldives                                     |
|        8 | Georgia                                      |
|        8 | Comoros                                      |
|        8 | Czech Republic                               |
|        8 | Nigeria                                      |
|        8 | Northern Mariana Islands                     |
|        8 | Chile                                        |
|        8 | American Samoa                               |
|        8 | El Salvador                                  |
|        8 | South Sudan                                  |
|        8 | Solomon Islands                              |
|        8 | Estonia                                      |
|        8 | Greece                                       |
|        8 | Iraq                                         |
|        8 | Japan                                        |
|        8 | Uganda                                       |
|        8 | Marshall Islands                             |
|        7 | Heard Island and Mcdonald Islands            |
|        7 | Malta                                        |
|        7 | South Georgia and The South Sandwich Islands |
|        7 | Macao                                        |
|        7 | Egypt                                        |
|        7 | Bahrain                                      |
|        7 | Kenya                                        |
|        7 | Gabon                                        |
|        7 | Barbados                                     |
|        7 | Sierra Leone                                 |
|        7 | Ecuador                                      |
|        7 | Falkland Islands                             |
|        7 | Mauritania                                   |
|        7 | Fiji                                         |
|        7 | Bahamas                                      |
|        7 | Mongolia                                     |
|        7 | Saint Martin                                 |
|        7 | Niue                                         |
|        7 | Iran                                         |
|        7 | Norway                                       |
|        7 | Poland                                       |
|        7 | Singapore                                    |
|        7 | Pakistan                                     |
|        6 | French Guiana                                |
|        6 | Spain                                        |
|        6 | Portugal                                     |
|        6 | Burkina Faso                                 |
|        6 | Namibia                                      |
|        6 | Sudan                                        |
|        6 | Malawi                                       |
|        6 | Viet Nam                                     |
|        6 | Sint Maarten                                 |
|        6 | Libya                                        |
|        6 | Angola                                       |
|        6 | Svalbard and Jan Mayen Islands               |
|        6 | Togo                                         |
|        6 | Somalia                                      |
|        6 | Laos                                         |
|        6 | Morocco                                      |
|        6 | Croatia                                      |
|        6 | Denmark                                      |
|        6 | New Zealand                                  |
|        6 | Guadeloupe                                   |
|        6 | Moldova                                      |
|        6 | Paraguay                                     |
|        6 | China                                        |
|        6 | Romania                                      |
|        6 | Bolivia                                      |
|        5 | Palestine, State of                          |
|        5 | Trinidad and Tobago                          |
|        5 | Nepal                                        |
|        5 | Hong Kong                                    |
|        5 | Korea, South                                 |
|        5 | Monaco                                       |
|        5 | Sweden                                       |
|        5 | Montenegro                                   |
|        5 | Haiti                                        |
|        5 | Nauru                                        |
|        5 | Liechtenstein                                |
|        5 | Samoa                                        |
|        4 | Jamaica                                      |
|        3 | Iceland                                      |
|        3 | Mauritius                                    |
|        3 | Saint Vincent and The Grenadines             |
|        3 | Saudi Arabia                                 |
|        2 | Niger                                        |
+----------+----------------------------------------------+
249 rows in set (0.00 sec)

mysql> 

// in lower case
SELECT COUNT(*), LOWER(country) FROM Address GROUP BY country order by count(*) desc;                                            
+----------+----------------------------------------------+
| COUNT(*) | LOWER(country)                               |
+----------+----------------------------------------------+
|       18 | mozambique                                   |
|       16 | saint helena, ascension and tristan da cunha |
|       15 | thailand                                     |
|       15 | united states minor outlying islands         |
|       15 | andorra                                      |
|       15 | canada                                       |
|       15 | argentina                                    |
|       15 | lebanon                                      |
|       15 | wallis and futuna                            |
|       15 | curaçao                                      |
|       14 | ethiopia                                     |
|       14 | united arab emirates                         |
|       14 | netherlands                                  |
|       14 | brazil                                       |
|       14 | congo, the democratic republic of the        |
|       14 | dominica                                     |
|       14 | united kingdom (great britain)               |
|       14 | sri lanka                                    |
|       13 | norfolk island                               |
|       13 | aruba                                        |
|       13 | venezuela                                    |
|       13 | lithuania                                    |
|       13 | cook islands                                 |
|       13 | french polynesia                             |
|       13 | liberia                                      |
|       13 | equatorial guinea                            |
|       13 | switzerland                                  |
|       13 | tonga                                        |
|       13 | mayotte                                      |
|       13 | slovakia                                     |
|       13 | cocos (keeling) islands                      |
|       13 | seychelles                                   |
|       12 | botswana                                     |
|       12 | guinea                                       |
|       12 | grenada                                      |
|       12 | finland                                      |
|       12 | senegal                                      |
|       12 | oman                                         |
|       12 | ireland                                      |
|       12 | christmas island                             |
|       12 | kazakhstan                                   |
|       12 | guinea-bissau                                |
|       12 | jordan                                       |
|       12 | anguilla                                     |
|       12 | malaysia                                     |
|       12 | turkey                                       |
|       12 | syria                                        |
|       12 | virgin islands, united states                |
|       12 | saint kitts and nevis                        |
|       12 | isle of man                                  |
|       11 | qatar                                        |
|       11 | tanzania                                     |
|       11 | india                                        |
|       11 | belize                                       |
|       11 | peru                                         |
|       11 | djibouti                                     |
|       11 | ukraine                                      |
|       11 | panama                                       |
|       11 | lesotho                                      |
|       11 | saint lucia                                  |
|       11 | latvia                                       |
|       11 | cambodia                                     |
|       11 | åland islands                                |
|       11 | vanuatu                                      |
|       11 | turks and caicos islands                     |
|       11 | belarus                                      |
|       11 | austria                                      |
|       11 | palau                                        |
|       11 | philippines                                  |
|       11 | congo (brazzaville)                          |
|       11 | burundi                                      |
|       11 | mexico                                       |
|       11 | bouvet island                                |
|       11 | kiribati                                     |
|       11 | luxembourg                                   |
|       11 | san marino                                   |
|       11 | french southern territories                  |
|       11 | myanmar                                      |
|       11 | faroe islands                                |
|       11 | guernsey                                     |
|       11 | guatemala                                    |
|       10 | timor-leste                                  |
|       10 | indonesia                                    |
|       10 | kuwait                                       |
|       10 | tunisia                                      |
|       10 | kyrgyzstan                                   |
|       10 | dominican republic                           |
|       10 | tokelau                                      |
|       10 | cayman islands                               |
|       10 | chad                                         |
|       10 | taiwan                                       |
|       10 | australia                                    |
|       10 | zambia                                       |
|       10 | jersey                                       |
|       10 | guam                                         |
|       10 | south africa                                 |
|       10 | ghana                                        |
|       10 | zimbabwe                                     |
|       10 | rwanda                                       |
|       10 | madagascar                                   |
|       10 | benin                                        |
|       10 | afghanistan                                  |
|       10 | algeria                                      |
|       10 | costa rica                                   |
|       10 | micronesia                                   |
|       10 | united states                                |
|       10 | antigua and barbuda                          |
|       10 | antarctica                                   |
|       10 | cape verde                                   |
|        9 | albania                                      |
|        9 | slovenia                                     |
|        9 | belgium                                      |
|        9 | martinique                                   |
|        9 | turkmenistan                                 |
|        9 | france                                       |
|        9 | tuvalu                                       |
|        9 | tajikistan                                   |
|        9 | western sahara                               |
|        9 | israel                                       |
|        9 | cuba                                         |
|        9 | gambia                                       |
|        9 | uruguay                                      |
|        9 | swaziland                                    |
|        9 | hungary                                      |
|        9 | serbia                                       |
|        9 | cyprus                                       |
|        9 | bangladesh                                   |
|        9 | guyana                                       |
|        9 | saint pierre and miquelon                    |
|        9 | british indian ocean territory               |
|        9 | cameroon                                     |
|        9 | bosnia and herzegovina                       |
|        9 | virgin islands, british                      |
|        9 | reunion                                      |
|        9 | montserrat                                   |
|        9 | suriname                                     |
|        9 | gibraltar                                    |
|        9 | bonaire, sint eustatius and saba             |
|        9 | greenland                                    |
|        9 | armenia                                      |
|        9 | bulgaria                                     |
|        9 | nicaragua                                    |
|        9 | russian federation                           |
|        8 | pitcairn islands                             |
|        8 | comoros                                      |
|        8 | colombia                                     |
|        8 | northern mariana islands                     |
|        8 | czech republic                               |
|        8 | nigeria                                      |
|        8 | honduras                                     |
|        8 | american samoa                               |
|        8 | bermuda                                      |
|        8 | new caledonia                                |
|        8 | greece                                       |
|        8 | solomon islands                              |
|        8 | estonia                                      |
|        8 | brunei                                       |
|        8 | mali                                         |
|        8 | macedonia                                    |
|        8 | uganda                                       |
|        8 | eritrea                                      |
|        8 | yemen                                        |
|        8 | korea, north                                 |
|        8 | saint barthélemy                             |
|        8 | puerto rico                                  |
|        8 | papua new guinea                             |
|        8 | bhutan                                       |
|        8 | georgia                                      |
|        8 | maldives                                     |
|        8 | azerbaijan                                   |
|        8 | italy                                        |
|        8 | holy see (vatican city state)                |
|        8 | chile                                        |
|        8 | germany                                      |
|        8 | sao tome and principe                        |
|        8 | el salvador                                  |
|        8 | south sudan                                  |
|        8 | uzbekistan                                   |
|        8 | japan                                        |
|        8 | iraq                                         |
|        8 | central african republic                     |
|        8 | marshall islands                             |
|        8 | côte d'ivoire (ivory coast)                  |
|        7 | falkland islands                             |
|        7 | mauritania                                   |
|        7 | macao                                        |
|        7 | south georgia and the south sandwich islands |
|        7 | saint martin                                 |
|        7 | bahrain                                      |
|        7 | kenya                                        |
|        7 | norway                                       |
|        7 | barbados                                     |
|        7 | poland                                       |
|        7 | heard island and mcdonald islands            |
|        7 | bahamas                                      |
|        7 | fiji                                         |
|        7 | malta                                        |
|        7 | mongolia                                     |
|        7 | egypt                                        |
|        7 | niue                                         |
|        7 | gabon                                        |
|        7 | iran                                         |
|        7 | sierra leone                                 |
|        7 | pakistan                                     |
|        7 | singapore                                    |
|        7 | ecuador                                      |
|        6 | spain                                        |
|        6 | french guiana                                |
|        6 | namibia                                      |
|        6 | laos                                         |
|        6 | sudan                                        |
|        6 | croatia                                      |
|        6 | morocco                                      |
|        6 | denmark                                      |
|        6 | new zealand                                  |
|        6 | guadeloupe                                   |
|        6 | sint maarten                                 |
|        6 | moldova                                      |
|        6 | paraguay                                     |
|        6 | bolivia                                      |
|        6 | togo                                         |
|        6 | somalia                                      |
|        6 | burkina faso                                 |
|        6 | portugal                                     |
|        6 | viet nam                                     |
|        6 | malawi                                       |
|        6 | libya                                        |
|        6 | romania                                      |
|        6 | china                                        |
|        6 | svalbard and jan mayen islands               |
|        6 | angola                                       |
|        5 | montenegro                                   |
|        5 | haiti                                        |
|        5 | trinidad and tobago                          |
|        5 | korea, south                                 |
|        5 | sweden                                       |
|        5 | palestine, state of                          |
|        5 | liechtenstein                                |
|        5 | nauru                                        |
|        5 | nepal                                        |
|        5 | hong kong                                    |
|        5 | samoa                                        |
|        5 | monaco                                       |
|        4 | jamaica                                      |
|        3 | iceland                                      |
|        3 | saint vincent and the grenadines             |
|        3 | mauritius                                    |
|        3 | saudi arabia                                 |
|        2 | niger                                        |
+----------+----------------------------------------------+


Exercise 4

List all of the first names for AddressBook.name="Pharetra Ut Limited"

mysql> SELECT firstName  FROM Entry 
        JOIN AddressBook 
        ON Entry.addressBookid=AddressBook.id 
        where AddressBook.name='Pharetra Ut Limited';
        
+-------------+
| firstName   |
+-------------+
| Zelenia     |
| Abdul       |
| Idola       |
| Illana      |
| Winifred    |
| Buckminster |
| Heidi       |
| Nell        |
| Ciara       |
| Sylvia      |
| Caryn       |
| Dieter      |
| Jamalia     |
| Herrod      |
| Unity       |
| Pascale     |
| Colton      |
| Jamal       |
| Abel        |
| Zena        |
| Prescott    |
| Idona       |
| Paloma      |
| Neve        |
| Kyla        |
| Kimberley   |
| Jillian     |
| Addison     |
| Jacqueline  |
| Sasha       |
| Lee         |
| Salvador    |
| Yoko        |
| Stacy       |
| Halee       |
| Blythe      |
| Tad         |
| Haley       |
| Lara        |
| Summer      |
| Latifah     |
| Faith       |
| Stacey      |
| Jennifer    |
| Fulton      |
| Colin       |
| Thane       |
| Caryn       |
| Bo          |
| Jamal       |
| Amena       |
| Melanie     |
| Driscoll    |
| Gareth      |
| Colt        |
| Martha      |
| Sierra      |
| Nita        |
| Celeste     |
| Kathleen    |
| Samuel      |
| Aaron       |
| Cheyenne    |
| Brett       |
| Rebekah     |
+-------------+


SELECT email FROM Account 
  JOIN AddressBook
  ON Account.id = AddressBook.accountId
  WHERE AddressBook.id= '100';
  
  mysql> SELECT email FROM Account 
    ->   JOIN AddressBook
    ->   ON Account.id = AddressBook.accountId
    ->   WHERE AddressBook.id= '100';
+----------------------------------+
| email                            |
+----------------------------------+
| dapibus.quam@interdumligulaeu.ca |
+----------------------------------+





mysql> select distinct substring_index(content, '@', -1) from ElectronicMail;


| aodiosemper.com                   |
| lectusrutrum.edu                  |
| velit.net                         |
| acturpisegestas.net               |
| Craspellentesque.com              |
| inlobortis.com                    |
| quisdiam.ca                       |
| dolorquamelementum.edu            |
| quisaccumsanconvallis.edu         |
| quisturpis.edu                    |
| enimMaurisquis.com                |
| ategestasa.net                    |
| mollis.org                        |
| habitant.com                      |
| Nuncacsem.net                     |
| natoque.ca                        |
| Praesentinterdumligula.org        |
| Praesent.ca                       |
| etcommodo.com                     |
| sedduiFusce.edu                   |
| nisl.org                          |
| tellusimperdietnon.net            |
| sapienimperdiet.com               |
+-----------------------------------+
1983 rows in set (0.01 sec)



SELECT content from Phone
  Join Entry
  On Entry.id = Phone.entryId
  WHERE Entry.firstName= "Charlotte" AND
  Entry.lastName="Jenkins";
  
  
  mysql> SELECT content from Phone
    ->   Join Entry
    ->   On Entry.id = Phone.entryId
    ->   WHERE Entry.firstName= "Charlotte" AND
    ->   Entry.lastName="Jenkins";
+----------------+
| content        |
+----------------+
| (110) 167-3420 |
| (605) 175-1334 |
+----------------+
2 rows in set (0.00 sec)




SELECT Phone.subtype, COUNT(*) FROM Phone
   JOIN Entry 
   ON Phone.entryId = Entry.id
   WHERE Entry.birthday >= "1950-10-01" AND Entry.birthday < "1960-10-01"
   GROUP BY Phone.subtype;
   
   
   
   
    SELECT Phone.subtype, COUNT(*) FROM Phone
    ->    JOIN Entry 
    ->    ON Phone.entryId = Entry.id
    ->    WHERE Entry.birthday >= "1950-10-01" AND Entry.birthday < "1960-10-01"
    ->    GROUP BY Phone.subtype;
+----------+----------+
| subtype  | COUNT(*) |
+----------+----------+
| landline |      170 |
| cellular |      138 |
| fax      |      134 |
+----------+----------+
3 rows in set (0.00 sec)



Exercise 9

List all of the cities within the countries of Canada, Austria, Isle of Man, Ireland and Japan.

mysql>       SELECT city,country FROM Address
    ->    WHERE country = "Canada" 
    ->         OR country = "Austria" 
    ->         OR country = "Isle of Man" 
    ->         OR country = "Ireland"
    ->         OR country = "Japan"
    ->   ORDER BY country;
+----------------+-------------+
| city           | country     |
+----------------+-------------+
| Dubbo          | Austria     |
| Bodmin         | Austria     |
| Alness         | Austria     |
| Zwickau        | Austria     |
| Siedlce        | Austria     |
| Edmundston     | Austria     |
| Shimla         | Austria     |
| Ceyhan         | Austria     |
| Hamburg        | Austria     |
| Tauranga       | Austria     |
| Vienna         | Austria     |
| Calmar         | Canada      |
| San Francisco  | Canada      |
| Tirrases       | Canada      |
| Quesada        | Canada      |
| Springfield    | Canada      |
| Baulers        | Canada      |
| Rollegem       | Canada      |
| Hillsboro      | Canada      |
| Angers         | Canada      |
| Satara         | Canada      |
| Mabompr?       | Canada      |
| Pietraroja     | Canada      |
| Moulins        | Canada      |
| Anápolis       | Canada      |
| Cork           | Canada      |
| Raj Nandgaon   | Ireland     |
| Cagnes-sur-Mer | Ireland     |
| Terneuzen      | Ireland     |
| Meridian       | Ireland     |
| Lasnigo        | Ireland     |
| Chestermere    | Ireland     |
| Belfast        | Ireland     |
| Assen          | Ireland     |
| Galway         | Ireland     |
| Cartago        | Ireland     |
| Kraków         | Ireland     |
| Jackson        | Ireland     |
| Belfast        | Isle of Man |
| Pabianice      | Isle of Man |
| Dover          | Isle of Man |
| Nagaon         | Isle of Man |
| Kailua         | Isle of Man |
| Ceyhan         | Isle of Man |
| Horsham        | Isle of Man |
| San Vicente    | Isle of Man |
| Chartres       | Isle of Man |
| Bremerhaven    | Isle of Man |
| Denderbelle    | Isle of Man |
| Ogbomosho      | Isle of Man |
| Abbeville      | Japan       |
| Berlin         | Japan       |
| Bozeman        | Japan       |
| Pontevedra     | Japan       |
| Rzeszów        | Japan       |
| Houston        | Japan       |
| ?slahiye       | Japan       |
| Milena         | Japan       |
+----------------+-------------+


Exercise 10

Transform all work emails into home emails and vice versa. BE CAREFUL ;)
UPDATE ElectronicMail SET type = CASE when type = 'work' then 'home' when type = 'home' then 'work' end;
Query OK, 2300 rows affected (0.02 sec)
Rows matched: 2300  Changed: 2300  Warnings: 0

mysql> SELECT * FROM ElectronicMail limit 10;
+----+---------+------+-------------------------------------------+
| id | entryId | type | content                                   |
+----+---------+------+-------------------------------------------+
|  1 |    5465 | work | lorem.fringilla.ornare@dictumplacerat.com |
|  2 |    4453 | work | diam.Duis@magnaetipsum.org                |
|  3 |    4949 | work | sit.amet@loremutaliquam.com               |
|  4 |    5942 | work | massa@semperdui.com                       |
|  5 |    4973 | work | Cum.sociis@risusNuncac.ca                 |
|  6 |    4966 | work | augue@rutrum.net                          |
|  7 |    5331 | work | sit@commodohendrerit.co.uk                |
|  8 |    5736 | work | neque.et@cursus.co.uk                     |
|  9 |    5116 | work | ornare.facilisis@arcu.com                 |
| 10 |    4454 | work | parturient.montes@ornare.com              |
+----+---------+------+-------------------------------------------+
10 rows in set (0.00 sec)

mysql> UPDATE ElectronicMail SET type = CASE when type = 'work' then 'home' when type = 'home' then 'work' end;
Query OK, 1610 rows affected (0.02 sec)
Rows matched: 2300  Changed: 1610  Warnings: 0

mysql> SELECT * FROM ElectronicMail limit 10;+----+---------+------+-------------------------------------------+
| id | entryId | type | content                                   |
+----+---------+------+-------------------------------------------+
|  1 |    5465 | home | lorem.fringilla.ornare@dictumplacerat.com |
|  2 |    4453 | home | diam.Duis@magnaetipsum.org                |
|  3 |    4949 | home | sit.amet@loremutaliquam.com               |
|  4 |    5942 | home | massa@semperdui.com                       |
|  5 |    4973 | home | Cum.sociis@risusNuncac.ca                 |
|  6 |    4966 | home | augue@rutrum.net                          |
|  7 |    5331 | home | sit@commodohendrerit.co.uk                |
|  8 |    5736 | home | neque.et@cursus.co.uk                     |
|  9 |    5116 | home | ornare.facilisis@arcu.com                 |
| 10 |    4454 | home | parturient.montes@ornare.com              |
+----+---------+------+-------------------------------------------+
10 rows in set (0.00 sec)