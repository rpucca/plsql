create or replace procedure segmercado_ins (v_descricao varchar2) is
    v_id number(5);
    
    cursor c_max_id is
        select nvl(max(id), 0) + 1 into v_id from segmercado;
begin
    open   c_max_id;
    fetch  c_max_id into v_id;
    close  c_max_id;

    --select nvl(max(id), 0) + 1 into v_id from segmercado;    
    insert into segmercado (ID, DESCRICAO) values (v_id, v_descricao); 
    commit;
end;

declare
begin
    --delete from segmercado;
    --commit;
    
    segmercado_ins ('Varejo');
    segmercado_ins ('Atacado');
    segmercado_ins ('Serviço');

end;

select * from segmercado order by 1;
