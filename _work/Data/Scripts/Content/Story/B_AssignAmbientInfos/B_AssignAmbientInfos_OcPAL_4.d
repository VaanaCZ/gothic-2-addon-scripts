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
	AI_Output (self, other, "DIA_OCPAL_4_PEOPLE_04_01"); //Velitel Garond. Najdeš ho v tý nejvętší budovę tady uvnitâ hradu.
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
	description = "Co mi můžeš âíct o Hornickém údolí?";
};                       

FUNC INT DIA_OCPAL_4_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCPAL_4_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_OCPAL_4_LOCATION_15_00"); //Co mi můžeš âíct o Hornickém údolí?
	AI_Output (self, other, "DIA_OCPAL_4_LOCATION_04_01"); //Co vím, tak je tu nękolik dolů - pokud tedy všechny nepadly do drápů skâetům.
	AI_Output (self, other, "DIA_OCPAL_4_LOCATION_04_02"); //Jednotky z vętší části sestávají z vęzŕů, ale najdeš tu i pár paladinů.
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
		AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_01"); //Obklíčili nás skâeti! Ale budeme se bránit do posledního muže. A Innos nám pomůže v boji proti drakům!
	};
	
	if (Kapitel == 4)
	{
		if (MIS_KilledDragons < 4)
		{
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_02"); //Už je to pęknę dlouho, co skâeti zaútočili. Kde jsou ty zatracený posily?
			if (other.guild == GIL_DJG)
			{
				AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_03"); //Nemůžeš pâeci vážnę vęâit tomu, že ty jako drakobijec máš šanci proti VŠEM tęm drakům?
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
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_06"); //Nezdá se, že by smrt draků skâety nęjak vyvedla z míry. Proč u Innose konečnę neodtáhnou? Dęje se tu nęco divnýho.
		}
		else
		{
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_07"); //Ta zpropadená brána se zasekla. Skâeti se valí do hradu a nic už je nemůže zastavit.
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_08"); //Nękdo musí informovat lorda Hagena. Potâebujeme ho TADY.
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
