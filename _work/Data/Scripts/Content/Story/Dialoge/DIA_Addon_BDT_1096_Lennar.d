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
	description = "U� mus�m j�t.";
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
	description	= "Zdrav�m.";
};
FUNC INT DIA_Addon_Lennar_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Lennar_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Lennar_Hi_15_00");//Zdrav�m.
	AI_Output (self, other, "DIA_Addon_Lennar_Hi_01_01");//Zdrav�m. Jsem Lennar. V�tej v kop��sk�m t�bo�e.
	AI_Output (other, self, "DIA_Addon_Lennar_Hi_15_02");//Kop��sk�m? J� myslel, �e tohle b�val t�bor bandit�.
	AI_Output (self, other, "DIA_Addon_Lennar_Hi_01_03");//To jo, ale banditi sem taky p�i�li kopat. (pokr�� rameny) Tak�e co?
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
	description	= "K tomu pokusu o zavra�d�n� Estebana...";
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
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_00"); //(naivn�) Ano?
	AI_Output (other, self, "DIA_Addon_Lennar_ATTENTAT_15_01"); //M� tu�en�, kdo za t�m stoj�?
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_02"); //(nad�en�) Jasn�!
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_03"); //(hore�nat�) J� ti to �eknu! Vsad�m se, �e za t�m v�z� Emilio!
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_04"); //(hore�nat�) V�dycky se do dolu hnal jak ��lenec a kopal, co mu s�ly sta�ily.
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_05"); //(potuteln�) Ale od toho �toku u� jenom sed� na lavi�ce a nehne ani prstem.
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_06"); //(vysv�tluje) Je to jasn�! Do dolu se dostane, jedin� kdy� mu Esteban d� �ervenej k�men.
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_07"); //(spiklenecky) Ale vsad�m se, �e se mu neodva�uje pod�vat do o��.

	B_LogEntry (Topic_Addon_Esteban, "Lennar podez�r� Emilia, proto�e u� k Estebanovi nep�i�el.");
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
	description	= "A co by Emilio z Estebanovy smrti m�l?";
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
	AI_Output (other, self, "DIA_Addon_Lennar_Inspektor_15_00"); //A co by Emilio z Estebanovy smrti m�l?
	AI_Output (self, other, "DIA_Addon_Lennar_Inspektor_01_01"); //Co j� v�m? Mo�n� m� v dole ��k�ho k�mo�e, kterej by se r�d dostal na Estebanovo m�sto.
	AI_Output (self, other, "DIA_Addon_Lennar_Inspektor_01_02"); //(pro sebe) Jo, to by d�valo smysl.
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
	AI_Output (self, other, "DIA_Addon_Lennar_Mine_01_00");//Ty pro m� v�n� m� �ervenej k�men.
	AI_Output (self, other, "DIA_Addon_Lennar_Mine_01_01");//V�born�. Te� budu drtit ty zatracen� �utry na pr�ek � u� p�esn� v�m, kam p�jdu!
	AI_Output (self, other, "DIA_Addon_Lennar_Mine_01_02");//A je�t� jedna v�c � kdy� doluje�, d�vej pozor, abys ned�val moc SILN� r�ny. Jinak se ti krump�� v tom zlat� zakl�n�.
	
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
	description = "M��e� m� nau�it, jak dolovat zlato?";
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
	AI_Output (other, self, "DIA_Addon_Lennar_Gold_15_00"); //M��e� m� nau�it zlatokopectv�?
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_01"); //Ur�it�, ale a� t� to nau��m, bude� dolovat v�c zlata.
	AI_Output (other, self, "DIA_Addon_Lennar_Gold_15_02"); //Pr�v� proto se pt�m.
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_03"); //Jasn�, ale kdy� toho v�c vydoluje�, bylo by f�r se o to taky pod�lit.
	AI_Output (other, self, "DIA_Addon_Lennar_Gold_15_04"); //No...
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_05"); //Taky mi ten pod�l m��e� d�t nap�ed. �ekn�me...
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_06"); //tak pades�t zla��k�.
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
	description = "Nau� m� dolovat zlato! (50 zlat�ch)";
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
	AI_Output (other, self, "DIA_Addon_Lennar_Train_15_00"); //Nau� m� dolovat zlato!
	
	if B_GiveInvItems (other, self, itmi_gold, 50)
	{
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_01"); //Dob�e. Kdy� postupuje� d�l, d�vej pravideln� r�ny � nijak to nep�eh�n�j, ale zase u toho neusni.
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_02"); //A taky nemla� po��d do jednoho m�sta � sna� se to opracov�vat tak, abys z�skal slu�nej nugget.
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_03"); //Kdy� to takhle bude� d�lat, za chv�li z tebe bude mistr.
		
		B_Upgrade_Hero_HackChance(10);
		Lennar_TeachGold = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_04"); //Nap�ed chci vid�t sv�j pod�l!
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
	Description = "Je v�echno v po��dku?"; 
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
	AI_Output (other, self, "DIA_Addon_BDT_10004_Lennar_Hacker_15_00"); //Je v�ecko v po��dku?
	AI_Output (self, other, "DIA_Addon_BDT_10004_Lennar_Hacker_01_01"); //Hezky pravideln� � jen tak z�sk� p�kn� velk� nuggety!
};


