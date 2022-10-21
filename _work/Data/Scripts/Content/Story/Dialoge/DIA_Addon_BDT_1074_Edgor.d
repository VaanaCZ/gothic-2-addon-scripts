var int Edgor_Exiteinmal;

INSTANCE DIA_Addon_Edgor_EXIT   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 999;
	condition   = DIA_Addon_Edgor_EXIT_Condition;
	information = DIA_Addon_Edgor_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Edgor_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Edgor_EXIT_Info()
{
	if Npc_KnowsInfo (other, DIA_Addon_Edgor_MIS2)
	&& (Edgor_Exiteinmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Edgor_EXIT_06_00"); //R�d jsem t� poznal.
		Edgor_Exiteinmal = TRUE;
	};
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Edgor_PICKPOCKET (C_INFO)
{
	npc			= BDT_1074_Addon_Edgor;
	nr			= 900;
	condition	= DIA_Addon_Edgor_PICKPOCKET_Condition;
	information	= DIA_Addon_Edgor_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Edgor_PICKPOCKET_Condition()
{
	C_Beklauen (10, 7);
};
 
FUNC VOID DIA_Addon_Edgor_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Edgor_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Edgor_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Edgor_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Edgor_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Edgor_PICKPOCKET_DoIt);
};

func void DIA_Addon_Edgor_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	B_Say (self, self, "$AWAKE");
	Info_ClearChoices (DIA_Addon_Edgor_PICKPOCKET);
};
	
func void DIA_Addon_Edgor_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Edgor_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Hi   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 2;
	condition   = DIA_Addon_Edgor_Hi_Condition;
	information = DIA_Addon_Edgor_Hi_Info;
	permanent   = FALSE;
	description = "Jak se vede?";
};
FUNC INT DIA_Addon_Edgor_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Edgor_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Hi_15_00"); //Jak to jde?
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_01"); //Chce� v�d�t, jak to jde? Tak j� ti to teda pov�m.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_02"); //Nap�ed m� sem jedn� bou�liv� noci p�ivlekli pir�ti. �ove�e, blil jsem jak Al�k, to teda jo!
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_03"); //Pak Havran zav�el d�l, proto�e ��c� mago�i byli moc zlatachtiv�.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_04"); //A pak se stal velitelem lovc� Franco - zabil ka�d�ho, kdo byl proti n�mu.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_05"); //�ek bych, �e p�kn� blb�.

	if (SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry (TOPIC_Addon_RavenKDW, LogText_Addon_RavensGoldmine); 
		Log_AddEntry (TOPIC_Addon_Sklaven, LogText_Addon_RavensGoldmine); 
		B_LogEntry (TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};

	SC_KnowsRavensGoldmine = TRUE;
};
//---------------------------------------------------------------------
//	Franco
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Franco (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 2;
	condition   = DIA_Addon_Edgor_Franco_Condition;
	information = DIA_Addon_Edgor_Franco_Info;
	permanent   = FALSE;
	description = "Jak se Franco stal velitelem?";
};
FUNC INT DIA_Addon_Edgor_Franco_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Edgor_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Franco_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Franco_15_00"); //Jak se stal Franco velitelem?
	AI_Output (self, other, "DIA_Addon_Edgor_Franco_06_01"); //Jednodu�e � prost� zabil sv�ho p�edch�dce Fletchera.
	AI_Output (self, other, "DIA_Addon_Edgor_Franco_06_02"); //Fletcher byl fajn, ale Franco si na n�s furt vymej�l� pitomosti.
};	

//---------------------------------------------------------------------
//	Info MIS2
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_MIS2   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 4;
	condition   = DIA_Addon_Edgor_MIS2_Condition;
	information = DIA_Addon_Edgor_MIS2_Info;
	permanent   = FALSE;
	description = "Franco m� poslal pro n�jakou kamennou tabulku.";
};
FUNC INT DIA_Addon_Edgor_MIS2_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Edgor_Hi)
	&& (MIS_HlpEdgor == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_MIS2_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_MIS2_15_00"); //Franco m� sem poslal pro kamennou tabulku, na�el jsi ji?
	AI_Output (self, other, "DIA_Addon_Edgor_MIS2_06_01"); //���e, po t� jsem se ani nekoukal. V�m akor�t, �e m� bejt v ��k� star� budov� hluboko v ba�in�ch.
	AI_Output (self, other, "DIA_Addon_Edgor_MIS2_06_02"); //A vnit�n� hlas mi ��k� 'Edgore, dr� se vod t�ch starejch budov v ba�in�ch co nejd�l'.
	AI_Output (self, other, "DIA_Addon_Edgor_MIS2_06_03"); //Rozhodn� nebudu riskovat krk pro takovou pijavici, jako je Franco.
	
	B_LogEntry (Topic_Addon_Stoneplate,"Edgor se k t� kamenn� tabulce nikdy nedostal, ale podle n�j se nach�z� kdesi ve star� budov� v ba�in�.");
};
//---------------------------------------------------------------------
//	Info Wegbeschreibung
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Weg   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 4;
	condition   = DIA_Addon_Edgor_Weg_Condition;
	information = DIA_Addon_Edgor_Weg_Info;
	permanent   = FALSE;
	description = "Kde p�esn� ta star� budova je?";
};
FUNC INT DIA_Addon_Edgor_Weg_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Edgor_MIS2)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Weg_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Weg_15_00"); //Kde p�esn� m� ta star� budova b�t?
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_01"); //B� doleva p�es tady ten velkej k�men a za chv�li naraz� na dal�� �utr�k.
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_02"); //Za n�m zabo� doleva. V�c nev�m, u� je to d�sn� dlouho.
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_03"); //Ale ty rozvaliny by m�ly bejt n�kde vej�, akor�t je to v�ecko zarostl�, tak�e to nen� vid�t.
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_04"); //Snad bude� m�t �t�st� a najde� to.
};
//---------------------------------------------------------------------
//	Info Found
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Found   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 4;
	condition   = DIA_Addon_Edgor_Found_Condition;
	information = DIA_Addon_Edgor_Found_Info;
	permanent   = FALSE;
	description = "Na�el jsem tu kamennou tabulku!";
};
FUNC INT DIA_Addon_Edgor_Found_Condition()
{	
	if (Npc_HasItems (other,ItMi_Addon_Stone_04) >= 1)
	&& !Npc_IsDead (Franco)
	&& (MIS_HlpEdgor == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Found_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Found_15_00");//Na�el jsem tu kamennou tabulku!
	AI_Output (self, other, "DIA_Addon_Edgor_Found_06_01");//(znud�n�) V�n�? To se� teda fakt state�nej.
	AI_Output (self, other, "DIA_Addon_Edgor_Found_06_02");//(znud�n�) Tak to sis ur�it� zaslou�il cestu do t�bora. (z�v�)
};
//---------------------------------------------------------------------
//	Info Teach
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Teach   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 9;
	condition   = DIA_Addon_Edgor_Teach_Condition;
	information = DIA_Addon_Edgor_Teach_Info;
	permanent   = FALSE;
	description = "M��e� m� n��emu nau�it?";
};
FUNC INT DIA_Addon_Edgor_Teach_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Edgor_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Teach_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Teach_15_00");//M��e� m� n�co nau�it?
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_01");//O krvavejch mouch�ch v�m fakt dost. Tu mizernou hav� snad nesn��m je�t� v�c ne� Franca!
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_02");//Ale v�m, jak z jejich t�l vynd�vat �ihadla a k��dla. (��len�) Jo, po��dn� je roztrhat!
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_03");//Krom toho dok�u z�skat i v�m�ek z jejich �ihadel.
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_04");//Jestli chce�, m��u t� tyhle f�gle nau�it.
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_05");//Ale ani ku�e zadarmo nehrabe, to je ti douf�m jasn�.
	
	Log_CreateTopic (Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry 	(Topic_Addon_BDT_Teacher,"Edgor v� spoustu v�c� o krvav�ch mouch�ch a o tom, jak z nich z�sk�vat trofeje.");	
	Edgor_Teach = TRUE;
};
FUNC VOID B_Edgor_NotEnoughGold()
{
	AI_Output (self, other, "DIA_Addon_Edgor_NotEnoughGold_06_00");//Nap�ed vysol zlato. A t�m mysl�m poctiv� mince, o nuggety nestoj�m.
};
//---------------------------------------------------------------------
//	Info Train (Bloodflys)
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_TrainStart   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 9;
	condition   = DIA_Addon_Edgor_Start_Condition;
	information = DIA_Addon_Edgor_Start_Info;
	permanent   = TRUE;
	description = "K t�m krvav�m mouch�m...";
};
FUNC INT DIA_Addon_Edgor_Start_Condition()
{	
	if (Edgor_Teach == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Start_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_SEKRET_15_00");//K t�m krvav�m mouch�m...
	AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_SEKRET_06_01");//Co chce� v�d�t?
	
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
	Info_AddChoice    (DIA_Addon_Edgor_TrainStart,DIALOG_BACK,DIA_Addon_Edgor_TrainStart_BACK);
	
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
	{ 
		Info_AddChoice    (DIA_Addon_Edgor_TrainStart, "Vyjmut� �ihadel krvav�ch much (Cena: 5 VB, 100 zlat�ch)",DIA_Addon_Edgor_TrainStart_Sting);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
	{ 
		Info_AddChoice 	  (DIA_Addon_Edgor_TrainStart, "Vyjmut� k��del krvav�ch much (Cena: 5 VB, 100 zlat�ch)",DIA_Addon_Edgor_TrainStart_Wing);
	};
	if (Knows_Bloodfly == FALSE)
	{
		Info_AddChoice 	  (DIA_Addon_Edgor_TrainStart,"Z�sk�n� jedu ze �ihadla (Cena: 1 VB, 100 zlat�ch)",DIA_Addon_Edgor_TrainStart_GIFT);
	};
};	
FUNC VOID DIA_Addon_Edgor_TrainStart_BACK()
{
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
};
FUNC VOID DIA_Addon_Edgor_TrainStart_Sting()
{
	if B_GiveInvItems (other, self, ItmI_Gold, 100)
	{
		if B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFSting)
		{
			AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_Sting_15_00");//Jak vyjmu krvav�m mouch�m �ihadla?
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_Sting_06_01");//Obr�t� tu mrtvou mrchu na b�icho a k��ov�m �ezem ji otev�e�. Chytne� vnit�nosti a pro��zne� celou tk�� na z�dech.
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_Sting_06_02");//Pak sta�� jen �kubnout a �ihadlo je venku.
		};
	}
	else
	{
		B_Edgor_NotEnoughGold();
	};
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
};
FUNC VOID DIA_Addon_Edgor_TrainStart_Wing()
{
	if B_GiveInvItems (other, self, ItmI_Gold, 100)
	{
		if B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFWing)
		{
			AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_Wing_15_00");//Jak z�sk�m k��dla?
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_Wing_06_01");//Jednou rukou popadni k��dla a druhou je od��zni pod�l svrchn� vrstvy k��e.
		};
	}
	else
	{
		B_Edgor_NotEnoughGold();
	};
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
};	
FUNC VOID DIA_Addon_Edgor_TrainStart_GIFT()
{
	if B_GiveInvItems (other, self, ItmI_Gold, 100)
	{
		if (other.lp >= 1)
		{
			AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_GIFT_15_00");//Jak z�sk�m v�m�ek z �ihadel krvav�ch much?
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_GIFT_06_01");//Shora �ihadlo po d�lce na��zni a l��iv� v�m�ek hned vyte�e.
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_GIFT_06_02");//Tak m��e� ze �ihadla bezpe�n� v�ecko vyslopnout � nebo to p�idat do n�jak�ho lektvaru.
			
			other.lp = (other.lp - 1);
			Knows_Bloodfly = TRUE; 
			PrintScreen (PRINT_ADDON_KNOWSBF, -1, -1, FONT_Screen, 2);
		}
		else
		{
			PrintScreen	(PRINT_NotEnoughLP, -1, -1, FONT_Screen, 2);
			B_Say (self, other, "$NOLEARNNOPOINTS");
		};
	}
	else
	{
		B_Edgor_NotEnoughGold();
	};
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
};		


