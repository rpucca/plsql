--PACKAGE-------------------------------------------------------------------------------------------------------------------------------------
create or replace package pck_financeiro is
    procedure prc_ins_cta_extrato (p_cib_id    in cta_extrato.cex_cib_id%type,
                                   p_data      in cta_extrato.cex_data%type,
                                   p_cld_id    in cta_extrato.cex_cld_id%type,
                                   p_desc      in cta_extrato.cex_desc%type,
                                   p_val       in varchar2);

    procedure prc_ins_cta_lancamento_dominio (p_tp   in cta_lancamento_dominio.cld_tp%type,
                                              p_desc in cta_lancamento_dominio.cld_desc%type);

    procedure prc_ins_cta_informacao_bancaria (p_bco        in cta_informacao_bancaria.cib_bco%type,
                                               p_bco_nome   in cta_informacao_bancaria.cib_bco_nome%type,
                                               p_bco_ag     in cta_informacao_bancaria.cib_bco_ag%type,
                                               p_bco_cta    in cta_informacao_bancaria.cid_bco_cta%type);        
end pck_financeiro;
/
create or replace package body pck_financeiro is 
    procedure prc_ins_cta_extrato (p_cib_id    in cta_extrato.cex_cib_id%type,
                                   p_data      in cta_extrato.cex_data%type,    
                                   p_cld_id    in cta_extrato.cex_cld_id%type,
                                   p_desc      in cta_extrato.cex_desc%type,
                                   p_val       in varchar2) is
    begin
        insert into cta_extrato (cex_cib_id, cex_data, cex_cld_id, cex_desc, cex_val)         
        values     (p_cib_id, nvl(p_data,sysdate), p_cld_id, p_desc, p_val);
        commit;
    exception
        when others then
            rollback;
            dbms_output.put_line('pck_financeiro.prc_ins_cta_extrato - erro ao incluir registro na tabela cta_extrato: ' || sqlerrm);
    end prc_ins_cta_extrato;
    
    procedure prc_ins_cta_lancamento_dominio (p_tp   in cta_lancamento_dominio.cld_tp%type,
                                              p_desc in cta_lancamento_dominio.cld_desc%type) is
    begin
        insert into cta_lancamento_dominio (cld_tp, cld_desc, cld_data) 
        values     (p_tp, p_desc, sysdate);

        dbms_output.put_line(p_tp || ' - ' || p_desc || ' - ' ||  to_char(sysdate, 'DD/MM/YYYY HH24:MI:SS'));
        commit;
    exception
        when others then
            rollback;
            dbms_output.put_line('pck_financeiro.prc_ins_cta_lancamento_dominio - erro ao incluir registro na tabela cta_lancamento_dominio: ' || sqlerrm);
    end prc_ins_cta_lancamento_dominio;

    procedure prc_ins_cta_informacao_bancaria (p_bco        in cta_informacao_bancaria.cib_bco%type,
                                               p_bco_nome   in cta_informacao_bancaria.cib_bco_nome%type,
                                               p_bco_ag     in cta_informacao_bancaria.cib_bco_ag%type,
                                               p_bco_cta    in cta_informacao_bancaria.cid_bco_cta%type) is        
    begin
        insert into cta_informacao_bancaria (cib_bco, cib_bco_nome, cib_bco_ag, cid_bco_cta)         
        values                              (p_bco, p_bco_nome, p_bco_ag, p_bco_cta);
        commit;
    exception
        when others then
            rollback;
            dbms_output.put_line('pck_financeiro.prc_ins_cta_informacao_bancaria - erro ao incluir registro na tabela cta_informacao_bancaria: ' || sqlerrm);
    end prc_ins_cta_informacao_bancaria;

end pck_financeiro;
/
----------------------------------------------------------------------------------------------
/*
create or replace function teste(p_desc varchar) return number is
  v_id number;
begin
  SELECT nvl(a.cld_id,0) INTO v_id FROM cta_lancamento_dominio a WHERE a.cld_desc = p_desc;
  RETURN v_id;
end teste;
*/