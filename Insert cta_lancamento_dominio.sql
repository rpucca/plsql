--INSERTS--------------------------------------------------------------------------------------------------------------------------------------
set serveroutput on;
execute pck_financeiro.prc_ins_cta_lancamento_dominio('D','APLICACAO');
execute pck_financeiro.prc_ins_cta_lancamento_dominio('C','ALUGUEL');
execute pck_financeiro.prc_ins_cta_lancamento_dominio('D','BOX');
execute pck_financeiro.prc_ins_cta_lancamento_dominio('D','CART�O');
execute pck_financeiro.prc_ins_cta_lancamento_dominio('D','EDUCA��O');
execute pck_financeiro.prc_ins_cta_lancamento_dominio('D','ESPORTE');
execute pck_financeiro.prc_ins_cta_lancamento_dominio('D','PRESENTE');
execute pck_financeiro.prc_ins_cta_lancamento_dominio('C','RESGATE');
execute pck_financeiro.prc_ins_cta_lancamento_dominio('D','SEYDE');
execute pck_financeiro.prc_ins_cta_lancamento_dominio('D','TRANSFER�NCIA');
execute pck_financeiro.prc_ins_cta_lancamento_dominio('D','TARIFA');
select a.* from cta_lancamento_dominio a;
