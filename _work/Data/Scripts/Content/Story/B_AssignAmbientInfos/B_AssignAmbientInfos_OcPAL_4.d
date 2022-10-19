// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_OCPAL_4_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_OCPAL_4_EXIT_Condition;
	information	= DIA_OCPAL_4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_OCPAL_4_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCPAL_4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_OCPAL_4_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_OCPAL_4_PEOPLE_Condition;
	information	= DIA_OCPAL_4_PEOPLE_Info;
	permanent	= TRUE;
	description = "Kdo tomu tady velí?";
};                       

FUNC INT DIA_OCPAL_4_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCPAL_4_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_OCPAL_4_PEOPLE_15_00"); //Kdo tomu tady velí?
	AI_Output (self, other, "DIA_OCPAL_4_PEOPLE_04_01"); //Velitel Garond. Najdeš ho v tý nejvêtší budovê tady uvnitâ hradu.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_OCPAL_4_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_OCPAL_4_LOCATION_Condition;
	information	= DIA_OCPAL_4_LOCATION_Info;
	permanent	= TRUE;
	description = "Co mi mùžeš âíct o Hornickém údolí?";
};                       

FUNC INT DIA_OCPAL_4_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCPAL_4_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_OCPAL_4_LOCATION_15_00"); //Co mi mùžeš âíct o Hornickém údolí?
	AI_Output (self, other, "DIA_OCPAL_4_LOCATION_04_01"); //Co vím, tak je tu nêkolik dolù - pokud tedy všechny nepadly do drápù skâetùm.
	AI_Output (self, other, "DIA_OCPAL_4_LOCATION_04_02"); //Jednotky z vêtší èásti sestávají z vêzàù, ale najdeš tu i pár paladinù.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_OCPAL_4_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_OCPAL_4_STANDARD_Condition;
	information	= DIA_OCPAL_4_STANDARD_Info;
	permanent	= TRUE;
	description = "Jak se vede?";
};
                       
func INT DIA_OCPAL_4_STANDARD_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCPAL_4_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_OCPAL_4_STANDARD_15_00"); //Jak se vede?
		
	if (Kapitel <= 3)
	{
		AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_01"); //Obklíèili nás skâeti! Ale budeme se bránit do posledního muže. A Innos nám pomùže v boji proti drakùm!
	};
	
	if (Kapitel == 4)
	{
		if (MIS_KilledDragons < 4)
		{
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_02"); //Už je to pêknê dlouho, co skâeti zaútoèili. Kde jsou ty zatracený posily?
			if (other.guild == GIL_DJG)
			{
				AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_03"); //Nemùžeš pâeci vážnê vêâit tomu, že ty jako drakobijec máš šanci proti VŠEM têm drakùm?
			}
			else
			{
				AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_04"); //Ti takzvaní drakobijci toho moc nesvedou!
			};
		}
		else
		{
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_05"); //Díky Innosovi! Ty zatracený potvory byly poraženy!
		};
	};

	if (Kapitel >= 5)
	{
		if (MIS_OCGateOpen == FALSE)
		{
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_06"); //Nezdá se, že by smrt drakù skâety nêjak vyvedla z míry. Proè u Innose koneènê neodtáhnou? Dêje se tu nêco divnýho.
		}
		else
		{
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_07"); //Ta zpropadená brána se zasekla. Skâeti se valí do hradu a nic už je nemùže zastavit.
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_08"); //Nêkdo musí informovat lorda Hagena. Potâebujeme ho TADY.
		};
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_OCPAL_4 (var c_NPC slf)
{
	DIA_OCPAL_4_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_OCPAL_4_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_OCPAL_4_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_OCPAL_4_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
