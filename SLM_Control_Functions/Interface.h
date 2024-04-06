//interface functions between Matlab and C++
int Constructor(int LCType);
void Deconstructor();
void SLMPower(int PowerState);
void ReadTIFF(const char* TIFFPath, unsigned char* TIFFData);
void WriteImage(int board, unsigned char* Image);
void WriteCal(int board, unsigned char* Image);
void LoadLUTFile(int board, const char* LUTFileName);
int ComputeTF(float FrameRate);
void SetTrueFrames(int TrueFrames);
