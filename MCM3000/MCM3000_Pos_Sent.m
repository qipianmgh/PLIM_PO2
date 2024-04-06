function MCM3000_Pos_Sent(handle,posZ_code)
     
      pos_header=[83 4 6 0 0 0 0 0];
      pos_full=[pos_header posZ_code];
      fwrite(handle,pos_full);
       

end