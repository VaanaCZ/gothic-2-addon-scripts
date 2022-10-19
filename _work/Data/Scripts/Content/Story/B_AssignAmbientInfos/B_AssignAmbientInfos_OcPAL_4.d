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
	description = "Kto tu dowodzi?";
};                       

FUNC INT DIA_OCPAL_4_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCPAL_4_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_OCPAL_4_PEOPLE_15_00"); //Kto tu dowodzi?
	AI_Output (self, other, "DIA_OCPAL_4_PEOPLE_04_01"); //Kapitan Garond. Znajdziesz go w najwiêkszym budynku kompleksu zamkowego.
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
	description = "Mo¿esz mi coœ powiedzieæ o Górniczej Dolinie?";
};                       

FUNC INT DIA_OCPAL_4_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCPAL_4_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_OCPAL_4_LOCATION_15_00"); //Mo¿esz mi coœ powiedzieæ o Górniczej Dolinie?
	AI_Output (self, other, "DIA_OCPAL_4_LOCATION_04_01"); //Z tego, co mi wiadomo, znajduje siê tam kilka kopalni. O ile nie zosta³y spl¹drowane przez orków.
	AI_Output (self, other, "DIA_OCPAL_4_LOCATION_04_02"); //Oddzia³y tam przebywaj¹ce sk³adaj¹ siê w g³ównej mierze z wiêŸniów, jest te¿ wœród nich kilku paladynów.
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
	description = "Jak leci?";
};
                       
func INT DIA_OCPAL_4_STANDARD_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCPAL_4_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_OCPAL_4_STANDARD_15_00"); //Jak siê maj¹ sprawy?
		
	if (Kapitel <= 3)
	{
		AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_01"); //Jesteœmy otoczeni przez orków! Bêdziemy siê jednak broniæ do ostatniego cz³owieka! Zaœ Innos wspomo¿e nas sw¹ potêg¹ w walce ze smokami!
	};
	
	if (Kapitel == 4)
	{
		if (MIS_KilledDragons < 4)
		{
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_02"); //Tylko patrzeæ, jak orkowie zaatakuj¹. Gdzie s¹ te cholerne posi³ki?
			if (other.guild == GIL_DJG)
			{
				AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_03"); //Nie wierzysz chyba, ¿e ³owcy smoków poradz¹ sobie z WSZYSTKIMI bestiami?
			}
			else
			{
				AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_04"); //Ci, tak zwani ³owcy smoków, sami niewiele zdzia³aj¹.
			};
		}
		else
		{
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_05"); //Innosowi niech bêd¹ dziêki! Te cholerne bestie w koñcu zosta³y pokonane.
		};
	};

	if (Kapitel >= 5)
	{
		if (MIS_OCGateOpen == FALSE)
		{
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_06"); //Œmieræ smoków nie zniechêci³a specjalnie orków. Dlaczego, na Innosa, po prostu nie odejd¹? Czujê w tym dzia³anie z³ych mocy.
		}
		else
		{
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_07"); //Przeklêta brama, ktoœ j¹ zablokowa³! Orkowie wlewaj¹ siê do zamku, nic ich ju¿ nie powstrzyma.
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_08"); //Ktoœ musi powiadomiæ Lorda Hagena. Potrzebujemy go TUTAJ!
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
