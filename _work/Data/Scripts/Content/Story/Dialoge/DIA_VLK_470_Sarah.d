///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Sarah_EXIT   (C_INFO)
{
	npc         = VLK_470_Sarah;
	nr          = 999;
	condition   = DIA_Sarah_EXIT_Condition;
	information = DIA_Sarah_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Sarah_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Sarah_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 // ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Sarah_PICKPOCKET (C_INFO)
{
	npc			= VLK_470_Sarah;
	nr			= 900;
	condition	= DIA_Sarah_PICKPOCKET_Condition;
	information	= DIA_Sarah_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Sarah_PICKPOCKET_Condition()
{
	C_Beklauen (57, 60);
};
 
FUNC VOID DIA_Sarah_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Sarah_PICKPOCKET);
	Info_AddChoice		(DIA_Sarah_PICKPOCKET, DIALOG_BACK 		,DIA_Sarah_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Sarah_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Sarah_PICKPOCKET_DoIt);
};

func void DIA_Sarah_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Sarah_PICKPOCKET);
};
	
func void DIA_Sarah_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Sarah_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info Greet
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_Greet		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr 			 =  1;
	condition	 = 	DIA_Sarah_Greet_Condition;
	information	 = 	DIA_Sarah_Greet_Info;
	permanent 	 =  TRUE;
	important	 =  TRUE;
};

func int DIA_Sarah_Greet_Condition ()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Canthar_Ausgeliefert == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Sarah_Greet_Info ()
{
	AI_Output (self, other, "DIA_Sarah_Add_16_07"); //�! To jsi zase ty!
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_HALLO		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	condition	 = 	DIA_Sarah_HALLO_Condition;
	information	 = 	DIA_Sarah_HALLO_Info;
	permanent 	 =  FALSE;
	description	 = 	"Jak jdou obchody?";
};

func int DIA_Sarah_HALLO_Condition ()
{
	return TRUE;
};
func void DIA_Sarah_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Sarah_HALLO_15_00"); //Jak jdou obchody?
	AI_Output (self, other, "DIA_Sarah_HALLO_16_01"); //Kdy� dorazili paladinov�, nejd��v jsem si myslela, �e to je p��le�itost k dobr�m obchod�m.
	AI_Output (self, other, "DIA_Sarah_HALLO_16_02"); //Ale pak nechali Harada, aby jim vyr�b�l zbran�, a ani Hakon ani j� jsme od nich nevid�li ani zlatku.
	AI_Output (self, other, "DIA_Sarah_HALLO_16_03"); //Nav�c farm��i u� d�l necht�j� z�sobovat m�sto potravinami, a v�echny ceny tak jdou nahoru.
	AI_Output (self, other, "DIA_Sarah_Add_16_00"); //�e mi paladinov� plat� hotel, je jen slab� �t�cha.

	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Sarah prod�v� na tr�i�ti zbran�.");	
};
///////////////////////////////////////////////////////////////////////
//	Info Bauern
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_Bauern		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr 			 =  2;
	condition	 = 	DIA_Sarah_Bauern_Condition;
	information	 = 	DIA_Sarah_Bauern_Info;
	permanent	 =  FALSE;
	description	 = 	"Co je s farm��i za probl�my?";
};

func int DIA_Sarah_Bauern_Condition ()
{
	if Npc_KnowsInfo (other, DIA_Sarah_HALLO)
	{
			return TRUE;
	};
};
func void DIA_Sarah_Bauern_Info ()
{
	AI_Output (other, self, "DIA_Sarah_Bauern_15_00"); //Co je s farm��i za probl�my?
	AI_Output (self, other, "DIA_Sarah_Bauern_16_01"); //Odm�taj� dov�et sv� zbo��.
	AI_Output (self, other, "DIA_Sarah_Bauern_16_02"); //Te�, kdy� u� sem nep�iplouvaj� ��dn� lod�, je m�sto samoz�ejm� z�visl� jen na tom, co poskytnou farm��i.
	AI_Output (self, other, "DIA_Sarah_Bauern_16_03"); //A Onar, ten nejv�t�� z farm���, si najal �oldn��e, aby chr�nili jeho farmu p�ed m�stskou str��. Jinak by si domobrana v�echno zabrala pro sebe.
	AI_Output (self, other, "DIA_Sarah_Add_16_01"); //Ale ti �old�ci nechr�n� jenom Onarovu farmu.
	AI_Output (self, other, "DIA_Sarah_Add_16_02"); //Za�li tak daleko, �e zastra�uj� i mal� farm��e tady u m�sta.
	AI_Output (self, other, "DIA_Sarah_Add_16_03"); //Vid�la jsem je, kdy� jsem proch�zela p�es Akilovu farmu. Necht�la bych te� b�t v jeho k��i.
};

///////////////////////////////////////////////////////////////////////
//	Info AkilsHof
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_AkilsHof		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr 			 =  3;
	condition	 = 	DIA_Sarah_AkilsHof_Condition;
	information	 = 	DIA_Sarah_AkilsHof_Info;
	permanent	 =  FALSE;
	description	 = 	"Kde najdu Akilovu farmu?";
};

func int DIA_Sarah_AkilsHof_Condition ()
{
	if Npc_KnowsInfo (other, DIA_Sarah_Bauern)
	{
		return TRUE;
	};
};
func void DIA_Sarah_AkilsHof_Info ()
{
	AI_Output (other, self, "DIA_Sarah_AkilsHof_15_00"); //Kde najdu Akilovu farmu?
	AI_Output (self, other, "DIA_Sarah_Add_16_04"); //Pokud odejde� v�chodn� br�nou a d� se cestou napravo, dostane� se ke schodi�ti.
	AI_Output (self, other, "DIA_Sarah_Add_16_05"); //To vede nahoru k Akilov� farm�.
	AI_Output (self, other, "DIA_Sarah_Add_16_06"); //Ale j� bych tam te� nechodila - ur�it� tam je�t� po��d jsou �old�ci.
};


///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_Trade		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr			 =  99;
	condition	 = 	DIA_Sarah_Trade_Condition;
	information	 = 	DIA_Sarah_Trade_Info;
	Trade		 = 	TRUE;
	permanent	 =	TRUE;
	description	 = 	"Uka� mi sv� zbo��.";
};

func int DIA_Sarah_Trade_Condition ()
{
	if 	((Npc_KnowsInfo(other, DIA_Sarah_HALLO))
	&& (MIS_Canthars_KomproBrief != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Sarah_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Sarah_Trade_15_00"); //Uka� mi sv� zbo��.
	
	Sarah_WaffenGesehen = TRUE;
	
};
///////////////////////////////////////////////////////////////////////
//	Info ImKnast
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_IMKNAST		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr			 =  99;
	condition	 = 	DIA_Sarah_IMKNAST_Condition;
	information	 = 	DIA_Sarah_IMKNAST_Info;
	permanent	 = 	TRUE;
	important 	 =  TRUE;
};

func int DIA_Sarah_IMKNAST_Condition ()
{
	if (MIS_Canthars_KomproBrief == LOG_SUCCESS)	
	&&  Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Sarah_IMKNAST_Info ()
{
	AI_Output (self, other, "DIA_Sarah_IMKNAST_16_00"); //Ty! Ty m� tu drzost tady je�t� uk�zat sv�j ksicht! Nem��u to dok�zat, ale vsad�m se, �e jsi namo�enej do p�kn� �pinav� hry.
	AI_Output (self, other, "DIA_Sarah_IMKNAST_16_01"); //Je to tvoje chyba, �e jsem tady. Tvoje a toho zatracen�ho Canthara - a� v�s Innos ztrest�!
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_Success		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr			 =  4;
	condition	 = 	DIA_Sarah_Success_Condition;
	information	 = 	DIA_Sarah_Success_Info;
	permanent 	 =  FALSE;
	description	 = 	"Canthar se t� sna�il obelst�t...";
};

func int DIA_Sarah_Success_Condition ()
{	
	if (Canthar_Ausgeliefert == TRUE)
	//|| (MIS_Canthars_KomproBrief == LOG_OBSOLETE)
	{
		return TRUE;
	};
};
func void DIA_Sarah_Success_Info ()
{
	AI_Output (other, self, "DIA_Sarah_Success_15_00"); //Canthar se t� pokusil podv�st a z�skat tv�j st�nek pro sebe. Ale j� jsem ho p�edhodil m�stsk�m str��m.
	AI_Output (self, other, "DIA_Sarah_Success_16_01"); //Tak to sis znep��telil nebezpe�n�ho mu�e. Zn�m toho bastarda u� p�kn� dlouho a v�dycky cht�l m�j st�nek pro sebe.
	AI_Output (self, other, "DIA_Sarah_Success_16_02"); //Vezmi si tuhle zbra� jako vyj�d�en� m� vd��nosti.
	
	B_GivePlayerXP (XP_CantharImKnast);
	B_GiveInvItems (self, other, ItMw_Piratensaebel,1);
	
};
	
	  
	  
	   





