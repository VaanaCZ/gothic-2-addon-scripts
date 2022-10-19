// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Bill_EXIT(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 999;
	condition	= DIA_Addon_Bill_EXIT_Condition;
	information	= DIA_Addon_Bill_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Bill_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Bill_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Bill_PICKPOCKET (C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 900;
	condition	= DIA_Addon_Bill_PICKPOCKET_Condition;
	information	= DIA_Addon_Bill_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Addon_Bill_PICKPOCKET_Condition()
{
	C_Beklauen (80, 205);
};
 
FUNC VOID DIA_Addon_Bill_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Bill_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Bill_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Bill_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Bill_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Bill_PICKPOCKET_DoIt);
};

func void DIA_Addon_Bill_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Bill_PICKPOCKET);
};
	
func void DIA_Addon_Bill_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Bill_PICKPOCKET);
};
// ************************************************************
// 			  				   Hello
// ************************************************************
INSTANCE DIA_Addon_Bill_Hello(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 1;
	condition	= DIA_Addon_Bill_Hello_Condition;
	information	= DIA_Addon_Bill_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Bill_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Bill_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bill_Hello_15_00"); //Jak se ti vede?
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_01"); //Co je? Poslal t� sem Henry?
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_02"); //Vy�i� mu, �e ty fo�ny dostane, hned jak tady skon��m.
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_03"); //A jestli nem��e tak dlouho �ekat, tak a� si vezme pilu a na�e�e si je s�m.
	
	Npc_ExchangeRoutine (self, "START");
};

// ************************************************************
// 			  				 Planks
// ************************************************************
INSTANCE DIA_Addon_Bill_Planks(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 2;
	condition	= DIA_Addon_Bill_Planks_Condition;
	information	= DIA_Addon_Bill_Planks_Info;

	description = "Na co jsou v�m v�echny tyhle fo�ny?";
};                       
FUNC INT DIA_Addon_Bill_Planks_Condition()
{
	if (GregIsBAck == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_Bill_Planks_Info()
{	
	AI_Output (other, self, "DIA_Addon_Bill_Planks_15_00"); //Na co ta prkna pot�ebujete?
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_01"); //No p�eci na palis�du, ty troubo.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_02"); //Greg si mysl�, �e je dobr� takhle opevnit t�bor.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_03"); //Ale podle m� jsme si tu pr�ci mohli u�et�it.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_04"); //Pokud n�s banditi v�n� cht�j� napadnout, pak je tahle sm�n� palis�di�ka stejn� nezastav�.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_05"); //Nikdy jsme je tady v na�em �dol� nem�li trp�t.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_06"); //Kdybych to byl v�d�l, z�stal bych v Khorinidu.
};
	
// ************************************************************
// 							PERM
// ************************************************************
var int Bill_Perm_Once;

instance DIA_Addon_Bill_Perm		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 4;
	condition	= DIA_Addon_Bill_Perm_Condition;
	information	= DIA_Addon_Bill_Perm_Info;
	permanent	= TRUE;
	description	= "M��u ti pomoct s �ez�n�m?";
};
func int DIA_Addon_Bill_Perm_Condition ()
{
	if (GregIsBack == FALSE)
	&& (Npc_WasInState (self, ZS_Saw))
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_Perm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bill_Perm_15_00"); //M��u ti pomoct s t�m �ez�n�m?
	AI_Output	(self, other, "DIA_Addon_Bill_Perm_03_01"); //Ne, zvl�dnu to s�m.
	if (Bill_Perm_Once == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Bill_Perm_03_02"); //P�idal jsem se sem p�ed ned�vnem, a kdybych te� za sebe nechal n�koho makat, nepomohlo by mi to, jestli m� ch�pe�.
		Bill_Perm_Once = TRUE;
	};
};

// ************************************************************
//							PERM 2
// ************************************************************
instance DIA_Addon_Bill_Perm2		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 5;
	condition	= DIA_Addon_Bill_Perm2_Condition;
	information	= DIA_Addon_Bill_Perm2_Info;
	permanent	= TRUE;
	description	= "Co te� d�l�?";
};
func int DIA_Addon_Bill_Perm2_Condition ()
{
	if (GregIsBack == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_Perm2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bill_Perm2_15_00"); //Co te� bude� d�lat?
	AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_01"); //D�m si pauzu.
	if (!Npc_IsDead(Francis))
	{
		AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_02"); //(�kodolib�) Mou pr�ci dostal Francis.
		AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_03"); //Bude �ezat tak dlouho, dokud mu neupadnou ruce.
	};
};



// ************************************************************
// ***														***
// 					Die Angus und Hank Show
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 					Ich suche Angus und Hank.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Bill_AngusnHank(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 11;
	condition	= DIA_Addon_Bill_AngusnHank_Condition;
	information	= DIA_Addon_Bill_AngusnHank_Info;
	permanent	= FALSE;
	description = "Hled�m Anguse a Hanka.";
};                       
FUNC INT DIA_Addon_Bill_AngusnHank_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Skip_AngusHank))
	&&  Npc_HasItems (Angus, ItRi_Addon_MorgansRing_Mission)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Bill_AngusnHank_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bill_AngusnHank_15_00"); //Hled�m Anguse a Hanka.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_01"); //(povzdychne si) Nem�m pon�t�, kde jsou � nejsp� je dostali banditi.
	AI_Output (other,self ,"DIA_Addon_Bill_AngusnHank_15_02"); //Vy jste byli p��tel�, �e jo?
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_03"); //V�m akor�t to, �e se s banditama sch�zeli v jeskyni nedaleko odsud.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_04"); //Mus� to bejt kus od t�bora, sm�rem na v�chod. 
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_05"); //Ale p�esn� to nev�m, nikdy jsem tam nebyl.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_06"); //Mo�n� by ses na to mohl zeptat Krokod�la Jacka, ten kolem t�bora obch�z� furt.

	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Angus a Hank m�li v�chodn� od t�bora svou jeskyni. V�c by mi o n� mohl ��ci Krokod�l Jack.");
};

// ------------------------------------------------------------
// 							Sie sind tot.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Bill_FoundFriends(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 12;
	condition	= DIA_Addon_Bill_FoundFriends_Condition;
	information	= DIA_Addon_Bill_FoundFriends_Info;
	permanent	= FALSE;
	description = "Na�el jsem tv� p��tele.";
};                       
FUNC INT DIA_Addon_Bill_FoundFriends_Condition()
{
	if (!Npc_HasItems (Angus, ItRi_Addon_MorgansRing_Mission))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Bill_FoundFriends_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_00"); //Na�el jsem tv� p��tele.
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_01"); //A co? Kde jsou?
	AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_02"); //Jsou mrtv�.
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_03"); //(nen�vistn�) To ud�lali ti zatracen� banditi!
	if (SC_Knows_JuanMurderedAngus == FALSE)
	{
		AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_06"); //Je to mo�n�.
	};
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_04"); //Ty proklet� svin�! A� se sma�ej v pekle!
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_05"); //(pro sebe, nen�vistn�) Kdybych jen v�d�l, kter� kurva to ud�lala!
	
	MIS_Addon_Bill_SearchAngusMurder = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_KillJuan,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_KillJuan,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_KillJuan,"Billa zdrtilo, kdy� se dozv�d�l o smrti Anguse a Hanka. Chce zn�t jm�na jejich vrah�.");
};	

// ------------------------------------------------------------
// 						Ich kenne den M�rder
// ------------------------------------------------------------
instance DIA_Addon_Bill_JuanMurder		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 13;
	condition	= DIA_Addon_Bill_JuanMurder_Condition;
	information	= DIA_Addon_Bill_JuanMurder_Info;

	description	= "V�m, kdo zabil Anguse a Hanka.";
};
func int DIA_Addon_Bill_JuanMurder_Condition ()
{
	if (MIS_Addon_Bill_SearchAngusMurder == LOG_RUNNING)
	&& (SC_Knows_JuanMurderedAngus == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_JuanMurder_Info ()
{
	AI_Output (other, self, "DIA_Addon_Bill_JuanMurder_15_00"); //V�m, kdo zabil Anguse a Hanka.
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_01"); //(vzru�en�) Kdo? Kdo to byl?
	AI_Output (other, self, "DIA_Addon_Bill_JuanMurder_15_02"); //Jmenuje se Juan, pat�� k bandit�m.
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_03"); //Mus� toho hajzla dostat, sly��?
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_04"); //Tohle mu nesm� proj�t.
	
	B_LogEntry	(TOPIC_Addon_KillJuan,"M�m zab�t Juana, abych pomstil Anguse a Hanka.");
};

// ------------------------------------------------------------
// 						Juan ist erledigt.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Bill_KilledEsteban(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 14;
	condition	= DIA_Addon_Bill_KilledEsteban_Condition;
	information	= DIA_Addon_Bill_KilledEsteban_Info;

	description = "Juan u� to m� za sebou.";
};                       
FUNC INT DIA_Addon_Bill_KilledEsteban_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Bill_JuanMurder))
	&& (Npc_IsDead (Juan))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Bill_KilledEsteban_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bill_KilledEsteban_15_00"); //Juan u� to m� za sebou.
	AI_Output (self ,other,"DIA_Addon_Bill_KilledEsteban_03_01"); //(nad�en�) Fakt? A bolelo to?
	AI_Output (other,self ,"DIA_Addon_Bill_KilledEsteban_15_02"); //Ne�va�!
	AI_Output (self ,other,"DIA_Addon_Bill_KilledEsteban_03_03"); //(povzdychne si) No, aspo� �es tu svini zabil.
	
	B_LogEntry	(TOPIC_Addon_KillJuan,"Juan je vy��zen�, co� Billa velice pot�ilo.");
	MIS_Addon_Bill_SearchAngusMurder = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Bill_KillAngusMurder);
	
};



// ************************************************************
// ***														***
//							Pick Pocket
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 							Khorinis?
// ------------------------------------------------------------
instance DIA_Addon_Bill_Khorinis		(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr		 	= 21;
	condition	= DIA_Addon_Bill_Khorinis_Condition;
	information	= DIA_Addon_Bill_Khorinis_Info;

	description	= "Byls n�kdy v Khorinidu?";
};
func int DIA_Addon_Bill_Khorinis_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Bill_Planks))
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_Khorinis_Info ()
{
	AI_Output (other, self, "DIA_Addon_Bill_Khorinis_15_00"); //Byls v Khorinidu?
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_01"); //Jo, trochu jsem kapsa�il a sem tam ��kej �vindl, abych se udr�el nad vodou.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_02"); //Ale jak za�alo p�ij�d�t ��m d�l t�m m�� lod�, k�efty �ly taky ��m d�l h��.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_03"); //A v jedn� chv�li u� m� p�estalo bavit pro p�r kraj�c� furt zdrhat p�ed domobranou.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_04"); //A tak jsem se p�idal ke Gregovi a te� tr��m tady.

	if (GregIsBAck == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_05"); //(povzdychne si) Cel� dny �e�u d�evo na palis�du, kter� je stejn� k ni�emu.
	};
};

// ------------------------------------------------------------
// 							Wanna Learn
// ------------------------------------------------------------
instance DIA_Addon_Bill_TeachPlayer		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 22;
	condition	= DIA_Addon_Bill_TeachPlayer_Condition;
	information	= DIA_Addon_Bill_TeachPlayer_Info;
	
	description	= "M��e� m� n��emu nau�it?";
};
func int DIA_Addon_Bill_TeachPlayer_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Bill_Khorinis))
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_TeachPlayer_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bill_TeachPlayer_15_00"); //M��e� m� n��emu nau�it?
	AI_Output	(self, other, "DIA_Addon_Bill_TeachPlayer_03_01"); //No, mohl bych ti uk�zat, jak nepozorovan� vyb�rat ciz� kapsy.
	AI_Output	(self, other, "DIA_Addon_Bill_TeachPlayer_03_02"); //Ale mus� bejt aspo� trochu obratnej, jinak m� sm�lu.

	Bill_Addon_TeachPickPocket = TRUE;
};

// ------------------------------------------------------------
// 						Teach Pickpocket
// ------------------------------------------------------------
instance DIA_Addon_Bill_LearnTalent		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 23;
	condition	= DIA_Addon_Bill_LearnTalent_Condition;
	information	= DIA_Addon_Bill_LearnTalent_Info;
	permanent 	= TRUE;
	description	= "Uka� mi, jak vyb�rat ciz� kapsy. (10 VB)";
};
func int DIA_Addon_Bill_LearnTalent_Condition ()
{
	if (Bill_Addon_TeachPickPocket == TRUE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_PICKPOCKET) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_LearnTalent_Info ()
{
	AI_Output (other, self, "DIA_Addon_Bill_LearnTalent_15_00"); //Uka� mi, jak vyb�rat kapsy.
	
	if (other.attribute[ATR_DEXTERITY] >= 40) //braucht man f�r Francis
	{
		if (B_TeachThiefTalent (self, other, NPC_TALENT_PICKPOCKET))
		{
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_01"); //Nap�ed se mus� postarat, aby se tv� ob� cejtila �pln� v bezpe��.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_02"); //Nejlep�� je k n�komu p�ij�t a za��t kl�bosit, to funguje jak kouzlo.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_03"); //A pak je �as na zlod�jskej hmat, ale pozor, a� si nikdo ni�eho nev�imne.

			AI_Output (other, self, "DIA_Addon_Bill_LearnTalent_15_05"); //Je�t� n�co?
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_06"); //Jo, cvi� se v obratnosti. ��m bude� obratn�j��, t�m l�p ti to p�jde.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_07"); //A t�m d��v uleh�� svejm ob�tem o r�zn� v�ci, ani� by si t� v�imly.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_08"); //To je v�ecko, aspo� teoreticky.
		};
	}
	else 
	{
		AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_09"); //Zapome� na to! Nejsi dost obratnej!
		AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_10"); //Bu� se nap�ed pocvi� v obratnosti, nebo si najdi lep��ho u�itele.
	};
};

