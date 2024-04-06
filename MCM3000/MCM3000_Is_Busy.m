function busy_status=MCM3000_Is_Busy(handle)
     
      query_status_code=[128 4 0 0 0 0];
      fwrite(handle,query_status_code);
      query_status_read=fread(handle,20); 
      if query_status_read(17)==48
          busy_status=1;
      else 
          busy_status=0;
      end
end