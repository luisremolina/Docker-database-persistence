-- enum for categories 
create type category as enum ('Social network', 'Services', 'Streaming', 'Cloud Computing');

-- create table company

create table if not exists company(
    id serial primary key,
    "name" varchar(32) not null unique,
    founder varchar(128),
    logo varchar(255),
    foundation_date date
);


-- index of name

create table if not exists web_site(
    id serial primary key,
    id_company bigint,
    "name" varchar(32) not null unique,
    category category not null,
    description text,
    constraint fk_company
        foreign key(id_company)
            references company(id)
);