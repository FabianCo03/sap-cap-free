namespace my.bookshop;

using {
    cuid,
    managed,
} from '@sap/cds/common';

entity Books : cuid, managed {
    title       : localized String(255);
    stock       : Integer;
    genre       : Genre;
    publCountry : String(3);
    isHardcover : Boolean;
    price       : Price;
    author      : Association to Authors;
}

entity Authors : cuid, managed {
    name        : String(100);
    dateOfBirth : Date;
    dateOfDeath : Date;
    books       : Association to many Books
                      on books.author = $self;
    epoch       : Association to Epoch
}

entity Orders {
    key ID    : Integer;
        items : Composition of many OrderItems
                    on items.order = $self
}

entity OrderItems {
    key order : Association to Orders;
    key pos   : Integer
}

entity Epoch {
    key ID : Integer
}

type Genre     : Integer enum {
    fiction     = 1;
    non_fiction = 2;
}

type Price {
    amount   : Decimal;
    currency : String(3)
}

type NoOfBooks : Integer;

extend Authors with {
    someAdditionalField : String;
}

aspect CodeList                    @(
    cds.autoexpose,
    cds.persistence.skip: 'is-unused'
) {
    name  : localized String(255)  @title: '{i18n>Name}';
    descr : localized String(1000) @title: '{i18n>Description}'
}
