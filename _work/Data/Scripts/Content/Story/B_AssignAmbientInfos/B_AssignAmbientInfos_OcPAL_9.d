// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_OCPAL_9_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_OCPAL_9_EXIT_Condition;
	information	= DIA_OCPAL_9_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_OCPAL_9_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCPAL_9_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_OCPAL_9_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_OCPAL_9_PEOPLE_Condition;
	information	= DIA_OCPAL_9_PEOPLE_Info;
	permanent	= TRUE;
	description = "Kdo tomu tady velí?";
};                       

FUNC INT DIA_OCPAL_9_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCPAL_9_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_OCPAL_9_PEOPLE_15_00"); //Kdo tomu tady velí?
	AI_Output (self, other, "DIA_OCPAL_9_PEOPLE_09_01"); //Velitelem hradu je Garond. Jeho práci mu vážnę není co závidęt.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_OCPAL_9_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_OCPAL_9_LOCATION_Condition;
	information	= DIA_OCPAL_9_LOCATION_Info;
	permanent	= TRUE;
	description = "Víš nęco zajímavého o tomhle údolí?";
};                       

FUNC INT DIA_OCPAL_9_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCPAL_9_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_OCPAL_9_LOCATION_15_00"); //Víš nęco zajímavého o tomhle údolí?
	AI_Output (self, other, "DIA_OCPAL_9_LOCATION_09_01"); //Na východę skâeti postavili obrovskou obrannou zeë - aby mohli chránit své zásoby, pâedpokládám. Za tou zdí je i místo, kde mohou kotvit jejich lodę.
	AI_Output (self, other, "DIA_OCPAL_9_LOCATION_09_02"); //Doufám, že skâeti nedostanou své zásoby včas. Už teë mi docela stačí, s čím máme tu čest.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_OCPAL_9_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_OCPAL_9_STANDARD_Condition;
	information	= DIA_OCPAL_9_STANDARD_Info;
	permanent	= TRUE;
	description = "Jak se vede?";
};
                       
func INT DIA_OCPAL_9_STANDARD_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCPAL_9_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_OCPAL_4_STANDARD_15_00"); //Jak se vede?
		
	if (Kapitel <= 3)
	{
		AI_Output (self,other,"DIA_OCPAL_4_STANDARD_09_01"); //Draci znovu zaútočili! Ale Innos nám v bitvę poskytl svou ochranu. Ty stvůry zaplatí svou vlastní krví!
	};

	if (Kapitel == 4)
	{
		if (MIS_KilledDragons < 4)
		{
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_09_02"); //Drakobijci! Męli nám poslat paladiny!
		}
		else
		{
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_09_03"); //Teë, když jsme se zbavili tęch draků, se můžeme konečnę vypoâádat se skâety!
		};
	};

	if (Kapitel >= 5)
	{
		if (MIS_OCGateOpen == FALSE)
		{
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_09_04"); //Potâebujeme dostat rudu na loë a odplout z pekla týhle zpropadený zemę.
		}
		else
		{
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_09_05"); //Zrada! Ta brána nemęla být nikdy otevâena. Smrt všem zrádcům!
		};
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_OCPAL_9 (var c_NPC slf)
{
	DIA_OCPAL_9_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_OCPAL_9_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_OCPAL_9_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_OCPAL_9_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
