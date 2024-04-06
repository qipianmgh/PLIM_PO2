function MCM3000_Stop(handle)
     
      stop_code=[101 4 0 1 0 0];
      fwrite(handle,stop_code);
     
end