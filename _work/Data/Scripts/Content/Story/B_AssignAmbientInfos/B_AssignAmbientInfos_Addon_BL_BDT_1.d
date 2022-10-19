// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_Addon_BL_BDT_1_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_Addon_BL_BDT_1_EXIT_Condition;
	information	= DIA_Addon_BL_BDT_1_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Addon_BL_BDT_1_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_BL_BDT_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// *************************************************************************
// 									Chef
// *************************************************************************
instance DIA_Addon_BL_BDT_1_Chef(C_INFO)
{
	nr			= 2;
	condition	= DIA_Addon_BL_BDT_1_Chef_Condition;
	information	= DIA_Addon_BL_BDT_1_Chef_Info;
	permanent	= TRUE;
	description = "Kdo tady tomu velí?";
};                       

FUNC INT DIA_Addon_BL_BDT_1_Chef_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_BL_BDT_1_Chef_Info()
{	
	AI_Output (other, self, "DIA_Addon_BL_BDT_1_Chef_15_00");//Kdo to tady vede?
	
	if (RavenIsDead == TRUE)
	{
		if Npc_IsDead (Thorus)
		{
			AI_Output (self, other, "DIA_Addon_BL_BDT_1_Chef_01_01");//Tady poâád odcházejí a pâicházejí noví velitelé, takže za chvíli ztratíš pâehled.
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_BL_BDT_1_Chef_01_02");//Ale myslím, že teë je naším šéfem Thorus.
		};
	}
	else 
	{
		AI_Output (self, other, "DIA_Addon_BL_BDT_1_Chef_01_03");//Náš velitel je Havran. Dovedl nás sem a vystavêl tábor.
		AI_Output (self, other, "DIA_Addon_BL_BDT_1_Chef_01_04");//Ovládá dùl, jinak by se ti psi pro to zlato už dávno navzájem pozabíjeli.
	};
};
// *************************************************************************
// 									Lager (nicht perm!)
// *************************************************************************
instance DIA_Addon_BL_BDT_1_Lager(C_INFO)
{
	nr			= 3;
	condition	= DIA_Addon_BL_BDT_1_Lager_Condition;
	information	= DIA_Addon_BL_BDT_1_Lager_Info;
	permanent	= FALSE;
	description = "Co bys mi âekl o táboâe?";
};                       

FUNC INT DIA_Addon_BL_BDT_1_Lager_Condition()
{	
	if ((Sklaven_Flucht == FALSE)
	|| !Npc_IsDead (Raven))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_BL_BDT_1_Lager_Info()
{	
	AI_Output (other, self, "DIA_Addon_BL_BDT_1_Lager_15_00");//Co víš o táboâe?
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_Lager_01_01");//Když se provalilo, že je tu zlatej dùl, zaèalo to v týhle bandê flákaèù poâádnê vâít.
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_Lager_01_02");//Ty nejhorší Havran pozabíjel a zbytek poslal do dolu.
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_Lager_01_03");//Od tý doby sem nahoru nikdo nesmí. V dole musí kopat dokonce i všichni vêzni.
	if (SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry (TOPIC_Addon_RavenKDW, LogText_Addon_RavensGoldmine); 
		Log_AddEntry (TOPIC_Addon_Sklaven, LogText_Addon_RavensGoldmine); 
		B_LogEntry (TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};
	SC_KnowsRavensGoldmine = TRUE;
};
// *************************************************************************
// 									Lager2
// *************************************************************************
instance DIA_Addon_BL_BDT_1_Lager2(C_INFO)
{
	nr			= 3;
	condition	= DIA_Addon_BL_BDT_1_Lager2_Condition;
	information	= DIA_Addon_BL_BDT_1_Lager2_Info;
	permanent	= TRUE;
	description = "Co bys mi âekl o táboâe?";
};                       

FUNC INT DIA_Addon_BL_BDT_1_Lager2_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_BL_BDT_1_Lager)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_BL_BDT_1_Lager2_Info()
{	
	AI_Output (other, self, "DIA_Addon_BL_BDT_1_Lager2_15_00");//Co víš o táboâe?
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_Lager2_01_01");//Jestli nêkoho z nich napadneš, sesypou se na tebe VŠICHNI.
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_Lager2_01_02");//Pokud tedy nebudeš mít k tý hádce dobrej dùvod. Pak se ti do toho nikdo plést nebude.
};
// *************************************************************************
// 								News
// *************************************************************************
instance DIA_Addon_BL_BDT_1_News(C_INFO)
{
	nr			= 4;
	condition	= DIA_Addon_BL_BDT_1_News_Condition;
	information	= DIA_Addon_BL_BDT_1_News_Info;
	permanent	= TRUE;
	description = "Nêco nového?";
};                       

FUNC INT DIA_Addon_BL_BDT_1_News_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_BL_BDT_1_News_Info()
{	
	AI_Output (other, self, "DIA_Addon_BL_BDT_1_News_15_00");//Nêco nového?
	
	if (RavenIsDead == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_BL_BDT_1_News_01_01");//Havran je mrtvý, co si teë poèneme?
	};
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_News_01_02");//Piráti nás na pevninu nepâevezou, protože jsme jim za to už párkrát nezaplatili.
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_News_01_03");//Mêli bysme jich pár zapíchnout. Ostatní by snad potom dostali rozum a radši nás pâevezli.
};
// *************************************************************************
// 									Sklaven
// *************************************************************************
instance DIA_Addon_BL_BDT_1_Sklaven(C_INFO)
{
	nr			= 5;
	condition	= DIA_Addon_BL_BDT_1_Sklaven_Condition;
	information	= DIA_Addon_BL_BDT_1_Sklaven_Info;
	permanent	= TRUE;
	description = "Co víš o vêzních?";
};  
FUNC INT DIA_Addon_BL_BDT_1_Sklaven_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_BL_BDT_1_Lager)
	&& ((Sklaven_Flucht == FALSE)
	|| (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_BL_BDT_1_Sklaven_Info()
{	
	 
	AI_Output (other, self, "DIA_Addon_BL_BDT_1_Sklaven_15_00");//Co víš o vêzních?
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_Sklaven_01_01");//Havran chce nêco vykopat. Napâed to nechal dêlat bandity, ale až moc jich pâitom zaâvalo.
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_Sklaven_01_02");//Takže sem pâived vêznê - u têch na úmrtnosti tolik nezáleží.
	
	if (BDT_1_Ausbuddeln == FALSE)
	{
		AI_Output (other, self, "DIA_Addon_BL_BDT_1_Sklaven_15_03");//Co chce Havran vykopat?
		AI_Output (self, other, "DIA_Addon_BL_BDT_1_Sklaven_01_04");//Nemám páru, ale urèitê je to nêco víc než zlato.
		BDT_1_Ausbuddeln = TRUE;
	};
};
FUNC VOID B_AssignAmbientInfos_Addon_BL_BDT_1 (var c_NPC slf)
{
	DIA_Addon_BL_BDT_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_Chef.npc					= Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_Lager.npc				= Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_News.npc					= Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_Sklaven.npc				= Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_Lager2.npc				= Hlp_GetInstanceID(slf);
};




