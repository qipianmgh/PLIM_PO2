function Pos_coding=MCM3000_Pos_Encode(Pos)
         
      encoder_count= round(4724.4*Pos+0.0417); 
      
      if Pos>=0   %%% Pos unit: mm
      Pos_coding(4)=fix(encoder_count/256^3);    
      Pos_coding(3)=fix(rem(encoder_count,256^3)/256^2);
      Pos_coding(2)=fix(rem(encoder_count,256^2)/256);
      Pos_coding(1)=rem(encoder_count,256);    
      else
      Pos_coding(4)=fix((256^4+encoder_count)/256^3);    
      Pos_coding(3)=fix(rem((256^4+encoder_count),256^3)/256^2);
      Pos_coding(2)=fix(rem((256^4+encoder_count),256^2)/256);
      Pos_coding(1)=rem((256^4+encoder_count),256);     
      end

end