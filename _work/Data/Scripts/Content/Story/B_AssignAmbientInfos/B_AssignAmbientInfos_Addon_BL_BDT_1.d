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
	description = "Kto tu jest szefem?";
};                       

FUNC INT DIA_Addon_BL_BDT_1_Chef_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_BL_BDT_1_Chef_Info()
{	
	AI_Output (other, self, "DIA_Addon_BL_BDT_1_Chef_15_00");//Kto tu jest szefem?
	
	if (RavenIsDead == TRUE)
	{
		if Npc_IsDead (Thorus)
		{
			AI_Output (self, other, "DIA_Addon_BL_BDT_1_Chef_01_01");//Przywódcy przychodz¹ i odchodz¹... Trudno ich zliczyæ.
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_BL_BDT_1_Chef_01_02");//Chyba naszym nowym szefem jest Thorus.
		};
	}
	else 
	{
		AI_Output (self, other, "DIA_Addon_BL_BDT_1_Chef_01_03");//Naszym nowym przywódc¹ jest Kruk. On nas tu doprowadzi³ i za³o¿y³ nasz obóz.
		AI_Output (self, other, "DIA_Addon_BL_BDT_1_Chef_01_04");//Sprawuje kontrolê nad kopalni¹, bo inaczej te psy dawno pozabija³yby siê o z³oto.
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
	description = "Co wiesz o obozie?";
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
	AI_Output (other, self, "DIA_Addon_BL_BDT_1_Lager_15_00");//Co wiesz o obozie?
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_Lager_01_01");//Gdy sta³o siê jasne, ¿e jest tu kopalnia z³ota, te szczury wyrzyna³y siê a¿ mi³o.
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_Lager_01_02");//Wtedy Kruk zabi³ najgorszych z nich, a resztê wyrzuci³ z kopalni.
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_Lager_01_03");//Od tamtej pory nikomu nie wolno wchodziæ na górny obszar. A wiêŸniów zapêdzi³ do pracy w kopalni.
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
	description = "Co mo¿esz mi powiedzieæ o obozowisku?";
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
	AI_Output (other, self, "DIA_Addon_BL_BDT_1_Lager2_15_00");//Co wiesz o obozie?
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_Lager2_01_01");//Je¿eli kogoœ zaatakujesz, WSZYSCY bêd¹ ciê œcigaæ.
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_Lager2_01_02");//No chyba ¿e masz dobry powód, ¿eby siê do kogoœ dobraæ. Wtedy nikt nie bêdzie siê wtr¹caæ.
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
	description = "Co nowego?";
};                       

FUNC INT DIA_Addon_BL_BDT_1_News_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_BL_BDT_1_News_Info()
{	
	AI_Output (other, self, "DIA_Addon_BL_BDT_1_News_15_00");//Co nowego?
	
	if (RavenIsDead == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_BL_BDT_1_News_01_01");//Kruk nie ¿yje. Co my teraz zrobimy?
	};
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_News_01_02");//Piraci nie chc¹ ju¿ woziæ nas na sta³y l¹d, bo nie dostali wynagrodzenia za ostatnie wycieczki.
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_News_01_03");//Powinniœmy wbiæ jednego czy dwóch na pal, wtedy reszta na pewno zmieni zdanie.
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
	description = "Co wiesz o wiêŸniach?";
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
	 
	AI_Output (other, self, "DIA_Addon_BL_BDT_1_Sklaven_15_00");//Co wiesz o wiêŸniach?
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_Sklaven_01_01");//Kruk chce, ¿eby coœ wykopali. Najpierw zmusi³ do tego bandytów, ale zbyt wielu z nich oszala³o.
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_Sklaven_01_02");//Dlatego zaprz¹g³ wiêŸniów - nawet gdy zgin¹, nie ma to znaczenia.
	
	if (BDT_1_Ausbuddeln == FALSE)
	{
		AI_Output (other, self, "DIA_Addon_BL_BDT_1_Sklaven_15_03");//Co Kruk chce wykopaæ?
		AI_Output (self, other, "DIA_Addon_BL_BDT_1_Sklaven_01_04");//Nie mam pojêcia, ale wygl¹da na to, ¿e to coœ wiêcej ni¿ z³oto.
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




