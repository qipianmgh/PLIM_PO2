function MCM3000_Pos_Home(handle)
         
      encoder_count= 0; 
      
      Pos_coding(4)=fix(encoder_count/256^3);    
      Pos_coding(3)=fix(rem(encoder_count,256^3)/256^2);
      Pos_coding(2)=fix(rem(encoder_count,256^2)/256);
      Pos_coding(1)=rem(encoder_count,256);    
      
      pos_full=[83 4 6 0 0 0 0 0 Pos_coding];
      fwrite(handle,pos_full);
      pos_temp = MCM3000_Pos_Decode(handle);
      while MCM3000_Is_Busy(handle) | pos_temp~=MCM3000_Pos_Decode(handle)
        pos_temp = MCM3000_Pos_Decode(handle);
      end
      
end