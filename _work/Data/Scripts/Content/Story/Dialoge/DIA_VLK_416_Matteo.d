// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Matteo_EXIT(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 999;
	condition	= DIA_Matteo_EXIT_Condition;
	information	= DIA_MAtteo_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Matteo_EXIT_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Matteo_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Matteo_PICKPOCKET (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 900;
	condition	= DIA_Matteo_PICKPOCKET_Condition;
	information	= DIA_Matteo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Matteo_PICKPOCKET_Condition()
{
	C_Beklauen (80, 150);
};
 
FUNC VOID DIA_Matteo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Matteo_PICKPOCKET);
	Info_AddChoice		(DIA_Matteo_PICKPOCKET, DIALOG_BACK 		,DIA_Matteo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Matteo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Matteo_PICKPOCKET_DoIt);
};

func void DIA_Matteo_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Matteo_PICKPOCKET);
};
	
func void DIA_Matteo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Matteo_PICKPOCKET);
};
// ************************************************************
// 			  				   Hallo 
// ************************************************************
INSTANCE DIA_Matteo_Hallo(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 1;
	condition	= DIA_Matteo_Hallo_Condition;
	information	= DIA_MAtteo_Hallo_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Matteo_Hallo_Condition()
{	
	if (Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_Hallo_Info()
{	
	AI_Output (self, other, "DIA_Matteo_Hallo_09_00"); //Co pro tebe mohu ud�lat?
};

// ************************************************************
// 			  				   Sell What 
// ************************************************************
INSTANCE DIA_Matteo_SellWhat(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 1;
	condition	= DIA_Matteo_SellWhat_Condition;
	information	= DIA_MAtteo_SellWhat_Info;
	permanent	= FALSE;
	description = "Co prod�v�?";
};                       
FUNC INT DIA_Matteo_SellWhat_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Matteo_SellWhat_Info()
{	
	AI_Output (other, self, "DIA_Matteo_SellWhat_15_00"); //Co prod�v�?
	AI_Output (self, other, "DIA_Matteo_SellWhat_09_01"); //Mohu ti nab�dnout v�echno, co pot�ebuje� pro p�e�it� v divo�in�. Zbran�, pochodn�, z�soby - dokonce i zbroj.
	AI_Output (self, other, "DIA_Matteo_SellWhat_09_02"); //Tak� tu m�m i n�jak� zvl�tn� zbo��.
	AI_Output (self, other, "DIA_Matteo_SellWhat_09_03"); //Dvojn�sob tvrzenou zbroj z ch�apav�� k��e - nepou�itou. Nem� z�jem?
	
	if (Knows_Matteo == FALSE)
	{
		Log_CreateTopic (TOPIC_CityTrader, LOG_NOTE);
		B_LogEntry (TOPIC_CityTrader,"Matte�v obchod le�� u ji�n� m�stsk� br�ny. Nakoup�m tam vybaven�, zbran� i potraviny.");
		Knows_Matteo = TRUE;
	};
};

// *********************************************************
// 		  					TRADE 				
// *********************************************************
INSTANCE DIA_Matteo_TRADE (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 800;
	condition	= DIA_Matteo_TRADE_Condition;
	information	= DIA_Matteo_TRADE_Info;
	permanent	= TRUE;
	description = "Uka� mi sv� zbo��.";
	Trade		= TRUE;
};                       
FUNC INT DIA_Matteo_TRADE_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Matteo_SellWhat))
	{
		return TRUE;
	};	
};

var int Matteo_TradeNewsPermanent;

FUNC VOID DIA_Matteo_TRADE_Info()
{	
	B_GiveTradeInv (self);
	AI_Output (other,self ,"DIA_Matteo_TRADE_15_00"); //Uka� mi sv� zbo��.
	if (Kapitel == 3)
	&& (MIS_RescueBennet != LOG_SUCCESS)
	&& (Matteo_TradeNewsPermanent == FALSE)
	{
		AI_Output (self,other,"DIA_Matteo_TRADE_09_01"); //Od t� doby, co �old�ci odd�lali paladina Lothara, to tu ti jeho kamar�d��kov� pro��our�vaj� mnohem p��sn�ji.
		AI_Output (self,other,"DIA_Matteo_TRADE_09_02"); //Douf�m, �e a� vraha pov�s�, tak se to zlep��.
	
		Matteo_TradeNewsPermanent = 1;
	};
	if (Kapitel == 5)
	&& (Matteo_TradeNewsPermanent < 2)
	{
		AI_Output (self,other,"DIA_Matteo_TRADE_09_03"); //Vypad� to, �e paladinov� to tentokr�t mysl� v�n� - dokonce odvolali i str�e z lod�.
		AI_Output (self,other,"DIA_Matteo_TRADE_09_04"); //Je�t� �e n�m zase obnovuje� z�soby. Kdo v�, jestli p��t� t�den bude na�e m�sto je�t� st�t.
	
		Matteo_TradeNewsPermanent = 2;
	};
};

// *********************************************************
// 		  					ARMOR 				
// *********************************************************

//-------------------------------------
	var int Matteo_LeatherBought;
//-------------------------------------

instance DIA_Matteo_LEATHER		(C_INFO)
{
	npc			 = 	VLK_416_Matteo;
	nr			 =  850;
	condition	 = 	DIA_Matteo_LEATHER_Condition;
	information	 = 	DIA_Matteo_LEATHER_Info;
	permanent	 = 	TRUE;
	description	 = 	"Koupit ko�enou zbroj. Ochrana: zbran� 25, ��py 20. (250 zla��k�)";
};

func int DIA_Matteo_LEATHER_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_SellWhat))
	&& (Matteo_LeatherBought == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Matteo_LEATHER_Info ()
{
	AI_Output (other, self, "DIA_Matteo_LEATHER_15_00"); //Dob�e, tak mi tu zbroj dej.
	
	if B_GiveInvItems (other, self, ItMi_Gold, 250)
	{	
		AI_Output (self, other, "DIA_Matteo_LEATHER_09_01"); //Bude se ti moc l�bit. (u�kl�bne se)

		B_GiveInvItems 	(self, other, ItAr_Leather_L, 1);
		Matteo_LeatherBought = TRUE;
	}
	else 
	{
		AI_Output (self, other, "DIA_Matteo_LEATHER_09_02"); //Zbroj m� svou cenu - a opravdu za to stoj�. Tak�e se vra�, a� d� dohromady dost zlata.
	};
};

// ************************************************************
// 			  				Paladine 			E1
// ************************************************************
INSTANCE DIA_Matteo_Paladine(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 2;
	condition	= DIA_Matteo_Paladine_Condition;
	information	= DIA_MAtteo_Paladine_Info;
	permanent	= FALSE;
	description = "Co v� o paladinech?";
};                       
FUNC INT DIA_Matteo_Paladine_Condition()
{	
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Matteo_Paladine_Info()
{	
	AI_Output (other, self, "DIA_Matteo_Paladine_15_00"); //Co v� o paladinech?
	AI_Output (self, other, "DIA_Matteo_Paladine_09_01"); //Od chv�le, kdy ti bastardi dorazili do m�sta, nezn�m nic jin�ho ne� sam� trampoty.
	AI_Output (self, other, "DIA_Matteo_Paladine_09_02"); //Posledn� jsem zam��il do horn� ��sti m�sta, ale str�e mi zastoupily cestu a cht�ly v�d�t, co tam pohled�v�m!
	AI_Output (other, self, "DIA_Matteo_Paladine_15_03"); //A?
	AI_Output (self, other, "DIA_Matteo_Paladine_09_04"); //Samoz�ejm� m� pak pustily dovnit�!
	AI_Output (self, other, "DIA_Matteo_Paladine_09_05"); //M�j obchod ve m�st� st�l je�t� d��v, ne� se ti nabub�el� hejhulov� nau�ili zapichovali podsvin�ata d�ev�n�m me�em!
	AI_Output (self, other, "DIA_Matteo_Paladine_09_06"); //A v�era sem ti bastardi jen tak m�rnyx-t�rnyx p�i�li a zabavili mi p�lku zbo��!
};

// ************************************************************
// 			  				Confiscated 			E2
// ************************************************************
INSTANCE DIA_Matteo_Confiscated(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 2;
	condition	= DIA_Matteo_Confiscated_Condition;
	information	= DIA_MAtteo_Confiscated_Info;
	permanent	= FALSE;
	description = "Paladinov� ti zabavili zbo��?";
};                       
FUNC INT DIA_Matteo_Confiscated_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_Paladine))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_Confiscated_Info()
{	

	AI_Output (other, self, "DIA_Matteo_Confiscated_15_00"); //Paladinov� ti zabavili zbo��?
	AI_Output (self, other, "DIA_Matteo_Confiscated_09_01"); //V�ecko, co jsem m�l uskladn�n� vzadu na dvorku.
	AI_Output (self, other, "DIA_Matteo_Confiscated_09_02"); //Prost� ke vchodu na dv�r postavili str�.
	AI_Output (self, other, "DIA_Matteo_Confiscated_09_03"); //M�m kliku, �e mi nesebrali �pln� v�ecko - aspo� tu zbroj tu mohli nechat.
};

// ************************************************************
// 			  				HelpMeToOV 			E2
// ************************************************************
INSTANCE DIA_Matteo_HelpMeToOV(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_HelpMeToOV_Condition;
	information	= DIA_MAtteo_HelpMeToOV_Info;
	permanent	= FALSE;
	description = "M��e� mi pomoci proniknout do horn� �tvrti?";
};                       
FUNC INT DIA_Matteo_HelpMeToOV_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_Paladine))
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_HelpMeToOV_Info()
{	
	AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_00"); //M��e� mi pomoci proniknout do horn� �tvrti?
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_01"); //(udiven�) Co�e? A co TAM chce� d�lat?
	AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_02"); //Nesu n�jakou d�le�itou zpr�vu.
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_03"); //No, v�... U� ses zkou�el dostat p�es str�e?

	if (Torwache_305.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_04"); //(ho�k� �sm�v) Zapome� na to, chlape!
		AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_05"); //(usm�je se) To je pro ty man�ky TYPICK�!
	}
	else
	{
		AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_06"); //Nech�pu, pro� bych to m�l v�bec zkou�et.
		AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_07"); //Nejsp� m� pravdu.
	};
	
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_08"); //Nev�m, JAK d�le�it� ta tvoje zpr�va je, a vlastn� mi do toho ani nic nen�.
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_09"); //Ale i kdy� jim �ekne�, �e v p��stavu pr�v� zakotvila lo� pln� sk�et�, stejn� t� po�lou pry�.
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_10"); //Proto�e maj� sv� ROZKAZY.
};

// ************************************************************
// 			  				HelpMeNow 			E3
// ************************************************************

func void B_Matteo_Preis()
{
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_01"); //Zd� se, �e ti na tom opravdu z�le��.
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_02"); //(potuteln�) Ot�zka zn�, JAK MOC ti na tom z�le��.
	AI_Output (other, self, "DIA_Matteo_HelpMeNow_15_03"); //O co ti jde?
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_04"); //Mohu ti pomoci - koneckonc� tu pat��m k nejvlivn�j��m lidem.
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_05"); //Ale nebude to zadarmo.
};


INSTANCE DIA_Matteo_HelpMeNow(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_HelpMeNow_Condition;
	information	= DIA_MAtteo_HelpMeNow_Info;
	permanent	= FALSE;
	description = "Tak�e mi m��e� pomoci proniknout do horn� �tvrti?";
};                       
FUNC INT DIA_Matteo_HelpMeNow_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HelpMeToOV))
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_HelpMeNow_Info()
{	
	AI_Output (other, self, "DIA_Matteo_HelpMeNow_15_00"); //Tak�e mi m��e� pomoci proniknout do horn� �tvrti?
	B_Matteo_Preis();
};

// ************************************************************
// 			  		LEHRLING als GILDE X
// ************************************************************
INSTANCE DIA_Matteo_LehrlingLater(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_LehrlingLater_Condition;
	information	= DIA_MAtteo_LehrlingLater_Info;
	permanent	= FALSE;
	description = "Pomoz mi st�t se u�edn�kem u n�kter�ho z ostatn�ch mistr�.";
};                       
FUNC INT DIA_Matteo_LehrlingLater_Condition()
{	
	if (Player_IsApprentice == APP_NONE)
	&& (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};
func VOID DIA_Matteo_LehrlingLater_Info()
{	
	AI_Output (other, self, "DIA_Matteo_LehrlingLater_15_00"); //Tak�e mi m��e� pomoci proniknout do horn� �tvrti?
	B_Matteo_Preis();
};
	
// ************************************************************
// 			  		PriceOfHelp  (MISSION)			E4
// ************************************************************
INSTANCE DIA_Matteo_PriceOfHelp(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_PriceOfHelp_Condition;
	information	= DIA_MAtteo_PriceOfHelp_Info;
	permanent	= FALSE;
	description = "Co za svou pomoc chce�?";
};                       
FUNC INT DIA_Matteo_PriceOfHelp_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HelpMeNow))
	|| (Npc_KnowsInfo (other,DIA_Matteo_LehrlingLater))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_PriceOfHelp_Info()
{	
	AI_Output (other, self, "DIA_Matteo_PriceOfHelp_15_00"); //Co za svou pomoc chce�?
	AI_Output (self, other, "DIA_Matteo_PriceOfHelp_09_01"); //100 zlat�ch.
	
	Info_ClearChoices 	(DIA_Matteo_PriceOfHelp);
	Info_AddChoice 		(DIA_Matteo_PriceOfHelp, "To je zatracen� hodn�...", DIA_Matteo_PriceOfHelp_Wow);
	Info_AddChoice 		(DIA_Matteo_PriceOfHelp, "Ty chamtiv�e!", DIA_Matteo_PriceOfHelp_Cutthroat);
};

func void B_Matteo_RegDichAb()
{
	AI_Output (self, other, "B_Matteo_RegDichAb_09_00"); //Kl�dek - nemysl�m zrovna TVOJE zlato!
	AI_Output (other, self, "B_Matteo_RegDichAb_15_01"); //Ale?
	AI_Output (self, other, "B_Matteo_RegDichAb_09_02"); //V z�sad� jde o MOJE zlato.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_03"); //Tesa�ova nete� Gritta mi toti� u� cel� v�ky nezaplatila, co mi dlu��.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_04"); //A p�itom se tu ten mal� spratek produc�ruje ka�dou chv�li v nov�ch hadrech - to znamen�, �e pen�z m� dost.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_05"); //R�d bych to z n� vyml�til, ale mistr Thorben - tesa� - tu m� taky dost velk� vliv.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_06"); //Kdy� mi d� ty pen�ze, pom��u ti.
	
	MIS_Matteo_Gold = LOG_RUNNING;
	Log_CreateTopic (Topic_Matteo,LOG_MISSION);
	Log_SetTopicStatus	(Topic_Matteo,LOG_RUNNING);
	B_LogEntry (Topic_Matteo,"Gritta, nete� tesa�e Thorbena, dlu�� Matteovi 100 zla��k�. Kdy� mu je vr�t�m, pom��e mi proniknout do horn� �tvrti.");
};

func void DIA_Matteo_PriceOfHelp_Cutthroat()
{
	AI_Output (other, self, "DIA_Matteo_PriceOfHelp_Cutthroat_15_00"); //Ty chamtiv�e!
	B_Matteo_RegDichAb();
	Info_ClearChoices 	(DIA_Matteo_PriceOfHelp);
};

func void DIA_Matteo_PriceOfHelp_Wow()
{
	AI_Output (other, self, "DIA_Matteo_PriceOfHelp_Wow_15_00"); //To je zatracen� hodn�...
	B_Matteo_RegDichAb();
	Info_ClearChoices 	(DIA_Matteo_PriceOfHelp);
};

// ************************************************************
// 			  				WoGritta 			E5
// ************************************************************
INSTANCE DIA_Matteo_WoGritta(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 2;
	condition	= DIA_Matteo_WoGritta_Condition;
	information	= DIA_MAtteo_WoGritta_Info;
	permanent	= FALSE;
	description = "Kde bych tu Grittu na�el?";
};                       
FUNC INT DIA_Matteo_WoGritta_Condition()
{	
	if (MIS_Matteo_Gold == LOG_RUNNING)
	&& (Gritta.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_WoGritta_Info()
{	
	AI_Output (other, self, "DIA_Matteo_WoGritta_15_00"); //Kde bych tu Grittu na�el?
	AI_Output (self, other, "DIA_Matteo_WoGritta_09_01"); //Jak jsem �ekl, je to tesa�ova nete�. Jeho d�m najde� dole v ulici, posledn� staven� napravo p�ed kov�rnou.
};

// ************************************************************
// 			  				GoldRunning 			E5
// ************************************************************
INSTANCE DIA_Matteo_GoldRunning(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 500;
	condition	= DIA_Matteo_GoldRunning_Condition;
	information	= DIA_MAtteo_GoldRunning_Info;
	permanent	= TRUE;
	description = "Tady m� t�ch 100 zla��k�!";
};                       
FUNC INT DIA_Matteo_GoldRunning_Condition()
{	
	if (MIS_Matteo_Gold == LOG_RUNNING)
	&& ( Npc_KnowsInfo(other,DIA_Gritta_WantsMoney) || Npc_IsDead(Gritta) )
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_GoldRunning_Info()
{	
	AI_Output (other, self, "DIA_Matteo_GoldRunning_15_00"); //Tady m� t�ch 100 zla��k�!
	
	//EXIT IF...
	
	if (Npc_IsDead(Gritta))
	{
		AI_Output (self, other, "DIA_Matteo_GoldRunning_09_01"); //Na tom zlat� je Grittina krev! J� ti p�ece ani v nejmen��m nenak�zal, abys ji zabil!
		AI_Output (self, other, "DIA_Matteo_GoldRunning_09_02"); //S t�m nechci nic m�t - a na na�i �mluvu rovnou zapome�! A u� na m� v�ckr�t nemluv!
		MIS_Matteo_Gold = LOG_FAILED;
		B_CheckLog();
		AI_StopProcessInfos	(self);
		return;
	};
	
	// FUNC

	if (B_GiveInvItems (other, self, itmi_gold, 100))
	{
		if (Npc_HasItems(Gritta, itmi_gold) < 100)
		{
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_03"); //Tak co? D�lala n�jak� probl�my?
			AI_Output (other, self, "DIA_Matteo_GoldRunning_15_04"); //Nic, co by st�lo za zm�nku.
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_05"); //Dob�e. Svou ��st �mluvy jsi tedy dodr�el.
		}
		else
		{
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_06"); //Ty to za ni chce� zaplatit? Hmm, dal bych sp� p�ednost tomu, kdybys to vym��kl p��mo z n�!
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_07"); //Ale - 100 zla��k� je po��d 100 zla��k�.
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_08"); //Svou ��st �mluvy jsi t�m dodr�el.
		};
		
		MIS_Matteo_Gold = LOG_SUCCESS;
		B_GivePlayerXP (XP_Matteo_Gold);
	}
	else
	{
		AI_Output (self, other, "DIA_Matteo_GoldRunning_09_09"); //Po��t�n� nen� zrovna tvoje siln� str�nka, co? V�dy� ty t�ch 100 zla��k� nem�.
	};
};

// ************************************************************
// 		  				Stimme abgeben		E5 - PERM
// ************************************************************

instance DIA_Matteo_Zustimmung(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 4;
	condition	= DIA_Matteo_Zustimmung_Condition;
	information	= DIA_MAtteo_Zustimmung_Info;
	permanent	= TRUE;
	description = "Pomoz mi st�t se u�edn�kem u n�kter�ho z ostatn�ch mistr�.";
};          
var int   DIA_Matteo_Zustimmung_perm;          
FUNC INT DIA_Matteo_Zustimmung_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HowCanYouHelp))
	&& ( (MIS_Matteo_Gold == LOG_RUNNING) || (MIS_Matteo_Gold == LOG_SUCCESS) )
	&& (Player_IsApprentice == APP_NONE)
	&& (DIA_Matteo_Zustimmung_perm == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_Zustimmung_Info()
{	
	AI_Output (other, self, "DIA_Matteo_Zustimmung_15_00"); //Pomoz mi vstoupit do u�en� k n�kter�mu z ostatn�ch mistr�!
	
	if (MIS_Matteo_Gold == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Matteo_Zustimmung_09_01"); //��dn� strachy - j� svou ��st dohody dodr��m.
		AI_Output (self, other, "DIA_Matteo_Zustimmung_09_02"); //Ostatn�m mistr�m budu o tob� vykl�dat jenom to nejlep��.
		
		B_GivePlayerXP (XP_Zustimmung);
		B_LogEntry (Topic_Lehrling,"Matteo bude souhlasit, budu-li cht�t vstoupit do u�en� u n�koho jin�ho.");
		DIA_Matteo_Zustimmung_perm = TRUE;
	}
	else //LOG_RUNNING
	{
		AI_Output (self, other, "DIA_Matteo_Zustimmung_09_03"); //Jedno po druh�m. Nejd��v spl� svou ��st dohody a p�ines mi zlato!
	};
};

// ************************************************************
// 			  				HowCanYouHelp 			E4
// ************************************************************
INSTANCE DIA_Matteo_HowCanYouHelp (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 4;
	condition	= DIA_Matteo_HowCanYouHelp_Condition;
	information	= DIA_MAtteo_HowCanYouHelp_Info;
	permanent	= FALSE;
	description = "Co KONKR�TN� pro mne m��e� ud�lat?";
};                       
FUNC INT DIA_Matteo_HowCanYouHelp_Condition()
{	
	if ((Npc_KnowsInfo (other,DIA_Matteo_HelpMeNow))
	|| (Npc_KnowsInfo (other,DIA_Matteo_LehrlingLater)))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_HowCanYouHelp_Info()
{	
	AI_Output (other, self, "DIA_Matteo_HowCanYouHelp_15_00"); //Co KONKR�TN� pro mne m��e� ud�lat?
	AI_Output (self, other, "DIA_Matteo_HowCanYouHelp_09_01"); //To je jednoduch�. Vyu�iju sv�j vliv a p�esv�d��m jednoho z m�stn�ch �emesln�k�, aby t� p�ijal jako u�edn�ka.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Matteo_HowCanYouHelp_09_02"); //Tak se prakticky stane� m��anem a bude� moci vstoupit i do horn� �tvrti. A krom toho si i trochu p�ivyd�l�.
	};
	
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (TOPIC_Lehrling,"Matteo mi m��e pomoci, aby m� n�kter� z �emeslnick�ch mistr� p�ijal do u�en�.");
};	

// ************************************************************
// 			  				WoAlsLehrling 			E5
// ************************************************************
INSTANCE DIA_Matteo_WoAlsLehrling (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 4;
	condition	= DIA_Matteo_WoAlsLehrling_Condition;
	information	= DIA_MAtteo_WoAlsLehrling_Info;
	permanent	= FALSE;
	description = "Kde bych tedy mohl vstoupit do u�en�?";
};                       
FUNC INT DIA_Matteo_WoAlsLehrling_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HowCanYouHelp))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_WoAlsLehrling_Info()
{	
	AI_Output (other, self, "DIA_Matteo_WoAlsLehrling_15_00"); //Kde bych tedy mohl vstoupit do u�en�?
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_01"); //Vlastn� ke komukoliv z mistr� tady na hlavn� ulici.
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_02"); //M��e to b�t kov�� Harad, v�robce luk� Bosper, tesa� Thorben nebo alchymista Constantino.
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_03"); //Jeden z nich t� mus� p�ijmout.
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_04"); //Ale d�le�it� je, aby s t�m souhlasili i ostatn� mist�i. Tak je to tady v Khorinidu zvykem.
	
	Log_CreateTopic (Topic_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (Topic_Lehrling,LOG_RUNNING);
	B_LogEntry (Topic_Lehrling,"Mohu vstoupit do u�en� k v�robci luk� Bosperovi, kov��i Haradovi, tesa�i Thorbenovi nebo k alchymistovi Constantinovi.");
	B_LogEntry (Topic_Lehrling,"Je�t� ne� k n�komu vstoup�m do u�en�, mus�m z�skat svolen� ostatn�ch mistr�.");
};
// ************************************************************
// 			  				WieZustimmung 			E6
// ************************************************************
INSTANCE DIA_Matteo_WieZustimmung (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 5;
	condition	= DIA_Matteo_WieZustimmung_Condition;
	information	= DIA_MAtteo_WieZustimmung_Info;
	permanent	= FALSE;
	description = "Jak z�sk�m souhlas ostatn�ch mistr�?";
};                       
FUNC INT DIA_Matteo_WieZustimmung_Condition()
{	
	if ( Npc_KnowsInfo (other,DIA_Matteo_WoAlsLehrling) || Npc_KnowsInfo (other,DIA_Matteo_WarumNichtBeiDir) )
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_WieZustimmung_Info()
{	
	AI_Output (other, self, "DIA_Matteo_WieZustimmung_15_00"); //Jak z�sk�m souhlas ostatn�ch mistr�?
	AI_Output (self, other, "DIA_Matteo_WieZustimmung_09_01"); //Prost� je mus� n�jak p�esv�d�it. Zastav se u nich a promluv si s nimi.
	AI_Output (self, other, "DIA_Matteo_WieZustimmung_09_02"); //Ale jestli si proti sob� popud� v�c jak jednoho, nebude� m�t �anci! Tak se koukej chovat slu�n�!
	
	B_LogEntry (Topic_Lehrling,"Ostatn� mist�i mi daj� sv� doporu�en� pouze za p�edpokladu, �e jim dok�u svou cenu.");
};	

// ************************************************************
// 			  				WarumNichtBeiDir 			E5
// ************************************************************
INSTANCE DIA_Matteo_WarumNichtBeiDir (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 6;
	condition	= DIA_Matteo_WarumNichtBeiDir_Condition;
	information	= DIA_MAtteo_WarumNichtBeiDir_Info;
	permanent	= FALSE;
	description = "A pro� m� do u�en� nep�ijme� TY?";
};                       
FUNC INT DIA_Matteo_WarumNichtBeiDir_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HowCanYouHelp))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_WarumNichtBeiDir_Info()
{	
	AI_Output (other, self, "DIA_Matteo_WarumNichtBeiDir_15_00"); //A pro� m� do u�en� nep�ijme� TY?
	AI_Output (self, other, "DIA_Matteo_WarumNichtBeiDir_09_01"); //R�d bych - ale museli by s t�m souhlasit i ostatn� mist�i.
	AI_Output (self, other, "DIA_Matteo_WarumNichtBeiDir_09_02"); //Ned�vno jsem p�ijal jin�ho u�edn�ka.
};	

// ************************************************************
// 			  				Andere M�glichkeie 			E5
// ************************************************************
INSTANCE DIA_Matteo_OtherWay (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 6;
	condition	= DIA_Matteo_OtherWay_Condition;
	information	= DIA_MAtteo_OtherWay_Info;
	permanent	= FALSE;
	description = "Existuje i jin� zp�sob, jak se dostat do horn� �tvrti?";
};                       
FUNC INT DIA_Matteo_OtherWay_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HowCanYouHelp))
	&& (Mil_305_schonmalreingelassen == FALSE)
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_OtherWay_Info()
{	
	AI_Output (other, self, "DIA_Matteo_OtherWay_15_00"); //Existuje i jin� zp�sob, jak se dostat do horn� �tvrti?
	AI_Output (self, other, "DIA_Matteo_OtherWay_09_01"); //Snad ano - jestli na n�co p�ijdu, d�m ti v�d�t.
};	

// ************************************************************
// 		Minenanteil
// ************************************************************
INSTANCE DIA_Matteo_Minenanteil (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_Minenanteil_Condition;
	information	= DIA_MAtteo_Minenanteil_Info;

	description = "Ve tv�m zbo�� vid�m i n�jak� d�ln� akcie.";
};   
                    
FUNC INT DIA_Matteo_Minenanteil_Condition()
{	
	if (other.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Matteo_SellWhat))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Matteo_Minenanteil_Info()
{	
	AI_Output (other, self, "DIA_Matteo_Minenanteil_15_00"); //Mezi tv�m zbo��m vid�m i n�jak� d�ln� akcie. Kdo ti je prodal?
	AI_Output (self, other, "DIA_Matteo_Minenanteil_09_01"); //(nerv�zn�) D�ln� akcie? Jejda, kde se tu vzaly? Nem�m pon�t�, jak jsem k nim p�i�el. �estn� slovo, na mou du�i.
	B_GivePlayerXP (XP_Ambient);
};	





































