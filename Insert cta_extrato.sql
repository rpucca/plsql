declare 
 p_val_str    varchar2(10);
 p_val_num    number;
begin
    p_val_str := '51113,64';
    dbms_output.put_line('string:'||p_val_str);
    p_val_num := p_val_str;
    dbms_output.put_line('numérico:'||p_val_num);

    insert into cta_extrato (cex_cib_id, cex_data, cex_cld_id, cex_desc, cex_val)         
    values                  (1         , sysdate , 1         , 'teste' , p_val_str);
    commit;
end;


execute pck_financeiro.prc_ins_cta_extrato(1,'13/06/2024',TESTE('TARIFA') ,'Emissão de Cartão Global','-53,64');


set serverouTput on;
execute pck_financeiro.prc_ins_cta_extrato(1,'13/06/2024',TESTE('TRANSFERÊNCIA') ,'Pix - Ricardo - Banco Inter','200');
execute pck_financeiro.prc_ins_cta_extrato(1,'13/06/2024',TESTE('TRANSFERÊNCIA') ,'Pix - Ricardo - Banco CEF','200');
execute pck_financeiro.prc_ins_cta_extrato(1,'13/06/2024',TESTE('TARIFA') ,'Emissão de Cartão Global','-53,64');

select e.cex_data, e.cex_cld_id, l.cld_desc,e.cex_desc, e.cex_val, to_char(e.cex_val,'999G990D99')
from   cta_extrato e
join   cta_lancamento_dominio l on l.cld_id = e.cex_cld_id
where  e.cex_data between to_date('07/07/2024','DD/MM/YYYY') and to_date('07/07/2024','DD/MM/YYYY')
order by 1

select e.cex_data, e.cex_cld_id, l.cld_desc,e.cex_desc, e.cex_val, to_char(e.cex_val,'999G990D99')
from   cta_extrato e
join   cta_lancamento_dominio l on l.cld_id = e.cex_cld_id

    
    