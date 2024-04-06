function PixelRetraceWaveform = GenPixelRetraceWaveform(RetraceLength, PreviousScanOffset, NextScanOffset)
   A1 = (NextScanOffset-PreviousScanOffset)/(2*pi);
   W = 2*pi/RetraceLength;
   PixelRetraceWaveform = zeros(RetraceLength,1);
   for i = 1:RetraceLength
       PixelRetraceWaveform(i) = A1*((i-1)*W-sin((i-1)*W)) + PreviousScanOffset;
   end
end         