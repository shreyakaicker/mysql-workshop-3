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
