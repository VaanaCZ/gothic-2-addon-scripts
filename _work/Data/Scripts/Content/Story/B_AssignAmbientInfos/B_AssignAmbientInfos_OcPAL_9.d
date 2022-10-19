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
	description = "Kto tu dowodzi?";
};                       

FUNC INT DIA_OCPAL_9_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCPAL_9_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_OCPAL_9_PEOPLE_15_00"); //Kto tu dowodzi?
	AI_Output (self, other, "DIA_OCPAL_9_PEOPLE_09_01"); //Zamkiem dowodzi kapitan Garond. Choæ pewnie nie mo¿na mu zazdroœciæ tej posady.
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
	description = "Co wiesz o tej dolinie?";
};                       

FUNC INT DIA_OCPAL_9_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCPAL_9_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_OCPAL_9_LOCATION_15_00"); //Co wiesz o tej dolinie?
	AI_Output (self, other, "DIA_OCPAL_9_LOCATION_09_01"); //W jej wschodniej czêœci orkowie wybudowali potê¿ny mur, chroni¹cy ich zapasy. Za nim znajduje siê dojœcie do przystani, przy której cumuj¹ swoje statki.
	AI_Output (self, other, "DIA_OCPAL_9_LOCATION_09_02"); //Mam nadziejê, ¿e zapasy nie dotr¹ do orków zbyt szybko. OBECNE problemy zupe³nie nam wystarczaj¹.
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
	description = "Jak leci?";
};
                       
func INT DIA_OCPAL_9_STANDARD_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCPAL_9_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_OCPAL_4_STANDARD_15_00"); //Jak siê maj¹ sprawy?
		
	if (Kapitel <= 3)
	{
		AI_Output (self,other,"DIA_OCPAL_4_STANDARD_09_01"); //Smoki zaatakowa³y ponownie! Jednak Innos ochroni nas w walce. Monstra Belaira zap³ac¹ za to wszystko w³asn¹ krwi¹!
	};

	if (Kapitel == 4)
	{
		if (MIS_KilledDragons < 4)
		{
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_09_02"); //£owcy smoków! Powinni byli przys³aæ tu paladynów!
		}
		else
		{
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_09_03"); //Teraz, kiedy nie ma ju¿ smoków, jedynym problemem pozostaj¹ orkowie!
		};
	};

	if (Kapitel >= 5)
	{
		if (MIS_OCGateOpen == FALSE)
		{
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_09_04"); //Musimy jak najszybciej za³adowaæ rudê na statki i uciekaæ z tej przeklêtej krainy.
		}
		else
		{
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_09_05"); //Zdrada! Brama nie powinna zostaæ otwarta. Œmieræ zdrajcom!
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
