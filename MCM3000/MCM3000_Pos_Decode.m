function Pos = MCM3000_Pos_Decode(handle)
    fwrite(handle,[10 4 0 0 0 0]);
    pause(0.1);
    Pos_coding=fread(handle,12);
    Pos_coding_header=[11 4 6 0 0 0 0 0]';
    if all(Pos_coding(1:8)==Pos_coding_header)
       Pos=Pos_coding(9)+Pos_coding(10)*256+Pos_coding(11)*256^2+Pos_coding(12)*256^3;
       if Pos<2^31
          Pos=(Pos-0.0417)/4724.4; 
       else
          Pos=(Pos-256^4-0.0417)/4724.4; 
       end     
    else
       fprintf(['MCM3000 Output Code: ', num2str(Pos_coding'),'; \n']);
       fprintf('Serial signal reading error at COM 7! \n');
    end
end