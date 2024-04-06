function FZ_Waveform = GenFZ_Waveform(FZ_FrameLength, FZ_SettlingLength, FZ_RetraceLength, FZ_ReturnFlag, FZ_Volts)         
  FZ_FrameNum = length(FZ_Volts);
  FZ_Retrace = zeros(FZ_SettlingLength,1);
  if FZ_ReturnFlag
     FZ_Waveform = zeros(FZ_FrameLength*FZ_FrameNum+FZ_RetraceLength, 1); 
     FZ_ArrayOffset = [FZ_Volts(1); FZ_Volts; FZ_Volts(1)]; 
     W = 2*pi/FZ_SettlingLength;
     for i = 1:FZ_FrameNum
         A1=(FZ_ArrayOffset(i+1)-FZ_ArrayOffset(i))/(2*pi);
         for j = 1:FZ_SettlingLength
            FZ_Settling(j) = FZ_ArrayOffset(i)+ A1*((j-1)*W-sin((j-1)*W));
         end
         FZ_Waveform(1+(i-1)*FZ_FrameLength:FZ_SettlingLength+(i-1)*FZ_FrameLength)= FZ_Settling;
         FZ_Waveform(FZ_SettlingLength+1+(i-1)*FZ_FrameLength:i*FZ_FrameLength)= FZ_Volts(i)*ones(FZ_FrameLength-FZ_SettlingLength,1);
     end
     A1=(FZ_ArrayOffset(end)-FZ_ArrayOffset(end-1))/(2*pi);
     W2 = 2*pi/FZ_RetraceLength;
     for j = 1:FZ_RetraceLength
         FZ_Retrace(j) = FZ_ArrayOffset(end-1)+ A1*((j-1)*W2-sin((j-1)*W2));
     end
     FZ_Waveform(FZ_FrameLength*FZ_FrameNum+1:end) = FZ_Retrace;
  else
     FZ_Waveform = zeros(FZ_FrameLength*FZ_FrameNum, 1); 
     FZ_ArrayOffset = [FZ_Volts(1); FZ_Volts];
     W = 2*pi/FZ_SettlingLength;
     for i = 1:FZ_FrameNum
         A1=(FZ_ArrayOffset(i+1)-FZ_ArrayOffset(i))/(2*pi);
         for j = 1:FZ_SettlingLength
            FZ_Settling(j) = FZ_ArrayOffset(i)+ A1*((j-1)*W-sin((j-1)*W));
         end
         FZ_Waveform(1+(i-1)*FZ_FrameLength:FZ_SettlingLength+(i-1)*FZ_FrameLength)= FZ_Settling;
         FZ_Waveform(FZ_SettlingLength+1+(i-1)*FZ_FrameLength:i*FZ_FrameLength)= FZ_Volts(i)*ones(FZ_FrameLength-FZ_SettlingLength,1);
     end
  end
end         