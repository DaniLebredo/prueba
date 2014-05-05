# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table area (
  tipoArea                  varchar(31) not null,
  id                        bigint not null,
  name                      varchar(255),
  constraint pk_area primary key (id))
;

create table indicador (
  id                        bigint not null,
  name                      varchar(255),
  constraint pk_indicador primary key (id))
;

create table observacion (
  id                        bigint not null,
  provider_id               bigint,
  indicator_id              bigint,
  area_id                   bigint,
  measure                   varchar(255),
  value                     integer,
  constraint pk_observacion primary key (id))
;

create table provider (
  id                        bigint not null,
  name                      varchar(255),
  constraint pk_provider primary key (id))
;

create sequence area_seq;

create sequence indicador_seq;

create sequence observacion_seq;

create sequence provider_seq;

alter table observacion add constraint fk_observacion_provider_1 foreign key (provider_id) references provider (id) on delete restrict on update restrict;
create index ix_observacion_provider_1 on observacion (provider_id);
alter table observacion add constraint fk_observacion_indicator_2 foreign key (indicator_id) references indicador (id) on delete restrict on update restrict;
create index ix_observacion_indicator_2 on observacion (indicator_id);
alter table observacion add constraint fk_observacion_area_3 foreign key (area_id) references area (id) on delete restrict on update restrict;
create index ix_observacion_area_3 on observacion (area_id);



# --- !Downs

SET REFERENTIAL_INTEGRITY FALSE;

drop table if exists area;

drop table if exists indicador;

drop table if exists observacion;

drop table if exists provider;

SET REFERENTIAL_INTEGRITY TRUE;

drop sequence if exists area_seq;

drop sequence if exists indicador_seq;

drop sequence if exists observacion_seq;

drop sequence if exists provider_seq;

