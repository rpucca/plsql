create or replace function fnc_read_cta_extrato
(
  p_dt_ini      date,
  p_dt_fim      date
)
return varchar2 is 
    cursor c_extrato is
        select json_object( 'v_cex_id'     is cex_id,
                            'v_cex_data'   is to_char(cex_data,'DD/MM/YYYY'),
                            'v_cex_cld_id' is cex_cld_id,
                            'v_cld_desc'   is cld_desc,
                            'v_cex_desc'   is cex_desc,
                            'v_cex_val'    is to_char(e.cex_val,'999G990D99'))
        from   cta_extrato e
        join   cta_lancamento_dominio l on l.cld_id = e.cex_cld_id
        where  to_char(e.cex_data,'DD/MM/YYYY') between to_char(nvl(p_dt_ini,'01/06/2024'),'DD/MM/YYYY') and to_char(nvl(p_dt_fim,'30/06/2024'),'DD/MM/YYYY')
        order by 1;

    v_linha         varchar2(4000);    
    v_json_extrato  varchar2(4000) := 'vazio';
begin
    open       c_extrato;
    loop fetch c_extrato into v_linha;
        exit when c_extrato%notfound;
        dbms_output.put_line(v_linha);
        v_json_extrato:= v_json_extrato || chr(10);
    end loop;
    close      c_extrato;

  return v_json_extrato;

end fnc_read_cta_extrato;


set serveroutput on;
DECLARE
  -- Variáveis para armazenar datas de início e fim (substitua por datas desejadas)
  v_dt_ini DATE := DATE '2024-06-01';
  v_dt_fim DATE := DATE '2024-06-30';

  -- Variável para armazenar o JSON resultante
  v_json_extrato VARCHAR2(4000);
BEGIN
  -- Chamada da função com as datas de início e fim
  v_json_extrato := fnc_read_cta_extrato(v_dt_ini, v_dt_fim);

  -- Verificar se o JSON está vazio
  IF v_json_extrato = 'vazio' THEN
    DBMS_OUTPUT.PUT_LINE('Nenhum registro encontrado para o período especificado.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('JSON do Extrato: ');
    DBMS_OUTPUT.PUT_LINE(v_json_extrato);
  END IF;
END;