--TABELAS--------------------------------------------------------------------------------------------------------------------------------------
drop table cta_extrato;
create table cta_extrato (
cex_id       number generated by default on null as identity minvalue 1 maxvalue 9999999999999999999999999999 increment by 1 start with 1 not null enable,
cex_cib_id   number,
cex_data     date,
cex_cld_id   number,
cex_desc     varchar2(1000),
cex_val      number(13,2),
constraint   cex_id_pk  primary key (cex_id),
constraint   cex_cib_fk foreign key (cex_cib_id) references cta_informacao_bancaria(cib_id)
);
comment on table  cta_extrato is 'extrato de conta';

drop table   cta_lancamento_dominio;
create table cta_lancamento_dominio (
cld_id       number generated by default on null as identity minvalue 1 maxvalue 9999999999999999999999999999 increment by 1 start with 1 not null enable,
cld_tp       char(1),
cld_desc     varchar2(100),
cld_data     date,
constraint  cld_id_pk primary key (cld_id)
);
comment on table  cta_lancamento_dominio is 'descri��o dos tipos de lan�amentos';
comment on column cta_lancamento_dominio.cld_tp is '[D]�bito [C]r�dito';

drop table cta_informacao_bancaria;
create table cta_informacao_bancaria(
cib_id         number generated by default on null as identity minvalue 1 maxvalue 9999999999999999999999999999 increment by 1 start with 1 not null enable,
cib_bco        number,
cib_bco_nome   varchar2(50),
cib_bco_ag     number,
cid_bco_cta    varchar2(20),
constraint cid_id_pk primary key (cib_id)
);
comment on table cta_informacao_bancaria is 'dados banc�rios';
