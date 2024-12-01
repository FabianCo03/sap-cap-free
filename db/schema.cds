namespace my.bookshop;

// Entities
entity Books {
    key ID     : Integer;
        title  : String;
        stock  : Integer;
        genre  : Genre;
        publCountry : String(3);
        isHardcover : Boolean;
        price  : Price;
        author : Association to Authors
}

// Types Books
type Genre : Integer enum {
    fiction     = 1;
    non_fiction = 2;
}

type Price {
    amount   : Decimal;
    currency : String(3)
}

type NoOfBooks : Integer;

entity Authors {
    key ID          : UUID;
        name        : String(100);
        dateOfBirth : Date;
        dateOfDeath : Date
}
