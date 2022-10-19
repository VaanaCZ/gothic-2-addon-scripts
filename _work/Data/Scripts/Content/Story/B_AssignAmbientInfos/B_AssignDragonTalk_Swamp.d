// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_Dragon_Swamp_Exit(C_INFO)
{
	
	nr			= 999;
	condition	= DIA_Dragon_Swamp_Exit_Condition;
	information	= DIA_Dragon_Swamp_Exit_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dragon_Swamp_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Dragon_Swamp_Exit_Info()
{	
	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 

	AI_Output			(self, other, "DIA_Dragon_Swamp_Exit_20_00"); //Moc Oka je vyèerpána. Nit tvého života tady konèí, èlovêèe.

	Swampdragon = Hlp_GetNpc (dragon_swamp);

	Swampdragon.flags = 0;

	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;

	if (DJG_SwampParty_GoGoGo == TRUE)
	{
		if (DJG_SwampParty == TRUE) 
		&& (Npc_IsDead(DJG_Cipher) == FALSE)
		{
			B_StartOtherRoutine	(DJG_Rod,"SwampDragon");
		};
		B_StartOtherRoutine	(DJG_Cipher,"SwampDragon");
	};

	if (DJG_Biff_Stay == TRUE)
	{
		B_StartOtherRoutine (Biff,"Follow");
		DJG_Biff_Stay = FALSE;
	};
};

// *************************************************************************
// 									Hello
// *************************************************************************
INSTANCE DIA_Dragon_Swamp_Hello(C_INFO)
{
	nr			= 5;
	condition	= DIA_Dragon_Swamp_Hello_Condition;
	information	= DIA_Dragon_Swamp_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Dragon_Swamp_Hello_Condition()
{
	if (Npc_HasItems (other,ItMi_InnosEye_MIS) >= 1)
	{
		return 1;
	};	
};

FUNC VOID DIA_Dragon_Swamp_Hello_Info()
{	
	AI_Output			(self, other, "DIA_Dragon_Swamp_Hello_20_00"); //Èekají tê jen samé potíže, jestli se odvážíš ještê o krok blíž!

	if (Mis_KilledDragons == 0)
		{
			AI_Output	(other, self, "DIA_Dragon_Swamp_Hello_15_01"); //Ach. Vypadá to, že Innosovo oko funguje.
		};
	AI_Output			(self, other, "DIA_Dragon_Swamp_Hello_20_02"); //Už pâišli mnozí z tvého druhu. Všechny jsem je smetl z povrchu zemského.
	AI_Output			(other, self, "DIA_Dragon_Swamp_Hello_15_03"); //Šetâi si dech. Tvá velká slova mê nemohou vydêsit, ty smrdutý zplozenèe pekel.
	AI_Output			(other, self, "DIA_Dragon_Swamp_Hello_15_04"); //Âekni mi, co chci vêdêt, nebo tê utopím ve tvé vlastní krvi.
	AI_Output			(self, other, "DIA_Dragon_Swamp_Hello_20_05"); //Ha, ha, ha. Opovažuješ se mi vyhrožovat, bídný èerve? Âekni mi jeden jediný dùvod, proè bych tê hned teë nemêl rozsekat na tisíc kouskù.
	AI_Output			(other, self, "DIA_Dragon_Swamp_Hello_15_06"); //Jsem Innosùv posel a mám u sebe posvátné Innosovo oko. Nemáš na výbêr. Musíš se podrobit mé vùli, nebo budeš znièen.
	AI_Output			(self, other, "DIA_Dragon_Swamp_Hello_20_07"); //(âve) Arrh. Âekni, co ode mê chceš.
};


///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Swamp_WERBISTDU		(C_INFO)
{
	nr		 = 	6;
	condition	 = 	DIA_Dragon_Swamp_WERBISTDU_Condition;
	information	 = 	DIA_Dragon_Swamp_WERBISTDU_Info;

	description	 = 	"Kdo jsi?";
};

func int DIA_Dragon_Swamp_WERBISTDU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Swamp_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Swamp_WERBISTDU_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Swamp_WERBISTDU_15_00"); //Kdo jsi?
	AI_Output			(self, other, "DIA_Dragon_Swamp_WERBISTDU_20_01"); //Jmenuju se Pandrodor. A mêl bys sis dobâe rozmyslet, jestli nebude lepší zalézt zpêt mezi skály, odkud jsi pâišel.
	
};


///////////////////////////////////////////////////////////////////////
//	Info WoSindDieAnderen
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Swamp_WOSINDDIEANDEREN		(C_INFO)
{
	nr		 = 	7;
	condition	 = 	DIA_Dragon_Swamp_WOSINDDIEANDEREN_Condition;
	information	 = 	DIA_Dragon_Swamp_WOSINDDIEANDEREN_Info;

	description	 = 	"Kde najdu zbytek tobê podobných odporných stvoâení?";
};

func int DIA_Dragon_Swamp_WOSINDDIEANDEREN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Swamp_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Swamp_WOSINDDIEANDEREN_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Swamp_WOSINDDIEANDEREN_15_00"); //Kde najdu zbytek tobê podobných odporných stvoâení?
	AI_Output			(self, other, "DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_01"); //Elementy, z nichž bylo vše stvoâeno, drží tento svêt pohromadê.
	AI_Output			(self, other, "DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_02"); //Každý z nich vyjadâuje schopnost ovládat èást svêta.
	AI_Output			(self, other, "DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_03"); //Hledej elementy a nalezneš všechny ostatní.
};



//**********************************************************************************
//		B_AssignDragonTalk_Swamp
//**********************************************************************************

FUNC VOID B_AssignDragonTalk_Swamp (var c_NPC slf)
{
	DIA_Dragon_Swamp_EXIT.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Swamp_Hello.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Swamp_WERBISTDU.npc			= Hlp_GetInstanceID(slf);
	DIA_Dragon_Swamp_WOSINDDIEANDEREN.npc	= Hlp_GetInstanceID(slf);

	//Die Drachenfragen
	B_AssignDragonTalk_Main (slf);
};








