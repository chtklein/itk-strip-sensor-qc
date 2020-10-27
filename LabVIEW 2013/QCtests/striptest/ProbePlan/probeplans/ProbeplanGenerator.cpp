#include <fstream>

using namespace std;
 
 
 
void ProbeplanGenerator(TString filename, int segment1, int segment2, int segment3, int segment4, bool innerc)
{    
	TString dir = gSystem->UnixPathName(gInterpreter->GetCurrentMacroName());
	dir.ReplaceAll("ProbeplanGenerator.cpp", "");
	dir.ReplaceAll("/./", "/");

	char buffer[64];
	int seg1[5] = {0,3700,11110,18520,22435};
	int seg2[5] = {-22435,-18520,-11110,-3700,0};
	int seg3[5] = {0,3700,11110,18520,22435};
	int seg3[5] = {-22435,-18520,-11110,-3700,0};
	

	ifstream in;   
	if (innerc)
	{
		in.open(Form("%s/atlas12_innerc.txt", dir.Data()));
	}
	else
	{
		in.open(Form("%s/atlas12.txt", dir.Data()));
	}
	

	char header[255];
	in.getline(header,255);

	double x[4][1280], y[4][1280];
	char label[4][255];
	std::string xstring, ystring;
	
	for (int i = 1; i <= 4; i++)
	{
		if (!in.good()) break;
		in.getline(label[i-1],255);
		cout << label[i-1] << endl;
		
		for (int j = 1; j <= 1280; j++)
		{
			if (!in.good()) break;
			
			in >> buffer >> buffer >> xstring >> ystring;
			x[i-1][j-1] = atof(xstring.substr(2).c_str());
			y[i-1][j-1] = atof(ystring.substr(2).c_str());
			
			
			if (j < 11 || j > 1270)
			{
				cout << x[i-1][j-1] << "\t" << y[i-1][j-1] << endl;
			}
			in.getline(buffer, 64);
		}
	}
	in.close();
	
	
	ofstream out;   
	out.open(Form("%s/%s", dir.Data(), filename.Data()));
	out << header << endl;
	
	for (int i = 1; i <= 4; i++)
	{
		out << label[i-1] << endl;
		
		for (int j = 1; j <= 1280; j++)
		{
			if (i == 1)
			{
				out << "Label=Strip" << "\t" << j << "\tX=" << x[i-1][j-1] + seg4[segment4] << "\ty=" << y[i-1][j-1] << "\t" << "\t" << "\t" << endl;
			}
			else if (i == 2)
			{
				out << "Label=Strip" << "\t" << j << "\tX=" << x[i-1][j-1] + seg3[segment3] << "\ty=" << y[i-1][j-1] << "\t" << "\t" << "\t" << endl;
			}
			else if (i == 3)
			{
				out << "Label=Strip" << "\t" << j << "\tX=" << x[i-1][j-1] + seg2[segment2] << "\ty=" << y[i-1][j-1] << "\t" << "\t" << "\t" << endl;
			}
			else if (i == 4)
			{
				out << "Label=Strip" << "\t" << j << "\tX=" << x[i-1][j-1] + seg1[segment1] << "\ty=" << y[i-1][j-1] << "\t" << "\t" << "\t" << endl;
			}
			
		}
	}
	out.close();

}

#ifndef __CINT__
	int main()
	{
		ProbeplanGenerator();
		return 0;
	}
 #endif