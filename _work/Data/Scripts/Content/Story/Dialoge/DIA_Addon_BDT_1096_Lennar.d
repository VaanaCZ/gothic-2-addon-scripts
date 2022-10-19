//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_EXIT   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 999;
	condition   = DIA_Addon_Lennar_EXIT_Condition;
	information = DIA_Addon_Lennar_EXIT_Info;
	permanent   = TRUE;
	description = "Uû musÌm jÌt.";
};
FUNC INT DIA_Addon_Lennar_EXIT_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Lennar_EXIT_Info()
{		
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Lennar_PICKPOCKET (C_INFO)
{
	npc			= BDT_1096_Addon_Lennar;
	nr			= 900;
	condition	= DIA_Addon_Lennar_PICKPOCKET_Condition;
	information	= DIA_Addon_Lennar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       
FUNC INT DIA_Addon_Lennar_PICKPOCKET_Condition()
{
	C_Beklauen (65, 100);
};
 
FUNC VOID DIA_Addon_Lennar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Lennar_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Lennar_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Lennar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Lennar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Lennar_PICKPOCKET_DoIt);
};

func void DIA_Addon_Lennar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Lennar_PICKPOCKET);
};
	
func void DIA_Addon_Lennar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Lennar_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Hi   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 1;
	condition   = DIA_Addon_Lennar_Hi_Condition;
	information = DIA_Addon_Lennar_Hi_Info;
	permanent   = FALSE;
	description	= "ZdravÌm.";
};
FUNC INT DIA_Addon_Lennar_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Lennar_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Lennar_Hi_15_00");//ZdravÌm.
	AI_Output (self, other, "DIA_Addon_Lennar_Hi_01_01");//ZdravÌm. Jsem Lennar. VÌtej v kop·Ësk˝m t·bo¯e.
	AI_Output (other, self, "DIA_Addon_Lennar_Hi_15_02");//Kop·Ësk˝m? J· myslel, ûe tohle b˝val t·bor bandit˘.
	AI_Output (self, other, "DIA_Addon_Lennar_Hi_01_03");//To jo, ale banditi sem taky p¯iöli kopat. (pokrËÌ rameny) Takûe co?
};

//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Attentat   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 2;
	condition   = DIA_Addon_Lennar_Attentat_Condition;
	information = DIA_Addon_Lennar_Attentat_Info;
	permanent   = FALSE;
	description	= "K tomu pokusu o zavraûdÏnÌ Estebana...";
};
FUNC INT DIA_Addon_Lennar_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Lennar_Attentat_Info()
{
	B_Say (other, self, "$ATTENTAT_ADDON_DESCRIPTION2"); //Wegen des Attentast auf Esteban
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_00"); //(naivnÏ) Ano?
	AI_Output (other, self, "DIA_Addon_Lennar_ATTENTAT_15_01"); //M·ö tuöenÌ, kdo za tÌm stojÌ?
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_02"); //(nadöenÏ) JasnÏ!
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_03"); //(horeËnatÏ) J· ti to ¯eknu! VsadÌm se, ûe za tÌm vÏzÌ Emilio!
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_04"); //(horeËnatÏ) Vûdycky se do dolu hnal jak öÌlenec a kopal, co mu sÌly staËily.
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_05"); //(potutelnÏ) Ale od toho ˙toku uû jenom sedÌ na laviËce a nehne ani prstem.
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_06"); //(vysvÏtluje) Je to jasn˝! Do dolu se dostane, jedinÏ kdyû mu Esteban d· Ëervenej k·men.
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_07"); //(spiklenecky) Ale vsadÌm se, ûe se mu neodvaûuje podÌvat do oËÌ.

	B_LogEntry (Topic_Addon_Esteban, "Lennar podezÌr· Emilia, protoûe uû k Estebanovi nep¯iöel.");
};

//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Inspektor (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 3;
	condition   = DIA_Addon_Lennar_Inspektor_Condition;
	information = DIA_Addon_Lennar_Inspektor_Info;
	permanent   = FALSE;
	description	= "A co by Emilio z Estebanovy smrti mÏl?";
};
FUNC INT DIA_Addon_Lennar_Inspektor_Condition()
{	
	if (Npc_KnowsInfo(other, DIA_Addon_Lennar_Attentat))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lennar_Inspektor_Info()
{
	AI_Output (other, self, "DIA_Addon_Lennar_Inspektor_15_00"); //A co by Emilio z Estebanovy smrti mÏl?
	AI_Output (self, other, "DIA_Addon_Lennar_Inspektor_01_01"); //Co j· vÌm? Moûn· m· v dole Ú·k˝ho k·moöe, kterej by se r·d dostal na Estebanovo mÌsto.
	AI_Output (self, other, "DIA_Addon_Lennar_Inspektor_01_02"); //(pro sebe) Jo, to by d·valo smysl.
};

//----------------------------------------------------------------------
//	Info Mine
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Mine   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 4;
	condition   = DIA_Addon_Lennar_Mine_Condition;
	information = DIA_Addon_Lennar_Mine_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};
FUNC INT DIA_Addon_Lennar_Mine_Condition()
{	
	if (MIS_Send_Buddler == LOG_RUNNING)
	&& (Player_SentBuddler < 3)
	&& (Npc_HasItems (other, ItmI_Addon_Stone_01) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lennar_Mine_Info()
{	
	B_Say 	  (other, self, "$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems (other, self, ItmI_Addon_Stone_01,1);
	AI_Output (self, other, "DIA_Addon_Lennar_Mine_01_00");//Ty pro mÏ v·ûnÏ m·ö Ëervenej k·men.
	AI_Output (self, other, "DIA_Addon_Lennar_Mine_01_01");//V˝bornÏ. TeÔ budu drtit ty zatracen˝ öutry na pr·öek ñ uû p¯esnÏ vÌm, kam p˘jdu!
	AI_Output (self, other, "DIA_Addon_Lennar_Mine_01_02");//A jeötÏ jedna vÏc ñ kdyû dolujeö, d·vej pozor, abys ned·val moc SILN› r·ny. Jinak se ti krump·Ë v tom zlatÏ zaklÌnÌ.
	
	B_Upgrade_Hero_HackChance(10);
	
	Player_SentBuddler = (Player_SentBuddler +1);
	B_GivePlayerXP (XP_Addon_MINE);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"MINE");
};

//---------------------------------------------------------------------
//	Info Gold
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Gold   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 5;
	condition   = DIA_Addon_Lennar_Gold_Condition;
	information = DIA_Addon_Lennar_Gold_Info;
	permanent   = FALSE;
	description = "M˘ûeö mÏ nauËit, jak dolovat zlato?";
};
FUNC INT DIA_Addon_Lennar_Gold_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Lennar_Hi)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Lennar_Gold_Info()
{
	AI_Output (other, self, "DIA_Addon_Lennar_Gold_15_00"); //M˘ûeö mÏ nauËit zlatokopectvÌ?
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_01"); //UrËitÏ, ale aû tÏ to nauËÌm, budeö dolovat vÌc zlata.
	AI_Output (other, self, "DIA_Addon_Lennar_Gold_15_02"); //Pr·vÏ proto se pt·m.
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_03"); //JasnÏ, ale kdyû toho vÌc vydolujeö, bylo by fÈr se o to taky podÏlit.
	AI_Output (other, self, "DIA_Addon_Lennar_Gold_15_04"); //No...
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_05"); //Taky mi ten podÌl m˘ûeö d·t nap¯ed. ÿeknÏme...
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_06"); //tak pades·t zlaù·k˘.
};

//---------------------------------------------------------------------
//	Train
//---------------------------------------------------------------------
var int Lennar_TeachGold;
// --------------------------------------------
INSTANCE DIA_Addon_Lennar_Train   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 6;
	condition   = DIA_Addon_Lennar_Train_Condition;
	information = DIA_Addon_Lennar_Train_Info;
	permanent   = TRUE;
	description = "NauË mÏ dolovat zlato! (50 zlat˝ch)";
};
FUNC INT DIA_Addon_Lennar_Train_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Lennar_Gold))
	&& (Lennar_TeachGold == FALSE)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Lennar_Train_Info()
{
	AI_Output (other, self, "DIA_Addon_Lennar_Train_15_00"); //NauË mÏ dolovat zlato!
	
	if B_GiveInvItems (other, self, itmi_gold, 50)
	{
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_01"); //Dob¯e. Kdyû postupujeö d·l, d·vej pravideln˝ r·ny ñ nijak to nep¯eh·nÏj, ale zase u toho neusni.
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_02"); //A taky nemlaù po¯·d do jednoho mÌsta ñ snaû se to opracov·vat tak, abys zÌskal sluönej nugget.
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_03"); //Kdyû to takhle budeö dÏlat, za chvÌli z tebe bude mistr.
		
		B_Upgrade_Hero_HackChance(10);
		Lennar_TeachGold = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_04"); //Nap¯ed chci vidÏt sv˘j podÌl!
	};
};
//----------------------------------------------------------------------
//	Info Hacker
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Hacker   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 9;
	condition   = DIA_Addon_Lennar_Hacker_Condition;
	information = DIA_Addon_Lennar_Hacker_Info;
	permanent   = TRUE;
	Description = "Je vöechno v po¯·dku?"; 
};
FUNC INT DIA_Addon_Lennar_Hacker_Condition()
{	
	if (Npc_GetDistToWP (self,"ADW_MINE_PICK_09") <= 500)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lennar_Hacker_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10004_Lennar_Hacker_15_00"); //Je vöecko v po¯·dku?
	AI_Output (self, other, "DIA_Addon_BDT_10004_Lennar_Hacker_01_01"); //Hezky pravidelnÏ ñ jen tak zÌsk·ö pÏknÏ velk˝ nuggety!
};


