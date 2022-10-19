///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Baltram_EXIT   (C_INFO)
{
	npc         = VLK_410_Baltram;
	nr          = 999;
	condition   = DIA_Baltram_EXIT_Condition;
	information = DIA_Baltram_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Baltram_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Baltram_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////AUSKOMMENTIERT WEGEN ADDON M.F. (Missionen passen nicht mehr, Spielflu� hemmend)
//	Info Sperre
///////////////////////////////////////////////////////////////////////
/*
instance DIA_Baltram_Sperre		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 = 	1;
	condition	 = 	DIA_Baltram_Sperre_Condition;
	information	 = 	DIA_Baltram_Sperre_Info;
	permanent	 =  TRUE;
	important	 = 	TRUE;
};
func int DIA_Baltram_Sperre_Condition ()
{
	if (Canthar_Sperre == TRUE)
	&& (Npc_IsInState (self, ZS_Talk ))
	&& ((!Npc_KnowsInfo (other, DIA_Addon_Baltram_LaresAbloese))
	|| (SCIsWearingRangerRing == FALSE))
	{
		return TRUE;
	};
};
func void DIA_Baltram_Sperre_Info ()
{
	AI_Output (self, other, "DIA_Baltram_Sperre_01_00"); //Was willst du? Du bist ein Str�fling aus der Minenkolonie. Mit dir mache ich keine Gesch�fte!
	AI_StopProcessInfos (self);	 
};
*/
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_Hallo		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 = 	2;
	condition	 = 	DIA_Baltram_Hallo_Condition;
	information	 = 	DIA_Baltram_Hallo_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Baltram_Hallo_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	//&& (Canthar_Sperre == FALSE)
	&& (MIS_Nagur_Bote == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Baltram_Hallo_Info ()
{
	if (hero.guild != GIL_SLD)
	&& (hero.guild != GIL_DJG)
	{
		AI_Output (self, other, "DIA_Baltram_Hallo_01_00"); //V�tej, cizin�e, jmenuji se Baltram. P�i�el ses z�sobit j�dlem?
		AI_Output (self, other, "DIA_Baltram_Hallo_01_01"); //Ob�v�m se, �e t� zklamu. Moc toho pr�v� te� na sklad� nem�m.
		AI_Output (self, other, "DIA_Baltram_Hallo_01_02"); //Ale ka�d�m dnem bych m�l dostat nov� zbo��.
	}
	else
	{
		AI_Output (self, other, "DIA_Baltram_Hallo_01_03"); //Pokud jsi u m� cht�l nakoupit j�dlo, m��e� j�t klidn� zase pry�.
		AI_Output (self, other, "DIA_Baltram_Hallo_01_04"); //Nemysl�m si o v�s �old�c�ch nic dobr�ho! Zp�sobujete jen sam� probl�my.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info LaresAbloese
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Baltram_LaresAbloese		(C_INFO)
{
	npc		 	= VLK_410_Baltram;
	nr		 	= 1;
	condition	= DIA_Addon_Baltram_LaresAbloese_Condition;
	information	= DIA_Addon_Baltram_LaresAbloese_Info;

	important 	= TRUE;
};

func int DIA_Addon_Baltram_LaresAbloese_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (SCIsWearingRangerRing == TRUE)
	&& (MIS_Lares_BringRangerToMe == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Baltram_LaresAbloese_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Baltram_LaresAbloese_15_00"); //Pro� se tv��� tak pochybova�n�?
	AI_Output	(self, other, "DIA_Addon_Baltram_LaresAbloese_01_01"); //Vid�m, �e nese� znamen� kruhu vody.
	AI_Output	(other, self, "DIA_Addon_Baltram_LaresAbloese_15_02"); //Tak�e ty k nim taky pat��?
	AI_Output	(self, other, "DIA_Addon_Baltram_LaresAbloese_01_03"); //A co kdy� ano?
	AI_Output	(other, self, "DIA_Addon_Baltram_LaresAbloese_15_04"); //Pak bych ti m�l ��ct, �e Lares by pot�eboval, aby ho n�kdo tam dole v p��stavu nahradil.
	AI_Output	(self, other, "DIA_Addon_Baltram_LaresAbloese_01_05"); //Fajn, kdy� je to tak, postar�m se, aby se toho n�kdo ujal.
	AI_Output	(other, self, "DIA_Addon_Baltram_LaresAbloese_15_06"); //Ch�pu.
	B_GivePlayerXP (XP_Ambient);

	B_LogEntry (TOPIC_Addon_BringRangerToLares,"Baltram, obchodn�k z tr�i�t�, je ochoten vyst��dat Larese. Snad u� tedy kone�n� bude moci opustit p��stav."); 

	SC_KnowsBaltramAsRanger = TRUE;
	Baltram_Exchange4Lares = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Job
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_Job		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 = 	3;
	condition	 = 	DIA_Baltram_Job_Condition;
	information	 = 	DIA_Baltram_Job_Info;
	permanent	 =  FALSE;
	description  =  "M� pro m� pr�ci?";
};
func int DIA_Baltram_Job_Condition ()
{
	if (MIS_Nagur_Bote != LOG_RUNNING)
	&& (MIS_Nagur_Bote != LOG_SUCCESS)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
func void DIA_Baltram_Job_Info ()
{
	AI_Output (other, self, "DIA_Baltram_Job_15_00"); //M� pro m� pr�ci?
	AI_Output (self, other, "DIA_Baltram_Job_01_01"); //Ne, posl��ka u� m�m. Zkus to u jin�ho obchodn�ka.
};
///////////////////////////////////////////////////////////////////////
//	Info Trick
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_Trick		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 = 	4;
	condition	 = 	DIA_Baltram_Trick_Condition;
	information	 = 	DIA_Baltram_Trick_Info;
	permanent	 =  FALSE;
	important 	 =  TRUE;
};
func int DIA_Baltram_Trick_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	&& (MIS_Nagur_Bote == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Baltram_Trick_Info ()
{
	AI_Output (self, other, "DIA_Baltram_Trick_01_00"); //Hled� pr�ci?
	AI_Output (other, self, "DIA_Baltram_Trick_15_01"); //Jasn�, o co jde?
	AI_Output (self, other, "DIA_Baltram_Trick_01_02"); //M�j posl��ek se je�t� nevr�til zp�tky a j� �ek�m dod�vku od farm��e Akila.
	AI_Output (other, self, "DIA_Baltram_Trick_15_03"); //A kolik mi za to d�?
	AI_Output (self, other, "DIA_Baltram_Trick_01_04"); //D�m ti 50 zla��k�.
	AI_Output (other, self, "DIA_Baltram_Trick_15_05"); //Dobr�, to beru.
	AI_Output (self, other, "DIA_Baltram_Trick_01_06"); //Dobr�, jenom �ekni Akilovi, �e t� pos�l�m. D� ti bal�k. P�ines mi ho.
	
	MIS_Baltram_ScoutAkil = LOG_RUNNING;
	B_LogEntry (TOPIC_Nagur,"Baltram m� zam�stnal jako posl��ka. M�m mu p�in�st n�jakou z�silku z Akilova statku.");
	
	Log_CreateTopic (TOPIC_Baltram,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Baltram,LOG_RUNNING);
	B_LogEntry (TOPIC_Baltram, "Kdy� Beltramovi doru��m jeho z�silku, zaplat� mi 50 zla��k�.");
};
///////////////////////////////////////////////////////////////////////
//	Info WAREZ
///////////////////////////////////////////////////////////////////////
var int Baltram_TradeLOG;
// --------------------------------------------------------------
instance DIA_Baltram_WAREZ		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 = 	2;
	condition	 = 	DIA_Baltram_WAREZ_Condition;
	information	 = 	DIA_Baltram_WAREZ_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"Uka� mi sv� zbo��.";
};

func int DIA_Baltram_WAREZ_Condition ()
{
	return TRUE;
};
func void DIA_Baltram_WAREZ_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self,"DIA_Baltram_WAREZ_15_00"); //Uka� mi sv� zbo��.
	
	if (Baltram_TradeLOG == FALSE)
	{
		Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
		B_LogEntry (Topic_CityTrader,"Baltram prod�v� na tr�i�ti potraviny.");
		Baltram_TradeLOG = TRUE;
	};
	
	if (Kapitel == 3)
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_01"); //Nem�li to nechat doj�t tak daleko. Te� jeden ze �old�k� zavra�dil paladina.
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_02"); //N�co by se m�lo st�t!
	};
	if ((MIS_BaltramTrade != LOG_SUCCESS)
	&& ((hero.guild == GIL_SLD)
	||  (hero.guild == GIL_DJG)))
	{
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_03"); //Lid� jako ty ode m� nic nedostanou.
		AI_Output (other, self,"DIA_Baltram_WAREZ_15_04"); //Pro�?
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_05"); //Nejd��v znesv���te farm��e a potom d�l�te, jako by se nic nestalo.
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_06"); //Te� vypadni, odh�n� mi z�kazn�ky.
		
		MIS_BaltramTrade = LOG_FAILED;
		
		AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Skip
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Baltram_Skip		(C_INFO)
{
	npc		 = 	VLK_410_Baltram;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Baltram_Skip_Condition;
	information	 = 	DIA_Addon_Baltram_Skip_Info;

	description	 = 	"Ty obchoduje� s pir�ty?";
};

func int DIA_Addon_Baltram_Skip_Condition ()
{
	if (SCKnowsBaltramAsPirateTrader == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Baltram_Skip_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Baltram_Skip_15_00"); //(bezstarostn�) Tak ty obchoduje� s pir�ty?
	AI_Output	(self, other, "DIA_Addon_Baltram_Skip_01_01"); //(c�t� se zasko�en) Co�e? Kdo to tvrd�?
	AI_Output	(other, self, "DIA_Addon_Baltram_Skip_15_02"); //S jedn�m z nich jsem mluvil. �ekal na tebe v z�toce.
	AI_Output	(self, other, "DIA_Addon_Baltram_Skip_01_03"); //Co m��u d�lat? Doba je t�k� a ka�d� si mus� hled�t hlavn� sv�ho.
	
	Info_ClearChoices	(DIA_Addon_Baltram_Skip);
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "To ses neb�l, �e t� chyt�?", DIA_Addon_Baltram_Skip_erwischen );
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Tohle si po��dn� odsk��e�!", DIA_Addon_Baltram_Skip_MIL );
};
func void DIA_Addon_Baltram_Skip_Back ()
{
	AI_Output (other, self, "DIA_Addon_Baltram_Skip_Back_15_00"); //To je v�ecko, co jsem cht�l v�d�t.
	Info_ClearChoices	(DIA_Addon_Baltram_Skip);
};

func void DIA_Addon_Baltram_Skip_MIL ()
{
	AI_Output (other, self, "DIA_Addon_Baltram_Skip_MIL_15_00"); //Tak tohle si po��dn� odsk��e�!
	AI_Output (self, other, "DIA_Addon_Baltram_Skip_MIL_01_01"); //Hele, poslouchej. Pov�m ti, co v�m, a ty to na m� na opl�tku nepr�skne�, ok?
	
	Info_ClearChoices (DIA_Addon_Baltram_Skip);
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Co prod�v�?", DIA_Addon_Baltram_Skip_was );
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Co v� o pir�tech?", DIA_Addon_Baltram_Skip_pirat );
};

func void DIA_Addon_Baltram_Skip_erwischen ()
{
	AI_Output (other, self, "DIA_Addon_Baltram_Skip_erwischen_15_00"); //Copak se neboj�, �e t� chytnou?
	AI_Output (self, other, "DIA_Addon_Baltram_Skip_erwischen_01_01"); //To by se mohlo st�t. V�dy� tys na to taky p�i�el, �e jo?
	AI_Output (self, other, "DIA_Addon_Baltram_Skip_erwischen_01_02"); //Ale bude� dr�et jazyk za zuby, vi�?
	
	Info_ClearChoices	(DIA_Addon_Baltram_Skip);
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Co m� na prodej?", DIA_Addon_Baltram_Skip_was );
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Co v� o pir�tech?", DIA_Addon_Baltram_Skip_pirat );
};

func void DIA_Addon_Baltram_Skip_was ()
{
	AI_Output			(other, self, "DIA_Addon_Baltram_Skip_was_15_00"); //(odm��en�) Co jim to prod�v�?
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_was_01_01"); //V�t�inou je z�sobuju j�dlem.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_was_01_02"); //A za to mi d�vaj� nejlep�� rum, jak� se d� v Khorinidu sehnat.
	
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "V�c u� v�d�t nepot�ebuju.", DIA_Addon_Baltram_Skip_Back );
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "M��u to pro tebe za��dit.", DIA_Addon_Baltram_Skip_Ich );
};

func void DIA_Addon_Baltram_Skip_Ich ()
{
	AI_Output			(other, self, "DIA_Addon_Baltram_Skip_Ich_15_00"); //(s ��klebkem) Mohl bych to obstarat za tebe.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_Ich_01_01"); //To by bylo skv�l�. V t�hle chv�li se nem��u z Khorinidu hnout.
	CreateInvItems (self, ItMi_Packet_Baltram4Skip_Addon, 1);									
	B_GiveInvItems (self, other, ItMi_Packet_Baltram4Skip_Addon, 1);		
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_Ich_01_02"); //Tak si vem tenhle bal�k a dohl�dni na to, aby Skip tentokr�t s t�m sv�m rumem tolik neskrblil.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_Ich_01_03"); //M�l by ti za to d�t aspo� 3 lahve.
	
	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,"Baltram mi p�edal bal�k, kter� m�m odn�st Skipovi."); 
	
	MIS_Addon_Baltram_Paket4Skip = LOG_RUNNING;
};

func void DIA_Addon_Baltram_Skip_pirat ()
{
	AI_Output			(other, self, "DIA_Addon_Baltram_Skip_pirat_15_00"); //(odm��en�) Co v� o pir�tech?
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_pirat_01_01"); //(rychle) �ij� v odlehl� ��sti ostrova Khorinidu.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_pirat_01_02"); //Pokud v�m, d� se tam dostat jenom lod�.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_pirat_01_03"); //Lidi z Khorinidu se jich boj�, a maj� pravdu. Je to banda p�kn� hnusn�ch hrdlo�ez�.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_pirat_01_04"); //Ale podle m�ho nejsou ani zpoloviny tak zl� jako banditi.
};

///////////////////////////////////////////////////////////////////////
//	Info SkipsRum
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Baltram_SkipsRum		(C_INFO)
{
	npc		 = 	VLK_410_Baltram;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Baltram_SkipsRum_Condition;
	information	 = 	DIA_Addon_Baltram_SkipsRum_Info;

	description	 = 	"Dostal jsem od Skipa rum.";
};

func int DIA_Addon_Baltram_SkipsRum_Condition ()
{
	
	if (Skip_Rum4Baltram == TRUE)
	&& (MIS_Addon_Baltram_Paket4Skip == LOG_RUNNING)
	&& (Npc_HasItems (other,ItFo_Addon_Rum) >= 2)
		{
			return TRUE;
		};
};

func void DIA_Addon_Baltram_SkipsRum_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Baltram_SkipsRum_15_00"); //Nesu ti od Skipa ten rum. Ale dal mi jenom 2 lahve.
	AI_Output	(self, other, "DIA_Addon_Baltram_SkipsRum_01_01"); //(roz�ilen�) Ten lakomec lakom�! Kdo si mysl�, �e je? No, tak je sem dej.
	B_GiveInvItems (other, self, ItFo_Addon_Rum,2); 
	AI_Output	(self, other, "DIA_Addon_Baltram_SkipsRum_01_02"); //Moc ti zat�m d�t nem��u. Tohle ti mus� sta�it.
	CreateInvItems (self, ItMi_Gold, 10);									
	B_GiveInvItems (self, other, ItMi_Gold, 10);		

	TOPIC_END_BaltramSkipTrade = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info AkilsHof
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_AkilsHof		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 =  4;
	condition	 = 	DIA_Baltram_AkilsHof_Condition;
	information	 = 	DIA_Baltram_AkilsHof_Info;
	permanent	 =  FALSE;
	description	 = 	"Kde najdu Akilovu farmu?";
};
func int DIA_Baltram_AkilsHof_Condition ()
{
	if (MIS_Baltram_ScoutAkil == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Baltram_AkilsHof_Info ()
{
	AI_Output (other, self, "DIA_Baltram_AkilsHof_15_00"); //Kde najdu Akilovu farmu?
	AI_Output (self, other, "DIA_Baltram_AkilsHof_01_01"); //Projdi v�chodn� branou a dr� se cesty vedouc� na jihov�chod.
	AI_Output (self, other, "DIA_Baltram_AkilsHof_01_02"); //Po chv�li p�ijde� ke kamenn�mu schodi�ti. Vyjdi nahoru a odtud u� uvid� Akilovu farmu.
};
///////////////////////////////////////////////////////////////////////
//	Info Lieferung geholt
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_Lieferung	(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 =  5;
	condition	 = 	DIA_Baltram_Lieferung_Condition;
	information	 = 	DIA_Baltram_Lieferung_Info;
	permanent 	 =  FALSE;
	description	 = 	"M�m tu z�silku od Akila.";
};

func int DIA_Baltram_Lieferung_Condition ()
{
	if (Npc_HasItems (other, ItMi_BaltramPaket) >=1)
	{
		return TRUE;
	};
};
func void DIA_Baltram_Lieferung_Info ()
{
	AI_Output (other, self, "DIA_Baltram_Lieferung_15_00"); //M�m Akilovu dod�vku.
	AI_Output (self, other, "DIA_Baltram_Lieferung_01_01"); //V�born�. Kone�n� zase m��u nab�zet �erstv� zbo��. Tady m� 50 zlat�ch.
	
	B_GiveInvItems (other, self, ItMi_BaltramPaket,1);
	B_GiveInvItems (self, other, ItMi_Gold,50);
	
	MIS_Baltram_ScoutAkil = LOG_SUCCESS;
	MIS_Nagur_Bote = LOG_FAILED;
	B_GivePlayerXP (XP_Baltram_ScoutAkil);
	
	Npc_RemoveInvItems (self, ItMi_BaltramPaket,1);
	
	CreateInvItems (self,ItFo_Cheese	,  5); 	
	CreateInvItems (self,ItFo_Apple 	, 10); 
	CreateInvItems (self,ItFo_Beer  	,  5);
	CreateInvItems (self,ItFo_Bacon 	,  5);
	CreateInvItems (self,ItFo_Sausage	,  5);
	
};

///////////////////////////////////////////////////////////////////////
//	Info LetUsTrade
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_LetUsTrade		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 =  6;
	condition	 = 	DIA_Baltram_LetUsTrade_Condition;
	information	 = 	DIA_Baltram_LetUsTrade_Info;
	permanent	 =  FALSE;
	description	 = 	"Mohli bychom potom v�em spolu uzav��t obchod?";
};
func int DIA_Baltram_LetUsTrade_Condition ()
{
	if (MIS_BaltramTrade == LOG_FAILED)
	{
		return TRUE;
	};
};

func void DIA_Baltram_LetUsTrade_Info ()
{
	AI_Output (other, self, "DIA_Baltram_LetUsTrade_15_00"); //Mohli bychom po tom v�em spolu uzav��t obchod?
	AI_Output (self, other, "DIA_Baltram_LetUsTrade_01_01"); //Poslouchej, kdy� mi p�inese� 10 �unek a 10 lahv� v�na, potom s tebou budu zase obchodovat.
	AI_Output (other, self, "DIA_Baltram_LetUsTrade_15_02"); //Uvid�m, co se d� d�lat.
	
	MIS_BaltramTrade = LOG_RUNNING;
};

var int BaltramEnoughBacon;
var int BaltramEnoughWine;

///////////////////////////////////////////////////////////////////////
//	Info HaveYourWarez
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_HaveYourWarez		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 =  6;
	condition	 = 	DIA_Baltram_HaveYourWarez_Condition;
	information	 = 	DIA_Baltram_HaveYourWarez_Info;
	permanent	 =  TRUE;
	description	 = 	"M�m tv� zbo��.";
};
func int DIA_Baltram_HaveYourWarez_Condition ()
{
	if (MIS_BaltramTrade == LOG_RUNNING)
	&& (MIS_BaltramTrade != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Baltram_HaveYourWarez_Info ()
{
	AI_Output (other, self, "DIA_Baltram_HaveYourWarez_15_00"); //M�m tv� zbo��.
	AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_01"); //Uka� mi to.
	
	if (Npc_HasItems (other,ItFo_Bacon) < 10)
	{
		AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_02"); //Dohodli jsme se snad na 10 �unk�ch. P�ij�, a� jich bude� m�t dost.
		
		BaltramEnoughBacon = FALSE;
	}
	else
	{
		BaltramEnoughBacon = TRUE;
	};  
	if (Npc_HasItems (other,ItFo_Wine) < 10)
	{
		AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_03"); //A co 10 lahv� v�na? Na ty jsi zapomn�l?
	
		BaltramEnoughWine = FALSE;
	}
	else
	{
		BaltramEnoughWine = TRUE;
	};
	
	if (BaltramEnoughBacon == TRUE
	&&  BaltramEnoughWine  == TRUE)
	{
		AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_04"); //Hmm, nen� to sice nejlep�� kvalita, ale v t�chto dob�ch nem��e� b�t moc vyb�rav�.
		
		B_GiveInvItems (other,self,ItFo_Bacon,10);
		B_GiveInvItems (other,self,ItFo_Wine,10);
		
		MIS_BaltramTrade = LOG_SUCCESS;
	
		B_GivePlayerXP (XP_BaltramTrade);
		
		AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_05"); //Te� n�m nic nebr�n� v uzav�en� obchodu.
	};	
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Baltram_PICKPOCKET (C_INFO)
{
	npc			= VLK_410_Baltram;
	nr			= 900;
	condition	= DIA_Baltram_PICKPOCKET_Condition;
	information	= DIA_Baltram_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Baltram_PICKPOCKET_Condition()
{
	C_Beklauen (76, 175);
};
 
FUNC VOID DIA_Baltram_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Baltram_PICKPOCKET);
	Info_AddChoice		(DIA_Baltram_PICKPOCKET, DIALOG_BACK 		,DIA_Baltram_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Baltram_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Baltram_PICKPOCKET_DoIt);
};

func void DIA_Baltram_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Baltram_PICKPOCKET);
};
	
func void DIA_Baltram_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Baltram_PICKPOCKET);
};



















